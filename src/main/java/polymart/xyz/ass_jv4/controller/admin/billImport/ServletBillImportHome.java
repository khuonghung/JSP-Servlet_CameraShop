package polymart.xyz.ass_jv4.controller.admin.billImport;

import polymart.xyz.ass_jv4.service.IServiceBillImport;
import polymart.xyz.ass_jv4.service.implement.ServiceBillImprt;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletBillImportHome", value = "/admin/payments/quan-ly-hoa-don-nhap-hang")
public class ServletBillImportHome extends HttpServlet {

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

        request.setAttribute("lstBillImport", _iServiceBillImport.findAll());

        request.getRequestDispatcher("/views/admin/page/billimport/home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
