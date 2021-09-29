package polymart.xyz.ass_jv4.controller.load;

import polymart.xyz.ass_jv4.entity.EntityBillImport;
import polymart.xyz.ass_jv4.entity.EntityBillImportDetails;
import polymart.xyz.ass_jv4.service.IServiceBillImport;
import polymart.xyz.ass_jv4.service.IServiceBillImportDetails;
import polymart.xyz.ass_jv4.service.implement.ServiceBillImportDetails;
import polymart.xyz.ass_jv4.service.implement.ServiceBillImprt;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletLoadBillImportDetails", value = "/load/bilimport-details")
public class ServletLoadBillImportDetails extends HttpServlet {

    private IServiceBillImport _iServiceBillImport;

    @Override
    public void init() throws ServletException {
        _iServiceBillImport = new ServiceBillImprt();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        try {
            if (id != null && Integer.parseInt(id) > 0) {
                EntityBillImport entityBillImport = _iServiceBillImport.findById(id);
                if (entityBillImport != null) {
                    request.setAttribute("billimport", entityBillImport);
                    request.getRequestDispatcher("/views/admin/page/billimport/layout/modalBillImportDetails.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
