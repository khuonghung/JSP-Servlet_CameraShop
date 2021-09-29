package polymart.xyz.ass_jv4.controller.account;

import polymart.xyz.ass_jv4.entity.EntityStaff;
import polymart.xyz.ass_jv4.service.IServiceStaff;
import polymart.xyz.ass_jv4.service.implement.ServiceStaff;
import polymart.xyz.ass_jv4.utils.SessionUtils;

import javax.mail.MessagingException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

import static polymart.xyz.ass_jv4.utils.MailUtils.getMailUtils;

@WebServlet(name = "ServletForgot", value = {"/forgot-password", "/reset-password"})
public class ServletForgot extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = request.getRequestURI();
        if (url.contains("/reset-password")) {
            request.getRequestDispatcher("/views/account/resetPassword.jsp").forward(request, response);
            return;
        }
        request.getRequestDispatcher("/views/account/forgot-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = request.getRequestURI();
        String errorForgotpassword = null;
        if (url.contains("/reset-password")) {
            String newPassword = request.getParameter("newPassword");
            EntityStaff entityStaff = (EntityStaff) SessionUtils.getSessionUtils().getSessionModel("userforgot", new EntityStaff(), request);
            if (entityStaff != null) {
                entityStaff.setPassword(newPassword);
                IServiceStaff iServiceStaff = new ServiceStaff();
                if (iServiceStaff.updateStaff(entityStaff)) {
                    SessionUtils.getSessionUtils().removeSession("userforgot", request);
                    response.sendRedirect(request.getContextPath() + "/account?reset-password=true");
                    return;
                } else {
                    SessionUtils.getSessionUtils().removeSession("userforgot", request);
                    response.sendRedirect(request.getContextPath() + "/account?reset-password=false");
                    return;
                }
            }
            response.sendRedirect(request.getContextPath() + "/");
        } else {
            String email = request.getParameter("email");
            if (email != null) {
                IServiceStaff iServiceStaff = new ServiceStaff();
                EntityStaff entityStaff = iServiceStaff.fingByEmail(email);
                if (entityStaff != null) {
                    String title = "Lấy lại mật khẩu";
                    String body = "<a href=\"http://localhost:8081/ASS_JV4_war_exploded/account?forgot-password=" + entityStaff.getId() + "\">Click here</a>";
                    try {
                        getMailUtils().sendMail(entityStaff.getEmail(), title, body);
                        response.sendRedirect(request.getContextPath() + "/account?send-reset-password=true");
                        return;
                    } catch (MessagingException e) {
                        e.printStackTrace();
                        response.sendRedirect(request.getContextPath() + "/account?send-reset-password=false");
                        return;
                    }
                } else {
                    errorForgotpassword = "Không tìm thấy địa chỉ email";
                }
            } else {
                errorForgotpassword = "Vui lòng nhập địa email đã đăng ký";
            }

            request.setAttribute("errorForgotpassword", errorForgotpassword);
            request.getRequestDispatcher("/views/account/forgot-password.jsp").forward(request, response);
        }
    }
}
