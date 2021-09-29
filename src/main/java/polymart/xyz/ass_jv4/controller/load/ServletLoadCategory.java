package polymart.xyz.ass_jv4.controller.load;

import org.apache.commons.beanutils.BeanUtils;
import polymart.xyz.ass_jv4.entity.EntityCategory;
import polymart.xyz.ass_jv4.service.IServiceCategory;
import polymart.xyz.ass_jv4.service.implement.ServiceCategory;
import polymart.xyz.ass_jv4.utils.BeanModelUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;

@WebServlet(name = "ServletLoadCategory", value = {"/load/category", "/load/category/edit", "/load/category/add"})
public class ServletLoadCategory extends HttpServlet {

    private IServiceCategory _iServiceCategory;

    @Override
    public void init() throws ServletException {
        _iServiceCategory = new ServiceCategory();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        String url = request.getRequestURI();

        if (request.getParameter("name") != null && request.getParameter("description") != null) {
            EntityCategory modelCategory = new EntityCategory();
            try {
                BeanUtils.populate(modelCategory, request.getParameterMap());
                if (url.contains("/category/add")) {
                    _iServiceCategory.newCategory(modelCategory);
                } else if (url.contains("/category/edit")) {
                    System.out.println(modelCategory);
                    if (_iServiceCategory.findById(modelCategory.getId() + "") != null) {
                        _iServiceCategory.updateCategory(modelCategory);
                    }
                }
            } catch (InvocationTargetException | IllegalAccessException e) {
                e.printStackTrace();
            }
        }

        response.setContentType("text/html;charset=UTF-8");
        for (EntityCategory x : _iServiceCategory.findAll()) {
            if (!x.isRemoved()) {
                out.println("<tr>\n" +
                        "            <td class=\"showId\">" + x.getId() + "</td>\n" +
                        "            <td class=\"showName\">" + x.getName() + "</td>\n" +
                        "            <td class=\"showDescription\">" + x.getDescription() + "</td>\n" +
                        "            <td>\n" +
                        "                <button class=\"btneditcategory btn btn-info mx-2\"  data-toggle=\"modal\"\n" +
                        "            data-target=\".bd-example-modal-lg1\">Sửa</button>\n" +
                        "            </td>\n" +
                        "        </tr>");
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
