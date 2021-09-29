package polymart.xyz.ass_jv4.controller.website;

import polymart.xyz.ass_jv4.entity.EntityContact;
import polymart.xyz.ass_jv4.model.GooglePojo;
import polymart.xyz.ass_jv4.service.IServiceContact;
import polymart.xyz.ass_jv4.service.implement.ServiceContact;
import polymart.xyz.ass_jv4.utils.GoogleUtils;
import polymart.xyz.ass_jv4.utils.SessionUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet(name = "ServletContact", value = {"/contact", "/login-google"})
public class ServletContact extends HttpServlet {

    private IServiceContact _iServiceContact;

    @Override
    public void init() throws ServletException {
        _iServiceContact = new ServiceContact();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String url = request.getRequestURI();
        if (url.contains("/login-google")) {
            String code = request.getParameter("code");
            if (code != null && !code.isEmpty()) {
                String accessToken = GoogleUtils.getToken(code);
                GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
                System.out.println(googlePojo);
                SessionUtils.getSessionUtils().saveSessionModel("google", googlePojo, request);
                response.sendRedirect(request.getContextPath() + "/contact");
            } else {
                response.sendRedirect("https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=" + GoogleUtils.GOOGLE_REDIRECT_URI
                        + "&response_type=code&client_id=" + GoogleUtils.GOOGLE_CLIENT_ID
                        + "&approval_prompt=force");
            }
            return;
        }

        request.getRequestDispatcher("/views/website/page/contact/home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        EntityContact entityContact = new EntityContact();
        String subject = request.getParameter("subject");
        String body = request.getParameter("body");
        if (subject != null && body != null) {
            entityContact.setEmail(((GooglePojo) SessionUtils.getSessionUtils().getSessionModel("GOOGLE", new GooglePojo(), request)).getEmail());
            entityContact.setSubject(subject.trim());
            entityContact.setBody(body.trim());
            entityContact.setDateSend(new Timestamp(System.currentTimeMillis()));
            entityContact.setSeen(false);
//            _iServiceContact.newContact(entityContact);
            if (_iServiceContact.newContact(entityContact)) {
//                response.sendRedirect(request.getContextPath() + "/send-contact?result=true");
                response.getWriter().println("Gửi phản hồi thành công");
                return;
            }
        }
        response.getWriter().println("Gửi phản hồi thất bại");
//        response.sendRedirect(request.getContextPath() + "/send-contact?result=false");
    }
}
