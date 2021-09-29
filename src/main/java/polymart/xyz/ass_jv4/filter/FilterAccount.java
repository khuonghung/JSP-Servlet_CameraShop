package polymart.xyz.ass_jv4.filter;

import polymart.xyz.ass_jv4.entity.*;
import polymart.xyz.ass_jv4.service.*;
import polymart.xyz.ass_jv4.service.implement.*;
import polymart.xyz.ass_jv4.utils.CookieUtils;
import polymart.xyz.ass_jv4.utils.SessionUtils;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import static polymart.xyz.ass_jv4.utils.SessionUtils.getSessionUtils;

@WebFilter(filterName = "FilterAccount")
public class FilterAccount implements Filter {

    private IServiceProductDetails _iServiceProductDetails;
    private IServiceProduct _iServiceProduct;
    private IServiceCategory _iServiceCategory;
    private IServiceBrand _iServiceBrand;
    private IServiceVisit _iServiceVisit;
    private IServiceLike _iServiceLike;

    public void init(FilterConfig config) throws ServletException {
        _iServiceProductDetails = new ServiceProductDetails();
        _iServiceProduct = new ServiceProduct();
        _iServiceCategory = new ServiceCategory();
        _iServiceBrand = new ServiceBrand();
        _iServiceVisit = new ServiceVisit();
        _iServiceLike = new ServiceLike();
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request1 = (HttpServletRequest) request;
        HttpServletResponse response1 = (HttpServletResponse) response;
        String url = ((HttpServletRequest) request).getRequestURI();
        System.out.println(url);
        if (url.contains(request1.getContextPath() + "/admin")) {
            if (getModelStaff(request1)) {
                chain.doFilter(request, response);
                return;
            }
            response1.sendRedirect(request1.getContextPath() + "/signin");
        } else if (url.equals(request1.getContextPath() + "/signin") || url.equals(request1.getContextPath() + "/signup")
                || url.equals(request1.getContextPath() + "/forgot-password")) {
            if (getModelStaff(request1)) {
                response1.sendRedirect(request1.getContextPath() + "/account?result=signin-successfully");
                return;
            }
            chain.doFilter(request, response);
        } else {
            String lang = request.getParameter("lang");
            if (lang != null) {
                SessionUtils.getSessionUtils().saveSession("lang", lang, request1);
                response1.sendRedirect(request1.getRequestURI());
                return;
            }
            String cookie = CookieUtils.getCookieUtils().getCookieUtils("cart", request1);
            if (cookie != null && !cookie.trim().equals("")) {
                String[] arrCart = cookie.split("c");
                String[] arrId = new String[arrCart.length];
                String[] arrQuantity = new String[arrCart.length];
                String id = "";
                String quantity = "";
                for (int i = 0; i < arrCart.length; i++) {
                    id = arrCart[i].substring(0, arrCart[i].lastIndexOf("-"));
                    quantity = arrCart[i].substring(arrCart[i].lastIndexOf("-") + 1);
                    arrId[i] = id;
                    arrQuantity[i] = quantity;
                }
                List<EntityProductDetails> lstProductDetails = new ArrayList<>();
                EntityProductDetails entityProductDetails;
                for (int i = 0; i < arrId.length; i++) {
                    entityProductDetails = _iServiceProductDetails.findById(arrId[i]);
                    if (entityProductDetails != null) {
                        try {
                            EntityProductDetails fake = new EntityProductDetails();
                            fake.setId(entityProductDetails.getId());
                            fake.setPrice(entityProductDetails.getPrice());
                            fake.setQuantity(Integer.parseInt(arrQuantity[i]));
                            fake.setEntityAttribute(entityProductDetails.getEntityAttribute());
                            fake.setEntityProduct(entityProductDetails.getEntityProduct());
                            lstProductDetails.add(fake);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
                request1.setAttribute("lstCart", lstProductDetails);
            }
            EntityVisit entityVisit = (EntityVisit) SessionUtils.getSessionUtils().getSessionModel("visit", new EntityVisit(), request1);
            if (entityVisit != null) {
                entityVisit = _iServiceVisit.findByPhone(entityVisit.getPhoneNumber());
                if (entityVisit != null) {
                    request1.setAttribute("visit", entityVisit);
                    Set<Integer> lstLike = new HashSet<>();
                    for (EntityLike x : _iServiceLike.findAll()) {
                        if (x.getEntityVisit().getPhoneNumber().equals(entityVisit.getPhoneNumber())) {
                            lstLike.add(x.getEntityProduct().getId());
                        }
                    }
                    request1.setAttribute("lstLikeByVisit", lstLike);
                } else {
                    SessionUtils.getSessionUtils().removeSession("visit", request1);
                }
            }
            request1.setAttribute("lstCategory", _iServiceCategory.findAll());
            request1.setAttribute("lstBrand", _iServiceBrand.findAll());
            request1.setAttribute("lstTopBuyProduct", _iServiceProduct.findByTopBuy());
            chain.doFilter(request, response);
        }
    }

    private boolean getModelStaff(HttpServletRequest request1) {
        EntityStaff modelStaff = (EntityStaff) getSessionUtils().getSessionModel("user", new EntityStaff(), request1);
        if (modelStaff != null && modelStaff.getEmail() != null) {
            IServiceAccount iServiceAccount = new ServiceAccount();
            modelStaff = iServiceAccount.findByEmail(modelStaff.getEmail());
        }
        return modelStaff != null && modelStaff.isActive() && !modelStaff.isBlocked() && !modelStaff.isRemoved();
    }

}
