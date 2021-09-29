package polymart.xyz.ass_jv4.controller.admin.contact;

import polymart.xyz.ass_jv4.entity.EntityContact;
import polymart.xyz.ass_jv4.entity.EntityRepContact;
import polymart.xyz.ass_jv4.entity.EntityStaff;
import polymart.xyz.ass_jv4.service.IServiceContact;
import polymart.xyz.ass_jv4.service.IServiceRepContact;
import polymart.xyz.ass_jv4.service.implement.ServiceContact;
import polymart.xyz.ass_jv4.service.implement.ServiceRepContact;
import polymart.xyz.ass_jv4.utils.MailUtils;
import polymart.xyz.ass_jv4.utils.SessionUtils;

import javax.mail.MessagingException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet(name = "ServletRepContact", value = {"/admin/rep-contact", "/admin/send-mail"})
public class ServletRepContact extends HttpServlet {

    private IServiceContact _iServiceContact;
    private IServiceRepContact _iServiceRepContact;

    @Override
    public void init() throws ServletException {
        _iServiceContact = new ServiceContact();
        _iServiceRepContact = new ServiceRepContact();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = request.getRequestURI();

        if (url.contains("/admin/send-mail")) {
            String email = request.getParameter("email");
            String subject = request.getParameter("subject");
            String body = request.getParameter("body");
            if (email != null && subject != null && body != null
                    && !email.trim().equals("") && !subject.trim().equals("") && !body.trim().equals("")) {
                EntityRepContact entityRepContact = new EntityRepContact();
                entityRepContact.setEntityStaff((EntityStaff) SessionUtils.getSessionUtils().getSessionModel("user", new EntityStaff(), request));
                entityRepContact.setDateRep(new Timestamp(System.currentTimeMillis()));
                entityRepContact.setEmail(email);
                entityRepContact.setSubject(subject);
                entityRepContact.setBody(body);
                if (_iServiceRepContact.newRepContact(entityRepContact)) {
                    try {
                        MailUtils.getMailUtils().sendMail(email, subject, body);
                        response.getWriter().println("Đã gửi.");
                    } catch (MessagingException e) {
                        e.printStackTrace();
                        response.getWriter().println("Gửi thất bại.");
                    }
                } else {
                    response.getWriter().println("Gửi thất bại.");
                }
            }
        } else {
            String idContact = request.getParameter("idContact");
            String message = request.getParameter("message");
            if (idContact != null && message != null) {
                EntityContact entityContact = _iServiceContact.findById(idContact);
                if (entityContact != null) {
                    EntityRepContact entityRepContact = new EntityRepContact();
                    entityRepContact.setEntityContact(entityContact);
                    entityRepContact.setEntityStaff((EntityStaff) SessionUtils.getSessionUtils().getSessionModel("user", new EntityStaff(), request));
                    entityRepContact.setDateRep(new Timestamp(System.currentTimeMillis()));
                    entityRepContact.setEmail(entityContact.getEmail());
                    entityRepContact.setSubject("[REP] - " + entityContact.getSubject());
                    entityRepContact.setBody(message);
                    if (_iServiceRepContact.newRepContact(entityRepContact)) {
                        try {
                            MailUtils.getMailUtils().sendMail(entityContact.getEmail(), entityRepContact.getSubject(), entityRepContact.getBody());
                            response.getWriter().println("Đã gửi trả lời phản hồi.");
                        } catch (MessagingException e) {
                            e.printStackTrace();
                            response.getWriter().println("Gửi phản hồi thất bại.");
                        }
                    } else {
                        response.getWriter().println("Gửi phản hồi thất bại.");
                    }
                } else {
                    response.getWriter().println("Phản hồi không tồn tại.");
                }
            }
        }
    }
}
