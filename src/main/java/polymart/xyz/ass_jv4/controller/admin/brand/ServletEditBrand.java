package polymart.xyz.ass_jv4.controller.admin.brand;

import org.apache.commons.beanutils.BeanUtils;
import polymart.xyz.ass_jv4.entity.EntityBrand;
import polymart.xyz.ass_jv4.service.IServiceBrand;
import polymart.xyz.ass_jv4.service.implement.ServiceBrand;
import polymart.xyz.ass_jv4.utils.BeanModelUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;

@WebServlet(name = "ServletEditBrand", value = "/admin/brand/edit")
public class ServletEditBrand extends HttpServlet {

    private IServiceBrand _iServiceBrand;
    private EntityBrand _entityBrand;

    @Override
    public void init() throws ServletException {
        _iServiceBrand = new ServiceBrand();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        if (id != null && !id.trim().equals("")) {
            _entityBrand = _iServiceBrand.findById(id);
            if (_entityBrand != null) {
                request.setAttribute("brand", _entityBrand);
                request.getRequestDispatcher("/views/admin/page/brand/editBrand.jsp").forward(request, response);
                return;
            }
        }
        response.sendRedirect(request.getContextPath() + "/admin/brand/quan-ly-thuong-hieu");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        EntityBrand entityBrand = new EntityBrand();
        try {
            BeanUtils.populate(entityBrand, request.getParameterMap());
            entityBrand.setId(_entityBrand.getId());
            if (_iServiceBrand.updateBrand(entityBrand)) {
                response.sendRedirect(request.getContextPath() + "/admin/brand/quan-ly-thuong-hieu");
                return;
            } else {
                request.setAttribute("editBrandError", "Chỉnh sửa thông tin thương hiệu thất bại");
            }
        } catch (InvocationTargetException | IllegalAccessException e) {
            request.setAttribute("editBrandError", "Lỗi dữ liệu");
            e.printStackTrace();
        }
        request.setAttribute("brand", entityBrand);
        request.getRequestDispatcher("/views/admin/page/brand/editBrand.jsp").forward(request, response);
    }
}
