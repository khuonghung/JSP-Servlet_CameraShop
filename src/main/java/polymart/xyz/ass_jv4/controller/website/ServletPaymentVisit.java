package polymart.xyz.ass_jv4.controller.website;

import polymart.xyz.ass_jv4.entity.EntityPayment;
import polymart.xyz.ass_jv4.service.IServicePayment;
import polymart.xyz.ass_jv4.service.implement.ServicePayment;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ServletPaymentVisit", value = "/payment-visit")
public class ServletPaymentVisit extends HttpServlet {

    private IServicePayment _iServicePayment;

    @Override
    public void init() throws ServletException {
        _iServicePayment = new ServicePayment();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        if (id != null) {
            EntityPayment payment = _iServicePayment.findById(id);
            if (payment != null) {
                request.setAttribute("payment", payment);
                request.getRequestDispatcher("/views/website/page/listPayment/details.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/payment-visit");
            }
            return;
        }

        request.setAttribute("lstPayment", _iServicePayment.findAll());
        request.getRequestDispatcher("/views/website/page/listPayment/home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
