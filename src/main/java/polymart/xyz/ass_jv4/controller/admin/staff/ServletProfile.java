package polymart.xyz.ass_jv4.controller.admin.staff;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;
import polymart.xyz.ass_jv4.entity.EntityStaff;
import polymart.xyz.ass_jv4.service.IServiceStaff;
import polymart.xyz.ass_jv4.service.implement.ServiceStaff;
import polymart.xyz.ass_jv4.utils.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.Locale;

@MultipartConfig
@WebServlet(name = "ServletProfile", value = "/admin/profile")
public class ServletProfile extends HttpServlet {

    private IServiceStaff _iServiceStaff;

    @Override
    public void init() throws ServletException {
        _iServiceStaff = new ServiceStaff();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        if (id != null) {
            EntityStaff entityStaff = (EntityStaff) SessionUtils.getSessionUtils().getSessionModel("user", new EntityStaff(), request);
            System.out.println(entityStaff);
            if (id.equals(entityStaff.getId() + "")) {
                request.setAttribute("birthday", FormatUtils.getFormatUtils().dateToString(entityStaff.getBirthday()));
                request.setAttribute("staff", entityStaff);
                request.getRequestDispatcher("/views/admin/page/staff/editStaff.jsp").forward(request, response);
                return;
            }
        }

        request.getRequestDispatcher("/views/admin/page/staff/profileStaff.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        EntityStaff entityStaff = (EntityStaff) SessionUtils.getSessionUtils().getSessionModel("user", new EntityStaff(), request);
        if (entityStaff != null) {
            try {
                DateTimeConverter dtConverter = new DateConverter(new Date());
                dtConverter.setPattern("yyyy-MM-dd");
                ConvertUtils.register(dtConverter, Date.class);
                BeanUtils.populate(entityStaff, request.getParameterMap());
                Date birthday = FormatUtils.getFormatUtils().stringToDate(request.getParameter("birthday"));
                entityStaff.setBirthday(birthday);
                entityStaff.setSex(request.getParameter("sex") != null && request.getParameter("sex").toLowerCase(Locale.ROOT).equals("nam"));
                if (request.getPart("avatar") != null && !request.getPart("avatar").getSubmittedFileName().equals("")) {
                    entityStaff.setAvatar(BeanModelUtils.getBeanModel().setFileModel(request, "avatar", PathFileUtils.getPathFile().avatar));
                }
                if (!_iServiceStaff.editStaff(entityStaff, ((EntityStaff) SessionUtils.getSessionUtils().getSessionModel("user", new EntityStaff(), request)).getEmail())) {
                    request.setAttribute("staff", entityStaff);
                    request.setAttribute("editError", "Chỉnh sửa thất bại");
                    request.getRequestDispatcher("/views/admin/page/staff/editStaff.jsp").forward(request, response);
                    return;
                }
            } catch (IllegalAccessException | InvocationTargetException e) {
                e.printStackTrace();
                request.setAttribute("birthday", FormatUtils.getFormatUtils().dateToString(entityStaff.getBirthday()));
                request.setAttribute("staff", entityStaff);
                request.setAttribute("editError", ContaiUtils.ERROR_DATA);
                request.getRequestDispatcher("/views/admin/page/staff/editStaff.jsp").forward(request, response);
                return;
            }
        }
        response.sendRedirect(request.getContextPath() + "/admin/profile");
    }
}
