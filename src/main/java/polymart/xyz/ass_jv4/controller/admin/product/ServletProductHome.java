package polymart.xyz.ass_jv4.controller.admin.product;

import polymart.xyz.ass_jv4.entity.EntityProduct;
import polymart.xyz.ass_jv4.service.IServiceProduct;
import polymart.xyz.ass_jv4.service.implement.ServiceProduct;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletProductHome", value = {"/admin/product/quan-ly-san-pham", "/admin/product/quan-ly-san-pham/", "/admin/product/", "/admin/product"})
public class ServletProductHome extends HttpServlet {

    private IServiceProduct _iServiceProduct;

    @Override
    public void init() throws ServletException {
        _iServiceProduct = new ServiceProduct();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String remove = request.getParameter("remove");
        String status = request.getParameter("status");
        String id = request.getParameter("id");

        if (remove != null && id != null && remove.equals("true")) {
            EntityProduct modelProduct = _iServiceProduct.findById(id);
            if (modelProduct != null) {
                modelProduct.setRemoved(true);
                if (_iServiceProduct.updateProduct(modelProduct)) {
                    response.sendRedirect(request.getContextPath() + "/admin/product/quan-ly-san-pham");
                    return;
                } else {
                    request.setAttribute("errorProduct", "Xoá sản phẩm thất bại");
                }
            }
        } else if (status != null && id != null) {
            EntityProduct modelProduct = _iServiceProduct.findById(id);
            if (modelProduct != null) {
                if (status.equals("true")) {
                    modelProduct.setStatus(true);
                    if (_iServiceProduct.updateProduct(modelProduct)) {
                        response.sendRedirect(request.getContextPath() + "/admin/product/quan-ly-san-pham");
                        return;
                    } else {
                        request.setAttribute("errorProduct", "Kích hoạt trạng thái kinh doanh thất bại");
                    }
                } else if (status.equals("false")) {
                    System.out.println("avc");
                    modelProduct.setStatus(false);
                    if (_iServiceProduct.updateProduct(modelProduct)) {
                        response.sendRedirect(request.getContextPath() + "/admin/product/quan-ly-san-pham");
                        return;
                    } else {
                        request.setAttribute("errorProduct", "Kích hoạt trạng thái ngừng kinh doanh thất bại");
                    }
                }
            }
            System.out.println(modelProduct);
        }

        request.setAttribute("lstProduct", _iServiceProduct.findAll());
        request.getRequestDispatcher("/views/admin/page/product/home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
