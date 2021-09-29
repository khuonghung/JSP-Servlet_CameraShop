package polymart.xyz.ass_jv4.controller.account;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

import static polymart.xyz.ass_jv4.utils.SessionUtils.getSessionUtils;

@WebServlet(name = "ServletLogout", value = "/logout")
public class ServletLogout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getSessionUtils().removeSession("user", request);
        getSessionUtils().removeSession("visit", request);
        response.sendRedirect(request.getContextPath() + "/");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
