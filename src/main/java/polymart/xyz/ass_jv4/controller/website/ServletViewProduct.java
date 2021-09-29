package polymart.xyz.ass_jv4.controller.website;

import polymart.xyz.ass_jv4.entity.EntityProduct;
import polymart.xyz.ass_jv4.service.IServiceAttribute;
import polymart.xyz.ass_jv4.service.IServiceBrand;
import polymart.xyz.ass_jv4.service.IServiceCategory;
import polymart.xyz.ass_jv4.service.IServiceProduct;
import polymart.xyz.ass_jv4.service.implement.ServiceAttribute;
import polymart.xyz.ass_jv4.service.implement.ServiceBrand;
import polymart.xyz.ass_jv4.service.implement.ServiceCategory;
import polymart.xyz.ass_jv4.service.implement.ServiceProduct;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ServletViewProduct", value = {"/product", "/product/view", "/brand", "/category"})
public class ServletViewProduct extends HttpServlet {

    private IServiceProduct _iServiceProduct;
    private IServiceCategory _iServiceCategory;
    private IServiceBrand _iServiceBrand;
    private IServiceAttribute _iServiceAttribute;

    @Override
    public void init() throws ServletException {
        _iServiceProduct = new ServiceProduct();
        _iServiceCategory = new ServiceCategory();
        _iServiceBrand = new ServiceBrand();
        _iServiceAttribute = new ServiceAttribute();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setAttribute("lstNewProduct", _iServiceProduct.findNewProduct());
        request.setAttribute("lstAttribute", _iServiceAttribute.findAll());

        String name = request.getParameter("name");
        if (name != null) {
            List<EntityProduct> lst = new ArrayList<>();
            for (EntityProduct x : _iServiceProduct.findAll()) {
                if (x.getName().toLowerCase().contains(name.toLowerCase())) {
                    lst.add(x);
                }
            }
            request.setAttribute("lstNewProduct", lst);
        } else {
            String url = request.getRequestURI();
            String id = request.getParameter("id");
            if (url.contains("/product")) {
                if (id != null) {
                    EntityProduct entityProduct = _iServiceProduct.findById(id);
                    if (entityProduct != null) {
                        request.setAttribute("lstRandom", _iServiceProduct.findRandomProduct());
                        request.setAttribute("product", entityProduct);
                        request.getRequestDispatcher("/views/website/page/views/home.jsp").forward(request, response);
                        return;
                    } else {
                        response.sendRedirect(request.getContextPath() + "/product");
                        return;
                    }
                }
                String min = request.getParameter("min");
                String max = request.getParameter("max");
                if (min != null && !min.trim().equals("") && max != null && !max.trim().equals("")) {
                    request.setAttribute("lstNewProduct", _iServiceProduct.findByMinAndMax(min, max));
                }
            } else if (url.contains("/brand")) {
                if (id != null) {
                    request.setAttribute("lstNewProduct", _iServiceProduct.findByIdBrand(id));
                }
            } else if (url.contains("/category")) {
                if (id != null) {
                    request.setAttribute("lstNewProduct", _iServiceProduct.findByIdCategory(id));
                }
            }
        }
        request.getRequestDispatcher("/views/website/page/list/home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
