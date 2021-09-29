package polymart.xyz.ass_jv4.controller.admin.voucher;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;
import polymart.xyz.ass_jv4.entity.EntityStaff;
import polymart.xyz.ass_jv4.entity.EntityVisit;
import polymart.xyz.ass_jv4.entity.EntityVoucher;
import polymart.xyz.ass_jv4.service.IServiceVisit;
import polymart.xyz.ass_jv4.service.IServiceVoucher;
import polymart.xyz.ass_jv4.service.implement.ServiceVisit;
import polymart.xyz.ass_jv4.service.implement.ServiceVoucher;
import polymart.xyz.ass_jv4.utils.FormatUtils;
import polymart.xyz.ass_jv4.utils.MailUtils;
import polymart.xyz.ass_jv4.utils.SessionUtils;

import javax.mail.MessagingException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "ServletVoucherHome", value = {"/admin/voucher", "/admin/voucher/delete", "/admin/voucher/add", "/admin/voucher/edit"})
public class ServletVoucherHome extends HttpServlet {

    private IServiceVoucher _iServiceVoucher;
    private IServiceVisit _iServiceVisit;

    @Override
    public void init() throws ServletException {
        _iServiceVoucher = new ServiceVoucher();
        _iServiceVisit = new ServiceVisit();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = request.getRequestURI();
        if (url.contains("/admin/voucher/delete")) {
            String id = request.getParameter("id");
            EntityVoucher entityVoucher = _iServiceVoucher.findByIdEdit(id);
            if (entityVoucher != null) {
                entityVoucher.setRemoved(true);
                _iServiceVoucher.updateVoucher(entityVoucher);
                response.sendRedirect(request.getContextPath() + "/admin/voucher");
                return;
            }
        } else if (url.contains("/admin/voucher/add")) {
            request.getRequestDispatcher("/views/admin/page/voucher/addVoucher.jsp").forward(request, response);
            return;
        } else if (url.contains("/admin/voucher/edit")) {
            String id = request.getParameter("id");
            EntityVoucher entityVoucher = _iServiceVoucher.findByIdEdit(id);
            if (entityVoucher != null) {
                SessionUtils.getSessionUtils().saveSessionModel("editvoucher", entityVoucher, request);
                request.setAttribute("voucher", entityVoucher);
                request.setAttribute("editVoucher", true);
                request.setAttribute("dateStart", FormatUtils.getFormatUtils().dateToString(entityVoucher.getDateStart()));
                request.setAttribute("dateEnd", FormatUtils.getFormatUtils().dateToString(entityVoucher.getDateEnd()));
                request.getRequestDispatcher("/views/admin/page/voucher/addVoucher.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/voucher");
            }
            return;
        }
        request.setAttribute("lstVoucher", _iServiceVoucher.findAll());
        request.getRequestDispatcher("/views/admin/page/voucher/home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = request.getRequestURI();
        EntityVoucher entityVoucher = new EntityVoucher();
        if (url.contains("/admin/voucher/edit")) {
            entityVoucher = (EntityVoucher) SessionUtils.getSessionUtils().getSessionModel("editvoucher", entityVoucher, request);
        }
        try {
            DateTimeConverter dtConverter = new DateConverter(new Date());
            dtConverter.setPattern("yyyy-MM-dd");
            ConvertUtils.register(dtConverter, Date.class);
            BeanUtils.populate(entityVoucher, request.getParameterMap());
            Date getDate = FormatUtils.getFormatUtils().stringToDate(request.getParameter("dateStart"));
            entityVoucher.setDateStart(getDate);
            getDate = FormatUtils.getFormatUtils().stringToDate(request.getParameter("dateEnd"));
            entityVoucher.setDateEnd(getDate);
            entityVoucher.setEntityStaff((EntityStaff) SessionUtils.getSessionUtils().getSessionModel("user", new EntityStaff(), request));
            entityVoucher.setReQuantity(entityVoucher.getQuantity());
            if (url.contains("/admin/voucher/add")) {
                if (_iServiceVoucher.newVoucher(entityVoucher)) {
                    List<EntityVisit> lstEntityVisits = _iServiceVisit.findAll();
                    if (lstEntityVisits != null) {
                        List<String> lstEmailVisit = lstEntityVisits.stream()
                                .filter(e -> e.getEmail() != null && !e.getEmail().trim().equals(""))
                                .map(EntityVisit::getEmail).collect(Collectors.toList());
                        MailUtils mailUtils = new MailUtils();
                        mailUtils.sendMailAll(lstEmailVisit, "[" + entityVoucher.getId() + "] - "
                                + entityVoucher.getEvent(), entityVoucher.getDescription()
                                + "\nSố lượng: " + entityVoucher.getQuantity()
                                + "\nNgày bắt đầu: " + FormatUtils.getFormatUtils().dateToString(entityVoucher.getDateStart())
                                + "\nNgày kết thúc: " + FormatUtils.getFormatUtils().dateToString(entityVoucher.getDateEnd()));
                    }
                    response.sendRedirect(request.getContextPath() + "/admin/voucher");
                    return;
                } else {
                    request.setAttribute("errorAddVoucher", "Thêm mã giảm giá thất bại");
                }
            } else if (url.contains("/admin/voucher/edit")) {
                if (_iServiceVoucher.updateVoucher(entityVoucher)) {
                    response.sendRedirect(request.getContextPath() + "/admin/voucher");
                    return;
                } else {
                    request.setAttribute("errorAddVoucher", "Sửa mã giảm giá thất bại");
                }
            }
        } catch (IllegalAccessException | InvocationTargetException e) {
            request.setAttribute("errorAddVoucher", "Lỗi dữ liệu đầu vào");
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        request.setAttribute("voucher", entityVoucher);
        request.setAttribute("dateStart", FormatUtils.getFormatUtils().dateToString(entityVoucher.getDateStart()));
        request.setAttribute("dateEnd", FormatUtils.getFormatUtils().dateToString(entityVoucher.getDateEnd()));
        request.getRequestDispatcher("/views/admin/page/voucher/addVoucher.jsp").forward(request, response);
    }
}
