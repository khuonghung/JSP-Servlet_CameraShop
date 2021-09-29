package polymart.xyz.ass_jv4.controller.website;

import polymart.xyz.ass_jv4.entity.EntityProductDetails;
import polymart.xyz.ass_jv4.service.*;
import polymart.xyz.ass_jv4.service.implement.ServiceBanner;
import polymart.xyz.ass_jv4.service.implement.ServiceBrand;
import polymart.xyz.ass_jv4.service.implement.ServiceCategory;
import polymart.xyz.ass_jv4.service.implement.ServiceProduct;
import polymart.xyz.ass_jv4.utils.CookieUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ServletHomeWebsite", value = {"/trang-chu", "/index.html"})
public class ServletHomeWebsite extends HttpServlet {

    private IServiceBanner _iServiceBanner;
    private IServiceProduct _iServiceProduct;
    private IServiceCategory _iServiceCategory;
    private IServiceBrand _iServiceBrand;

    @Override
    public void init() throws ServletException {
        _iServiceBanner = new ServiceBanner();
        _iServiceProduct = new ServiceProduct();
        _iServiceCategory = new ServiceCategory();
        _iServiceBrand = new ServiceBrand();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setAttribute("lstNewImportProduct", _iServiceProduct.findNewImportProduct());
        request.setAttribute("lstShowBanner", _iServiceBanner.findShowBanner());
        request.setAttribute("lstMostViewProduct", _iServiceProduct.findMostViewedProduct());
        request.setAttribute("lstHotSaleProduct", _iServiceProduct.findHotSaleProduct());
        request.setAttribute("lstNewProduct", _iServiceProduct.findNewProduct());
        request.setAttribute("lstHotProduct", _iServiceProduct.findHotProduct());

        request.getRequestDispatcher("/views/website/home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
