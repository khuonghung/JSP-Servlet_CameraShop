package polymart.xyz.ass_jv4.controller.admin.brand;

import polymart.xyz.ass_jv4.entity.EntityBrand;
import polymart.xyz.ass_jv4.service.IServiceBrand;
import polymart.xyz.ass_jv4.service.implement.ServiceBrand;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Locale;

@WebServlet(name = "ServletBrandHome", value = {"/admin/brand/quan-ly-thuong-hieu", "/admin/brand/quan-ly-thuong-hieu/", "/admin/brand/", "/admin/brand"})
public class ServletBrandHome extends HttpServlet {

    private IServiceBrand _iServiceBrand;

    @Override
    public void init() throws ServletException {
        _iServiceBrand = new ServiceBrand();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String remove = request.getParameter("remove");
        String id = request.getParameter("id");
        if (remove != null && remove.toLowerCase(Locale.ROOT).equals("true") && id != null) {
            EntityBrand modelBrand = _iServiceBrand.findById(id);
            if (modelBrand != null) {
                modelBrand.setRemoved(true);
                if (!_iServiceBrand.updateBrand(modelBrand)) {
                    request.setAttribute("errorBrand", "Xoá thương hiệu thất bại");
                } else {
                    response.sendRedirect(request.getContextPath() + "/admin/brand/quan-ly-thuong-hieu");
                    return;
                }
            } else {
                request.setAttribute("errorBrand", "Thương hiệu không tồn tại");
            }
        }

        request.setAttribute("lstBrand", _iServiceBrand.findAll());
        request.getRequestDispatcher("/views/admin/page/brand/home.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
