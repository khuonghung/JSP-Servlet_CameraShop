package polymart.xyz.ass_jv4.controller.admin.visit;

import polymart.xyz.ass_jv4.service.IServiceVisit;
import polymart.xyz.ass_jv4.service.implement.ServiceVisit;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletVisitHome", value = "/admin/visit/quan-ly-khach-hang")
public class ServletVisitHome extends HttpServlet {

    private IServiceVisit _iServiceVisit;

    @Override
    public void init() throws ServletException {
        _iServiceVisit = new ServiceVisit();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        request.setAttribute("lstVisit", _iServiceVisit.findAll());

        request.getRequestDispatcher("/views/admin/page/visit/home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

    }
}
