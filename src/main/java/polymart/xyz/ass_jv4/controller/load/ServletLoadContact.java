package polymart.xyz.ass_jv4.controller.load;

import polymart.xyz.ass_jv4.entity.EntityContact;
import polymart.xyz.ass_jv4.entity.EntityRepContact;
import polymart.xyz.ass_jv4.service.IServiceContact;
import polymart.xyz.ass_jv4.service.IServiceRepContact;
import polymart.xyz.ass_jv4.service.implement.ServiceContact;
import polymart.xyz.ass_jv4.service.implement.ServiceRepContact;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletLoadContact", value = {"/load/inbox", "/load/read", "/load/compose", "/load/send", "/load/read-send"})
public class ServletLoadContact extends HttpServlet {

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
        String url = request.getRequestURI();
        if (url.contains("/load/read-send")) {
            String id = request.getParameter("id");
            if (id != null) {
                EntityRepContact entityRepContact = _iServiceRepContact.findById(id);
                if (entityRepContact != null) {
                    request.setAttribute("contact", entityRepContact);
                }
            }
            request.getRequestDispatcher("/views/admin/page/contact/read-send.jsp").forward(request, response);
        } else if (url.contains("/load/read")) {
            String id = request.getParameter("id");
            if (id != null) {
                EntityContact entityContact = _iServiceContact.findById(id);
                if (entityContact != null) {
                    entityContact.setSeen(true);
                    _iServiceContact.updateContact(entityContact);
                    request.setAttribute("contact", entityContact);
                }
            }
            request.getRequestDispatcher("/views/admin/page/contact/read.jsp").forward(request, response);
        } else if (url.contains("/load/compose")) {
            request.getRequestDispatcher("/views/admin/page/contact/compose.jsp").forward(request, response);
        } else if (url.contains("/load/send")) {
            request.setAttribute("lstInbox", _iServiceRepContact.findAll());
            request.getRequestDispatcher("/views/admin/page/contact/send.jsp").forward(request, response);
        } else {
            request.setAttribute("lstInbox", _iServiceContact.findAll());
            request.getRequestDispatcher("/views/admin/page/contact/inbox.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
