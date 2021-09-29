package polymart.xyz.ass_jv4.controller.admin.payment;

import polymart.xyz.ass_jv4.entity.EntityPayment;
import polymart.xyz.ass_jv4.entity.EntityPaymentDetails;
import polymart.xyz.ass_jv4.entity.EntityProductDetails;
import polymart.xyz.ass_jv4.service.IServicePayment;
import polymart.xyz.ass_jv4.service.IServiceProductDetails;
import polymart.xyz.ass_jv4.service.implement.ServicePayment;
import polymart.xyz.ass_jv4.service.implement.ServiceProductDetails;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletPaymentHome", value = {"/admin/payments/quan-ly-hoa-don-thanh-toan",
        "/admin/payments", "/admin/payments/status-bill", "/admin/payments/status-payment"})
public class ServletPaymentHome extends HttpServlet {

    private IServicePayment _iServicePayment;
    private IServiceProductDetails _iServiceProductDetails;

    @Override
    public void init() throws ServletException {
        _iServicePayment = new ServicePayment();
        _iServiceProductDetails = new ServiceProductDetails();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String url = request.getRequestURI();
        String id = request.getParameter("id");
        String action = request.getParameter("action");
        EntityPayment entityPayment = null;
        if (url.contains("/admin/payments/status-bill")) {
            if (id != null && action != null) {
                entityPayment = _iServicePayment.findById(id);
                if (entityPayment != null) {
                    if (action.equals("true")) {
                        EntityProductDetails entityProductDetails;
                        boolean flag = true;
                        for (EntityPaymentDetails x : entityPayment.getLstEntityPaymentDetails()) {
                            int quantity = x.getQuantity();
                            if (x.getEntityProductDetails().getQuantity() < quantity) {
                                flag = false;
                                break;
                            }
                        }
                        if (flag) {
                            entityPayment.setStatusBilling(true);
                            if (_iServicePayment.updatePayment(entityPayment)) {
                                for (EntityPaymentDetails x : entityPayment.getLstEntityPaymentDetails()) {
                                    int quantity = x.getQuantity();
                                    entityProductDetails = x.getEntityProductDetails();
                                    entityProductDetails.setQuantity(entityProductDetails.getQuantity() - quantity);
                                    _iServiceProductDetails.updateProductDetails(entityProductDetails);
                                }
                                response.sendRedirect(request.getContextPath() + "/admin/payments");
                                return;
                            } else {
                                request.setAttribute("errorPayment", "Cập nhật trạng thái thất bại!");
                            }
                        } else {
                            request.setAttribute("errorPayment", "Số lượng trong kho không đủ!");
                        }
                    }
                }
            }
        } else if (url.contains("/admin/payments/status-payment")) {
            if (id != null && action != null) {
                entityPayment = _iServicePayment.findById(id);
                if (entityPayment != null) {
                    if (action.equals("true")) {
                        entityPayment.setStatusPayment(true);
                        _iServicePayment.updatePayment(entityPayment);
                        response.sendRedirect(request.getContextPath() + "/admin/payments");
                        return;
                    }
                }
            }
        }


        request.setAttribute("lstPayement", _iServicePayment.findAll());
        request.getRequestDispatcher("/views/admin/page/payment/home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
    }
}
