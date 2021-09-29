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

@WebServlet(name = "ServletAddBrand", value = "/admin/brand/add")
public class ServletAddBrand extends HttpServlet {

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
        request.getRequestDispatcher("/views/admin/page/brand/addBrand.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        EntityBrand modelBrand = new EntityBrand();
        try {
            BeanUtils.populate(modelBrand, request.getParameterMap());
            if (_iServiceBrand.newBrand(modelBrand)) {
                response.sendRedirect(request.getContextPath() + "/admin/brand/quan-ly-thuong-hieu");
                return;
            }
        } catch (InvocationTargetException | IllegalAccessException e) {
            e.printStackTrace();
        }
        request.setAttribute("addBrandError", "Thêm thương hiệu thất bại");
        request.setAttribute("brand", modelBrand);
        request.getRequestDispatcher("/views/admin/page/brand/addBrand.jsp").forward(request, response);
    }
}
