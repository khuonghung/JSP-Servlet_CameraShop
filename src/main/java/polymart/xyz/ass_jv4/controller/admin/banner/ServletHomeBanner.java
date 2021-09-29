package polymart.xyz.ass_jv4.controller.admin.banner;

import polymart.xyz.ass_jv4.entity.EntityBanner;
import polymart.xyz.ass_jv4.service.IServiceBanner;
import polymart.xyz.ass_jv4.service.implement.ServiceBanner;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletHomeBanner", value = {"/admin/banner", "/admin/banner/"})
public class ServletHomeBanner extends HttpServlet {

    private IServiceBanner _iServiceBanner;

    @Override
    public void init() throws ServletException {
        _iServiceBanner = new ServiceBanner();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String remove = request.getParameter("remove");
        String id = request.getParameter("id");
        if (remove != null && id != null) {
            if (remove.equals("true")) {
                EntityBanner entityBanner = _iServiceBanner.findById(id);
                if (entityBanner != null) {
                    entityBanner.setRemoved(false);
                    _iServiceBanner.updateBanner(entityBanner);
                    response.sendRedirect(request.getContextPath() + "/admin/banner");
                    return;
                }
            }
        }
        System.out.println(_iServiceBanner.findAll());
        request.setAttribute("lstBanner", _iServiceBanner.findAll());
        request.getRequestDispatcher("/views/admin/page/banner/home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
