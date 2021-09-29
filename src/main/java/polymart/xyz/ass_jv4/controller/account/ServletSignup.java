package polymart.xyz.ass_jv4.controller.account;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;
import polymart.xyz.ass_jv4.entity.EntityStaff;
import polymart.xyz.ass_jv4.service.IServiceAccount;
import polymart.xyz.ass_jv4.service.implement.ServiceAccount;
import polymart.xyz.ass_jv4.utils.ContaiUtils;
import polymart.xyz.ass_jv4.utils.FormatUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.util.Date;

import static polymart.xyz.ass_jv4.utils.BeanModelUtils.getBeanModel;
import static polymart.xyz.ass_jv4.utils.PathFileUtils.getPathFile;

@MultipartConfig
@WebServlet(name = "ServletSignup", value = "/signup")
public class ServletSignup extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.getRequestDispatcher("/views/account/signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        EntityStaff signup = new EntityStaff();
        String message;
        try {
            DateTimeConverter dtConverter = new DateConverter(new Date());
            dtConverter.setPattern("yyyy-MM-dd");
            ConvertUtils.register(dtConverter, Date.class);
            BeanUtils.populate(signup, request.getParameterMap());
            Date birthday = FormatUtils.getFormatUtils().stringToDate(request.getParameter("birthday"));
            signup.setBirthday(birthday);
            signup.setSex(request.getParameter("sex").equals("nam"));
            IServiceAccount iServiceSingup = new ServiceAccount();
            if (iServiceSingup.findByEmail(signup.getEmail()) == null
                    && signup.getEmail() != null) {
                if (signup.getPassword().length() >= 8
                        && signup.getPassword().length() <= 50) {
                    signup.setAvatar(getBeanModel().setFileModel(request, "avatar", getPathFile().avatar));
                    message = iServiceSingup.newAccount(signup);
                    if (message.equals(ContaiUtils.REGISTER_TRUE)) {
                        response.sendRedirect(request.getContextPath() + "/account?result=signup-successfully");
                        return;
                    }
                } else {
                    message = ContaiUtils.REGISTER_PASSWORD_LENGTH_FALSE;
                }
            } else {
                message = ContaiUtils.REGISTER_EMAIL_FALSE;
            }
        } catch (InvocationTargetException | IllegalAccessException e) {
            message = ContaiUtils.ERROR_DATA;
            e.printStackTrace();
        }
        request.setAttribute("birthday", FormatUtils.getFormatUtils().dateToString(signup.getBirthday()));
        request.setAttribute("account", signup);
        request.setAttribute("errorRegister", message);
        doGet(request, response);
    }
}
