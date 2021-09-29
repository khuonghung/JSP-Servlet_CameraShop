package polymart.xyz.ass_jv4.controller.website;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import org.apache.commons.beanutils.BeanUtils;
import polymart.xyz.ass_jv4.entity.*;
import polymart.xyz.ass_jv4.service.*;
import polymart.xyz.ass_jv4.service.implement.*;
import polymart.xyz.ass_jv4.utils.CookieUtils;
import polymart.xyz.ass_jv4.utils.SessionUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

import static java.lang.Thread.sleep;

@WebServlet(name = "ServletCheckout", value = {"/checkout", "/payment/order"})
public class ServletCheckout extends HttpServlet {

    private IServiceVoucher _iServiceVoucher;
    private IServiceVisit _iServiceVisit;
    private IServicePayment _iServicePayment;
    private IServiceProductDetails _iServiceProductDetails;
    private IServicePaymentDetails _iServicePaymentDetails;

    @Override
    public void init() throws ServletException {
        _iServiceVoucher = new ServiceVoucher();
        _iServiceVisit = new ServiceVisit();
        _iServiceProductDetails = new ServiceProductDetails();
        _iServicePaymentDetails = new ServicePaymentDetails();
        _iServicePayment = new ServicePayment();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String voucher = SessionUtils.getSessionUtils().getSessionString("voucher", request);
        if (voucher != null && !voucher.trim().equals("")) {
            EntityVoucher entityVoucher = _iServiceVoucher.findById(voucher);
            if (entityVoucher != null) {
                request.setAttribute("discountVoucher", entityVoucher.getPriceSale());
            }
        }
        request.getRequestDispatcher("/views/website/page/cart/checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = request.getRequestURI();
        if (url.contains("/checkout")) {
            String voucher = request.getParameter("voucher");
            String getLoginPhoneNumber = request.getParameter("login-phoneNumber");
            String getLoginPassword = request.getParameter("login-password");
            if (getLoginPhoneNumber != null && getLoginPassword != null) {
                EntityVisit entityVisit = _iServiceVisit.findByPhoneAnhPassword(getLoginPhoneNumber, getLoginPassword);
                if (entityVisit != null) {
                    SessionUtils.getSessionUtils().saveSessionModel("visit", entityVisit, request);
                    response.sendRedirect(request.getContextPath() + "/visit?login-visit=true");
                    return;
                }
                response.sendRedirect(request.getContextPath() + "/visit?login-visit=false");
                return;
            }
            if (voucher != null) {
                EntityVoucher entityVoucher = _iServiceVoucher.findById(voucher);
                SessionUtils.getSessionUtils().saveSession("voucher", voucher, request);
                if (entityVoucher != null) {
                    response.sendRedirect(request.getContextPath() + "/voucher?checkout-voucher=true");
                    return;
                }
                response.sendRedirect(request.getContextPath() + "/voucher?checkout-voucher=false");
                return;
            }
        } else if (url.contains("/payment/order")) {
            EntityVisit entityVisit = new EntityVisit();
            try {
                // get thông tin khách hàng
                BeanUtils.populate(entityVisit, request.getParameterMap());
                EntityVisit checkEntityVisit = _iServiceVisit.findByPhone(entityVisit.getPhoneNumber());

                // lấy voucher sử dụng (nếu có)
                EntityPayment entityPayment = new EntityPayment();
                BeanUtils.populate(entityPayment, request.getParameterMap());
                String idVoucher = SessionUtils.getSessionUtils().getSessionString("voucher", request);
                if (idVoucher != null) {
                    EntityVoucher entityVoucher = _iServiceVoucher.findById(idVoucher);
                    if (entityVoucher != null) {
                        entityPayment.setEntityVoucher(entityVoucher);
                    }
                }

                // lấy danh sách giỏ hàng
                List<EntityProductDetails> lstProductDetails = new ArrayList<>();
                EntityProductDetails entityProductDetails;
                String cart = CookieUtils.getCookieUtils().getCookieUtils("cart", request);
                String[] arrCart = cart.split("c");
                String[] arrId = new String[arrCart.length];
                String[] arrQuantity = new String[arrCart.length];
                if (cart != null && !cart.trim().equals("")) {
                    String id = "";
                    String quantity = "";
                    for (int i = 0; i < arrCart.length; i++) {
                        id = arrCart[i].substring(0, arrCart[i].lastIndexOf("-"));
                        quantity = arrCart[i].substring(arrCart[i].lastIndexOf("-") + 1);
                        arrId[i] = id;
                        arrQuantity[i] = quantity;
                    }
                    for (int i = 0; i < arrId.length; i++) {
                        entityProductDetails = _iServiceProductDetails.findById(arrId[i]);
                        if (entityProductDetails != null) {
                            try {
                                lstProductDetails.add(entityProductDetails);
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }
                    }
                }

                // tính tổng tiền hoá đơn
                Long paymentAmount = Long.parseLong("0");
                for (int i = 0; i < lstProductDetails.size(); i++) {
                    paymentAmount += (lstProductDetails.get(i).getPrice() - (lstProductDetails.get(i).getPrice()
                            * lstProductDetails.get(i).getEntityProduct().getPersenSale() / 100)) * Integer.parseInt(arrQuantity[i]);
                }
                if (entityPayment.getEntityVoucher() != null) {
                    paymentAmount -= entityPayment.getEntityVoucher().getPriceSale();
                }
                entityPayment.setPaymentAmount(paymentAmount);


                if (checkEntityVisit != null) {
                    // lấy số điện thoại khách hàng
                    if (entityVisit.getPassword() == null || entityVisit.getPassword().trim().equals("")) {
                        entityVisit.setPassword(checkEntityVisit.getPassword());
                    }
                    if (_iServiceVisit.updateVisit(entityVisit)) {
                        entityPayment.setEntityVisit(checkEntityVisit);
                        savePayment(request, response, entityVisit, entityPayment, lstProductDetails, paymentAmount, arrQuantity);
                        return;
                    }
                } else {
                    if (_iServiceVisit.newVisit(entityVisit)) {
                        checkEntityVisit = _iServiceVisit.findByPhone(entityVisit.getPhoneNumber());
                        if (checkEntityVisit != null) {
                            // lấy số điện thoại khách hàng
                            entityPayment.setEntityVisit(checkEntityVisit);
                            savePayment(request, response, entityVisit, entityPayment, lstProductDetails, paymentAmount, arrQuantity);
                            return;
                        }
                    }
                }
            } catch (IllegalAccessException | InvocationTargetException e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect(request.getContextPath() + "/checkout");
    }

    private void savePayment(HttpServletRequest request, HttpServletResponse response, EntityVisit entityVisit, EntityPayment entityPayment,
                             List<EntityProductDetails> lstProductDetails, Long paymentAmount, String[] arrQuantity) throws IOException, ServletException {
        EntityProductDetails entityProductDetails;
        if (_iServicePayment.newPayment(entityPayment)) {
            entityPayment = _iServicePayment.findIdPayment(entityVisit, paymentAmount + "");
            if (entityPayment != null) {
                EntityPaymentDetails entityPaymentDetails;
                List<EntityPaymentDetails> lst = new ArrayList<>();
                for (int i = 0; i < lstProductDetails.size(); i++) {
                    entityPaymentDetails = new EntityPaymentDetails();
                    entityPaymentDetails.setEntityPayment(entityPayment);
                    entityPaymentDetails.setEntityProductDetails(lstProductDetails.get(i));
                    entityPaymentDetails.setQuantity(Integer.parseInt(arrQuantity[i]));
                    entityPaymentDetails.setPrice(lstProductDetails.get(i).getPrice() * Integer.parseInt(arrQuantity[i]));
                    entityPaymentDetails.setPriceSale((lstProductDetails.get(i).getPrice() * lstProductDetails.get(i).getEntityProduct().getPersenSale() / 100));
                    _iServicePaymentDetails.newPaymentDetails(entityPaymentDetails);
                    lst.add(entityPaymentDetails);
                }
                entityPayment.setLstEntityPaymentDetails(lst);
                _iServicePayment.updatePayment(entityPayment);
                CookieUtils.getCookieUtils().setCookieUtils("cart", "", response);
                String paymentmethod = request.getParameter("payments");
                if (entityPayment.getEntityVoucher() != null) {
                    if (entityPayment.getEntityVoucher() != null) {
                        entityPayment.getEntityVoucher().setReQuantity(entityPayment.getEntityVoucher().getReQuantity() - 1);
                        _iServiceVoucher.updateVoucher(entityPayment.getEntityVoucher());
                    }
                }
                if (paymentmethod != null) {
                    if (paymentmethod.equals("cod")) {
                        response.sendRedirect(request.getContextPath() + "/order?payment-method=cod");
                        return;
                    } else if (paymentmethod.equals("qrcode")) {
                        request.setAttribute("paymentId", entityPayment.getId());
                        request.setAttribute("totalAmount", paymentAmount);
                        request.getRequestDispatcher("/views/website/page/cart/qrCode.jsp").forward(request, response);
                        return;
                    } else {
                        String vnp_Version = "2.0.0";
                        String vnp_Command = "pay";
                        String vnp_OrderInfo = "Thanh toan don hang test";
                        String orderType = "billpayment";
                        String vnp_TxnRef = entityPayment.getId() + "";
                        String vnp_IpAddr = Config.getIpAddress(request);
                        String vnp_TmnCode = Config.vnp_TmnCode;

                        Long amount = entityPayment.getPaymentAmount() * 100;
                        Map<String, String> vnp_Params = new HashMap<>();
                        vnp_Params.put("vnp_Version", vnp_Version);
                        vnp_Params.put("vnp_Command", vnp_Command);
                        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
                        vnp_Params.put("vnp_Amount", String.valueOf(amount));
                        vnp_Params.put("vnp_CurrCode", "VND");
                        String bank_code = "";
                        if (bank_code != null && bank_code.isEmpty()) {
                            vnp_Params.put("vnp_BankCode", bank_code);
                        }
                        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
                        vnp_Params.put("vnp_OrderInfo", vnp_OrderInfo);
                        vnp_Params.put("vnp_OrderType", orderType);

                        String locate = "vi";
                        if (locate != null && !locate.isEmpty()) {
                            vnp_Params.put("vnp_Locale", locate);
                        } else {
                            vnp_Params.put("vnp_Locale", "vn");
                        }
                        vnp_Params.put("vnp_ReturnUrl", Config.vnp_Returnurl);
                        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

                        Date dt = new Date();
                        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
                        String dateString = formatter.format(dt);
                        String vnp_CreateDate = dateString;
                        String vnp_TransDate = vnp_CreateDate;
                        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

                        //Build data to hash and querystring
                        List fieldNames = new ArrayList(vnp_Params.keySet());
                        Collections.sort(fieldNames);
                        StringBuilder hashData = new StringBuilder();
                        StringBuilder query = new StringBuilder();
                        Iterator itr = fieldNames.iterator();
                        while (itr.hasNext()) {
                            String fieldName = (String) itr.next();
                            String fieldValue = (String) vnp_Params.get(fieldName);
                            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                                //Build hash data
                                hashData.append(fieldName);
                                hashData.append('=');
                                hashData.append(fieldValue);
                                //Build query
                                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                                query.append('=');
                                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));

                                if (itr.hasNext()) {
                                    query.append('&');
                                    hashData.append('&');
                                }
                            }
                        }
                        String queryUrl = query.toString();
                        String vnp_SecureHash = Config.Sha256(Config.vnp_HashSecret + hashData.toString());
                        queryUrl += "&vnp_SecureHashType=SHA256&vnp_SecureHash=" + vnp_SecureHash;
                        String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
                        request.setAttribute("code", "00");
                        request.setAttribute("message", "success");
                        request.setAttribute("data", paymentUrl);
                        response.sendRedirect(paymentUrl);
                        return;
                    }
                }
            }
        }
        request.getRequestDispatcher("/views/website/page/cart/checkout.jsp").forward(request, response);
    }
}
