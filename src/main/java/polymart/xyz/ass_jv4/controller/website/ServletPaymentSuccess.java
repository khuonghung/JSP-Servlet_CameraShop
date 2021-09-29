package polymart.xyz.ass_jv4.controller.website;

import polymart.xyz.ass_jv4.entity.EntityPayment;
import polymart.xyz.ass_jv4.service.IServicePayment;
import polymart.xyz.ass_jv4.service.implement.ServicePayment;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletPaymentSuccess", value = "/payment-success")
public class ServletPaymentSuccess extends HttpServlet {

    private IServicePayment _iServicePayment;

    @Override
    public void init(ServletConfig config) throws ServletException {
        _iServicePayment = new ServicePayment();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String vnp_TxnRef = request.getParameter("vnp_TxnRef");
        String vnp_BankTranNo = request.getParameter("vnp_BankTranNo");
        String vnp_TransactionNo = request.getParameter("vnp_TransactionNo");
        String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
        if (vnp_TxnRef != null && Integer.parseInt(vnp_TxnRef) > 0
                && vnp_BankTranNo != null && vnp_ResponseCode != null && vnp_ResponseCode.equals("00")
                && vnp_TransactionNo != null && Integer.parseInt(vnp_TransactionNo) > 0) {
            EntityPayment entityPayment = _iServicePayment.findById(vnp_TxnRef);
            if (entityPayment != null && !entityPayment.isStatusPayment()) {
                entityPayment.setStatusPayment(true);
                _iServicePayment.updatePayment(entityPayment);
                response.sendRedirect(request.getContextPath() + "/order?payment-success=true");
                return;
            }
        }
        response.sendRedirect(request.getContextPath() + "/order?payment-method=cod");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
