package polymart.xyz.ass_jv4.controller.admin.banner;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;
import polymart.xyz.ass_jv4.entity.EntityBanner;
import polymart.xyz.ass_jv4.entity.EntityStaff;
import polymart.xyz.ass_jv4.service.IServiceBanner;
import polymart.xyz.ass_jv4.service.implement.ServiceBanner;
import polymart.xyz.ass_jv4.utils.FormatUtils;
import polymart.xyz.ass_jv4.utils.SessionUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;

@WebServlet(name = "ServletAddBanner", value = "/admin/banner/add")
public class ServletAddBanner extends HttpServlet {

    private IServiceBanner _iServiceBanner;

    @Override
    public void init() throws ServletException {
        _iServiceBanner = new ServiceBanner();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        request.getRequestDispatcher("/views/admin/page/banner/addBanner.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        EntityBanner entityBanner = new EntityBanner();
        DateTimeConverter dtConverter = null;
        try {
            dtConverter = new DateConverter(new Date());
            System.out.println("format date");
            dtConverter.setPattern("yyyy-MM-dd");
            System.out.println("pattern date");
            ConvertUtils.register(dtConverter, Date.class);
            System.out.println("registert date");
            BeanUtils.populate(entityBanner, request.getParameterMap());
            System.out.println("bean utils");
            entityBanner.setEntityStaff((EntityStaff) SessionUtils.getSessionUtils().getSessionModel("user", new EntityStaff(), request));
            entityBanner.setDateEnded(FormatUtils.getFormatUtils().stringToDate(request.getParameter("dateEnded")));
            entityBanner.setDateCreated(new Date());
            System.out.println(entityBanner);
            if (_iServiceBanner.newBanner(entityBanner)) {
                response.sendRedirect(request.getContextPath() + "/admin/banner");
                return;
            } else {
                request.setAttribute("addBannerError", "Thêm banner mới thất bại");
            }
        } catch (InvocationTargetException | IllegalAccessException e) {
            request.setAttribute("addBannerError", "Vui lòng kiểm tra lại dữ liệu nhập vào");
            e.printStackTrace();
        }
        request.setAttribute("banner", entityBanner);
        request.getRequestDispatcher("/views/admin/page/banner/addBanner.jsp").forward(request, response);
    }
}
