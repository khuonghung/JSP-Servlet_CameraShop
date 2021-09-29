package polymart.xyz.ass_jv4.controller.load;

import polymart.xyz.ass_jv4.entity.EntityBillImport;
import polymart.xyz.ass_jv4.entity.EntityPayment;
import polymart.xyz.ass_jv4.service.IServicePayment;
import polymart.xyz.ass_jv4.service.implement.ServicePayment;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletLoadPaymentDetails", value = "/load/payment-details")
public class ServletLoadPaymentDetails extends HttpServlet {

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
        try {
            if (id != null && Integer.parseInt(id) > 0) {
                EntityPayment entityPayment = _iServicePayment.findById(id);
                if (entityPayment != null) {
                    request.setAttribute("payment", entityPayment);
                    request.getRequestDispatcher("/views/admin/page/payment/layout/modalPaymentDetails.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
