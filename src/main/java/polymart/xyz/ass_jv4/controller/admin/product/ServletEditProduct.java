package polymart.xyz.ass_jv4.controller.admin.product;

import org.apache.commons.beanutils.BeanUtils;
import polymart.xyz.ass_jv4.entity.EntityBrand;
import polymart.xyz.ass_jv4.entity.EntityCategory;
import polymart.xyz.ass_jv4.entity.EntityProduct;
import polymart.xyz.ass_jv4.service.IServiceBrand;
import polymart.xyz.ass_jv4.service.IServiceCategory;
import polymart.xyz.ass_jv4.service.IServiceProduct;
import polymart.xyz.ass_jv4.service.implement.ServiceBrand;
import polymart.xyz.ass_jv4.service.implement.ServiceCategory;
import polymart.xyz.ass_jv4.service.implement.ServiceProduct;
import polymart.xyz.ass_jv4.utils.BeanModelUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;

@WebServlet(name = "ServletEditProduct", value = {"/admin/product/edit", "/admin/product/edit/"})
public class ServletEditProduct extends HttpServlet {

    private IServiceBrand _iServiceBrand;
    private IServiceProduct _iServiceProduct;
    private IServiceCategory _iServiceCategory;
    private EntityProduct _entityProduct;

    @Override
    public void init() throws ServletException {
        _iServiceCategory = new ServiceCategory();
        _iServiceBrand = new ServiceBrand();
        _iServiceProduct = new ServiceProduct();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        if (id != null && !id.trim().equals("")) {
            _entityProduct = _iServiceProduct.findById(id);
            if (_entityProduct != null) {
                request.setAttribute("product", _entityProduct);
                request.setAttribute("lstBrand", _iServiceBrand.findAll());
                request.setAttribute("lstCategory", _iServiceCategory.findAll());
                request.getRequestDispatcher("/views/admin/page/product/editProduct.jsp").forward(request, response);
                return;
            }
        }
        response.sendRedirect(request.getContextPath() + "/admin/product/quan-ly-san-pham");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        EntityProduct modelProduct = _entityProduct;
        try {
            BeanUtils.populate(modelProduct, request.getParameterMap());
            String idCatregory = request.getParameter("category");
            String idBrand = request.getParameter("brand");
            if (idCatregory != null && Integer.parseInt(idCatregory) > 0) {
                EntityCategory entityCategory = _iServiceCategory.findById(idCatregory);
                if (entityCategory != null) {
                    modelProduct.setEntityCategory(entityCategory);
                }
            }
            if (idBrand != null && Integer.parseInt(idBrand) > 0) {
                EntityBrand entityBrand = _iServiceBrand.findById(idBrand);
                if (entityBrand != null) {
                    modelProduct.setEntityBrand(entityBrand);
                }
            }
            if (_iServiceProduct.updateProduct(modelProduct)) {
                response.sendRedirect(request.getContextPath() + "/admin/product/quan-ly-san-pham");
                return;
            } else {
                request.setAttribute("addProductError", "Sửa thông tin sản phẩm thất bại");
            }
            request.setAttribute("product", modelProduct);
            request.setAttribute("lstBrand", _iServiceBrand.findAll());
            request.setAttribute("lstCategory", _iServiceCategory.findAll());
        } catch (InvocationTargetException | IllegalAccessException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("/views/admin/page/product/editProduct.jsp").forward(request, response);
    }
}
