package polymart.xyz.ass_jv4.controller.admin.billImport;

import polymart.xyz.ass_jv4.entity.EntityBillImport;
import polymart.xyz.ass_jv4.entity.EntityBillImportDetails;
import polymart.xyz.ass_jv4.entity.EntityProductDetails;
import polymart.xyz.ass_jv4.entity.EntityStaff;
import polymart.xyz.ass_jv4.service.*;
import polymart.xyz.ass_jv4.service.implement.*;
import polymart.xyz.ass_jv4.utils.SessionUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "ServletAddBillImport", value = "/admin/billimport/add")
public class ServletAddBillImport extends HttpServlet {

    private IServiceBillImport _iServiceBillImport;
    private IServiceStaff _iServiceStaff;
    private IServiceProductDetails _iServiceProductDetails;

    @Override
    public void init() throws ServletException {
        _iServiceBillImport = new ServiceBillImprt();
        _iServiceStaff = new ServiceStaff();
        _iServiceProductDetails = new ServiceProductDetails();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String[] arrIdProduct = new String[15];
        Integer[] arrQuantity = new Integer[15];
        Long[] arrPrice = new Long[15];

        request.setAttribute("lstIdProduct", arrIdProduct);
        request.setAttribute("lstQuantity", arrQuantity);
        request.setAttribute("lstPrice", arrPrice);
        request.setAttribute("lstStaff", _iServiceStaff.findAll());
        request.setAttribute("lstProductDetails", _iServiceProductDetails.findAll());

        request.getRequestDispatcher("/views/admin/page/billimport/addBillImport.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        EntityBillImport entityBillImport = new EntityBillImport();
        EntityBillImportDetails billImportDetails;

        String emailStaffCheck = request.getParameter("staffCheck");
        String[] arrIdProduct = request.getParameterValues("idProduct");
        String[] arrQuantity = request.getParameterValues("quantity");
        String[] arrPrice = request.getParameterValues("price");
        try {
            if (emailStaffCheck != null) {
                EntityStaff entityStaff = _iServiceStaff.fingByEmail(emailStaffCheck);
                if (entityStaff != null) {
                    entityBillImport.setEntityStaffCheck(entityStaff);
                    entityBillImport.setEntityStaffImport((EntityStaff) SessionUtils.getSessionUtils().getSessionModel("user", new EntityStaff(), request));
                    List<EntityBillImportDetails> lstEntityBillImportDetails = new ArrayList<>();
                    EntityProductDetails entityProductDetails;
                    for (int i = 0; i < arrIdProduct.length; i++) {
                        String idProduct = arrIdProduct[i];
                        String quantity = arrQuantity[i];
                        String price = arrPrice[i];
                        if (!idProduct.trim().equals("") && !idProduct.trim().equals("0")
                                && !quantity.trim().equals("") && !price.trim().equals("")
                                && Integer.parseInt(quantity) > 0 && Long.parseLong(price) > 0) {
                            entityProductDetails = _iServiceProductDetails.findById(idProduct);
                            if (entityProductDetails != null) {
                                entityProductDetails.setQuantity(entityProductDetails.getQuantity() + Integer.parseInt(quantity));
                                billImportDetails = new EntityBillImportDetails();
                                billImportDetails.setEntityProductDetails(entityProductDetails);
                                billImportDetails.setQuantity(Integer.parseInt(quantity));
                                billImportDetails.setPrice(Long.parseLong(price));
                                lstEntityBillImportDetails.add(billImportDetails);
                            }
                        }
                    }

                    entityBillImport.setDateImport(new Date());
                    entityBillImport.setLstBillimportDetails(lstEntityBillImportDetails);
                    if (_iServiceBillImport.newBillImport(entityBillImport)) {
                        response.sendRedirect(request.getContextPath() + "/admin/payments/quan-ly-hoa-don-nhap-hang");
                        return;
                    } else {
                        request.setAttribute("addProductError", "Thêm phiếu nhập hàng thất bại");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("lstIdProduct", arrIdProduct);
        request.setAttribute("lstQuantity", arrQuantity);
        request.setAttribute("lstPrice", arrPrice);
        request.setAttribute("emailStaffCheck", emailStaffCheck);
        request.setAttribute("lstStaff", _iServiceStaff.findAll());
        request.setAttribute("lstProductDetails", _iServiceProductDetails.findAll());

        request.getRequestDispatcher("/views/admin/page/billimport/addBillImport.jsp").forward(request, response);
    }
}
