package polymart.xyz.ass_jv4.controller.website;

import polymart.xyz.ass_jv4.entity.EntityProduct;
import polymart.xyz.ass_jv4.entity.EntityProductDetails;
import polymart.xyz.ass_jv4.entity.EntityVoucher;
import polymart.xyz.ass_jv4.service.IServiceProduct;
import polymart.xyz.ass_jv4.service.IServiceProductDetails;
import polymart.xyz.ass_jv4.service.IServiceVoucher;
import polymart.xyz.ass_jv4.service.implement.ServiceProduct;
import polymart.xyz.ass_jv4.service.implement.ServiceProductDetails;
import polymart.xyz.ass_jv4.service.implement.ServiceVoucher;
import polymart.xyz.ass_jv4.utils.CookieUtils;
import polymart.xyz.ass_jv4.utils.SessionUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ServletCart", value = "/cart")
public class ServletCart extends HttpServlet {

    private IServiceVoucher _iServiceVoucher;

    @Override
    public void init() throws ServletException {
        _iServiceVoucher = new ServiceVoucher();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String remove = request.getParameter("remove");
        String getId = request.getParameter("id");
//        CookieUtils.getCookieUtils().setCookieUtils("cart", "33-2c31-4c32-2c34-4c30-2c29-4", response);
//        CookieUtils.getCookieUtils().setCookieUtils("cart", "", response);
        if (remove != null && getId != null && remove.equals("true")) {
            String getCookie = CookieUtils.getCookieUtils().getCookieUtils("cart", request);
            if (getCookie != null && getCookie.contains(getId + "-")) {
                String[] arrCart = getCookie.split("c");
                String newCookie = "";
                for (String x : arrCart) {
                    System.out.println("xoá: " + x);
                    if (!x.contains(getId + "-")) {
                        newCookie += "c" + x;
                    }
                }
                newCookie = newCookie.substring(newCookie.indexOf("c") + 1);
                CookieUtils.getCookieUtils().setCookieUtils("cart", newCookie, response);
                response.sendRedirect(request.getContextPath() + "/cart");
                return;
            }
        }
//        String cookie = CookieUtils.getCookieUtils().getCookieUtils("cart", request);
//        if (cookie != null && !cookie.trim().equals("")) {
//            String[] arrCart = cookie.split("c");
//            String[] arrId = new String[arrCart.length];
//            String[] arrQuantity = new String[arrCart.length];
//            String id = "";
//            String quantity = "";
//            for (int i = 0; i < arrCart.length; i++) {
//                id = arrCart[i].substring(0, arrCart[i].lastIndexOf("-"));
//                quantity = arrCart[i].substring(arrCart[i].lastIndexOf("-") + 1);
//                arrId[i] = id;
//                arrQuantity[i] = quantity;
//            }
//            List<EntityProductDetails> lstProductDetails = new ArrayList<>();
//            EntityProductDetails entityProductDetails;
//            for (int i = 0; i < arrId.length; i++) {
//                entityProductDetails = _iServiceProductDetails.findById(arrId[i]);
//                if (entityProductDetails != null) {
//                    try {
//                        int sl = Integer.parseInt(arrQuantity[i]);
//                        entityProductDetails.setQuantity(sl);
//                        lstProductDetails.add(entityProductDetails);
//                    } catch (Exception e) {
//                        e.printStackTrace();
//                    }
//                }
//            }
//            request.setAttribute("lstCart", lstProductDetails);
//        }

        String voucher = SessionUtils.getSessionUtils().getSessionString("voucher", request);
        if (voucher != null && !voucher.trim().equals("")) {
            EntityVoucher entityVoucher = _iServiceVoucher.findById(voucher);
            if (entityVoucher != null) {
                request.setAttribute("discountVoucher", entityVoucher.getPriceSale());
            }
        }

        request.getRequestDispatcher("/views/website/page/cart/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String voucher = request.getParameter("voucher");
        if (voucher != null) {
            EntityVoucher entityVoucher = _iServiceVoucher.findById(voucher);
            SessionUtils.getSessionUtils().saveSession("voucher", voucher, request);
            if (entityVoucher != null) {
                response.sendRedirect(request.getContextPath() + "/voucher?cart-voucher=true");
                return;
            }
        }
        response.sendRedirect(request.getContextPath() + "/voucher?cart-voucher=false");
    }
}
