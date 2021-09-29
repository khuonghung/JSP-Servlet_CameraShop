package polymart.xyz.ass_jv4.controller.admin.staff;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;
import polymart.xyz.ass_jv4.entity.EntityStaff;
import polymart.xyz.ass_jv4.service.IServiceStaff;
import polymart.xyz.ass_jv4.service.implement.ServiceStaff;
import polymart.xyz.ass_jv4.utils.BeanModelUtils;
import polymart.xyz.ass_jv4.utils.ContaiUtils;
import polymart.xyz.ass_jv4.utils.FormatUtils;
import polymart.xyz.ass_jv4.utils.PathFileUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.util.Date;
import java.util.Locale;

@MultipartConfig
@WebServlet(name = "ServletActionStaff", value = {"/admin/staff/block", "/admin/staff/unblock", "/admin/staff/remove", "/admin/staff/edit"})
public class ServletActionStaff extends HttpServlet {

    private IServiceStaff _iServiceStaff;
    private EntityStaff _entityStaff;

    @Override
    public void init() throws ServletException {
        _iServiceStaff = new ServiceStaff();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = request.getRequestURI();
        String email = request.getParameter("email");
        if (email != null) {
            _entityStaff = _iServiceStaff.fingByEmail(email);
            if (_entityStaff != null) {
                if (url.contains("/admin/staff/edit")) {
                    request.setAttribute("birthday", FormatUtils.getFormatUtils().dateToString(_entityStaff.getBirthday()));
                    request.setAttribute("staff", _entityStaff);
                    request.getRequestDispatcher("/views/admin/page/staff/editStaff.jsp").forward(request, response);
                    return;
                }
                if (url.contains("/admin/staff/block")) {
                    _entityStaff.setBlocked(true);
                } else if (url.contains("/admin/staff/unblock")) {
                    _entityStaff.setBlocked(false);
                } else if (url.contains("/admin/staff/remove")) {
                    _entityStaff.setRemoved(true);
                }
                _iServiceStaff.updateStaff(_entityStaff);
            }
        }
        response.sendRedirect(request.getContextPath() + "/admin/staff/quan-ly-nhan-vien");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        if (_entityStaff != null) {
            String url = request.getRequestURI();
            if (url.contains("/admin/staff/edit")) {
                EntityStaff modelStaff = _entityStaff;
                try {
                    DateTimeConverter dtConverter = new DateConverter(new Date());
                    dtConverter.setPattern("yyyy-MM-dd");
                    ConvertUtils.register(dtConverter, Date.class);
                    BeanUtils.populate(modelStaff, request.getParameterMap());
                    Date birthday = FormatUtils.getFormatUtils().stringToDate(request.getParameter("birthday"));
                    modelStaff.setBirthday(birthday);
                    modelStaff.setSex(request.getParameter("sex") != null && request.getParameter("sex").toLowerCase(Locale.ROOT).equals("nam"));
                    if (request.getPart("avatar") != null && !request.getPart("avatar").getSubmittedFileName().equals("")) {
                        modelStaff.setAvatar(BeanModelUtils.getBeanModel().setFileModel(request, "avatar", PathFileUtils.getPathFile().avatar));
                    }
                    if (!_iServiceStaff.editStaff(modelStaff, _entityStaff.getEmail())) {
                        request.setAttribute("staff", modelStaff);
                        request.setAttribute("editError", "Chỉnh sửa thất bại");
                        request.getRequestDispatcher("/views/admin/page/staff/editStaff.jsp").forward(request, response);
                        return;
                    }
                } catch (IllegalAccessException | InvocationTargetException e) {
                    e.printStackTrace();
                    request.setAttribute("birthday", FormatUtils.getFormatUtils().dateToString(modelStaff.getBirthday()));
                    request.setAttribute("staff", modelStaff);
                    request.setAttribute("editError", ContaiUtils.ERROR_DATA);
                    request.getRequestDispatcher("/views/admin/page/staff/editStaff.jsp").forward(request, response);
                    return;
                }
            }
        }
        response.sendRedirect(request.getContextPath() + "/admin/staff/quan-ly-nhan-vien");
    }
}
