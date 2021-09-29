package polymart.xyz.ass_jv4.controller.account;

import org.apache.commons.beanutils.BeanUtils;
import polymart.xyz.ass_jv4.entity.EntityStaff;
import polymart.xyz.ass_jv4.service.IServiceAccount;
import polymart.xyz.ass_jv4.service.implement.ServiceAccount;
import polymart.xyz.ass_jv4.utils.ContaiUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import static polymart.xyz.ass_jv4.utils.SessionUtils.getSessionUtils;

@WebServlet(name = "ServletSignin", value = "/signin")
public class ServletSignin extends HttpServlet {

    private IServiceAccount _iServiceAccount;

    @Override
    public void init() throws ServletException {
        _iServiceAccount = new ServiceAccount();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String email = (String) getSessionUtils().getSessionString("email", request);
        String password = (String) getSessionUtils().getSessionString("password", request);
        request.setAttribute("email", email);
        request.setAttribute("password", password);
        request.getRequestDispatcher("/views/account/signin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        EntityStaff signin = new EntityStaff();
        String message = "";
        try {
            BeanUtils.populate(signin, request.getParameterMap());
            if (signin.getEmail().trim().equals("")) {
                message = "Vui lòng nhập email đăng nhập";
            } else if (signin.getPassword().length() == 0) {
                message = "Vui lòng nhập mật khẩu đăng nhập";
            } else if (signin.getPassword().length() < 8 || signin.getPassword().length() > 50) {
                message = "Mật khẩu đăng nhập phải có độ dài từ 8 đến 50 ký tự";
            } else {
                message = _iServiceAccount.newLogin(signin);
                EntityStaff entityStaff = _iServiceAccount.findByEmail(signin.getEmail());
                if (entityStaff != null) {
                    if (entityStaff.isActive()) {
                        if (message.equals(ContaiUtils.LOGIN_TRUE)) {
                            if (request.getParameter("remember") != null) {
                                getSessionUtils().saveSession("email", signin.getEmail(), request);
                                getSessionUtils().saveSession("password", signin.getPassword(), request);
                            } else {
                                getSessionUtils().removeSession("email", request);
                                getSessionUtils().removeSession("password", request);
                            }
                            getSessionUtils().saveSessionModel("user", entityStaff, request);
                            response.sendRedirect(request.getContextPath() + "/account?result=signin-successfully");
                            return;
                        }
                    }
                } else {
                    message = ContaiUtils.LOGIN_FALSE;
                }
            }
        } catch (IllegalAccessException | InvocationTargetException e) {
            message = ContaiUtils.ERROR_DATA;
            e.printStackTrace();
        }
        request.setAttribute("email", signin.getEmail());
        request.setAttribute("errorMessage", message);
        doGet(request, response);
    }
}
