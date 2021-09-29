package polymart.xyz.ass_jv4.controller.admin.staff;

import polymart.xyz.ass_jv4.entity.EntityStaff;
import polymart.xyz.ass_jv4.service.IServiceStaff;
import polymart.xyz.ass_jv4.service.implement.ServiceStaff;
import polymart.xyz.ass_jv4.utils.SessionUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletChangePassword", value = "/admin/profile/doi-mat-khau")
public class ServletChangePassword extends HttpServlet {

    private IServiceStaff _iServiceStaff;

    @Override
    public void init() throws ServletException {
        _iServiceStaff = new ServiceStaff();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String oldPassword = request.getParameter("oldpassword");
        String newPassword = request.getParameter("newpassword");
        String rePassword = request.getParameter("repassword");

        if (oldPassword != null && newPassword != null && rePassword != null) {
            if (newPassword.equals(rePassword)) {
                if (_iServiceStaff.changePassword(((EntityStaff) SessionUtils.getSessionUtils().getSessionModel("user", new EntityStaff(), request)).getEmail()
                        , oldPassword, newPassword)) {
                    response.sendRedirect(request.getContextPath() + "/account?changepassword=true");
                    return;
                } else {
                    response.sendRedirect(request.getContextPath() + "/account?changepassword=false");
                    return;
                }
            }
        }
        response.sendRedirect(request.getContextPath() + "/admin");
    }
}
