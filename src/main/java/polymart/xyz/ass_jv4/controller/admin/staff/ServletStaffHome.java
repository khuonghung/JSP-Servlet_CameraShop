package polymart.xyz.ass_jv4.controller.admin.staff;

import polymart.xyz.ass_jv4.service.IServiceStaff;
import polymart.xyz.ass_jv4.service.implement.ServiceStaff;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletStaffHome", value = {"/admin/staff/quan-ly-nhan-vien", "/admin/staff/", "/admin/staff/quan-ly-nhan-vien/", "/admin/staff"})
public class ServletStaffHome extends HttpServlet {

    private IServiceStaff _iServiceStaff;

    @Override
    public void init() throws ServletException {
        _iServiceStaff = new ServiceStaff();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        request.setAttribute("lstStaff", _iServiceStaff.findAll());

        request.getRequestDispatcher("/views/admin/page/staff/home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
