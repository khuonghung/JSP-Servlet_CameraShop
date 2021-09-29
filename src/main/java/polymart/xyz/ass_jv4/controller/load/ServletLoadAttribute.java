package polymart.xyz.ass_jv4.controller.load;

import org.apache.commons.beanutils.BeanUtils;
import polymart.xyz.ass_jv4.entity.EntityAttribute;
import polymart.xyz.ass_jv4.service.IServiceAttribute;
import polymart.xyz.ass_jv4.service.implement.ServiceAttribute;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

@WebServlet(name = "ServletLoadAttribute", value = {"/load/attribute", "/load/attribute/add", "/load/attribute/edit"})
public class ServletLoadAttribute extends HttpServlet {

    private IServiceAttribute _iServiceAttribute;

    @Override
    public void init() throws ServletException {
        _iServiceAttribute = new ServiceAttribute();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String url = request.getRequestURI();
        try {
            EntityAttribute entityAttribute = new EntityAttribute();
            BeanUtils.populate(entityAttribute, request.getParameterMap());
            System.out.println(entityAttribute);
            if (entityAttribute.getName() != null && !entityAttribute.getName().trim().equals("")
                    && entityAttribute.getValue() != null && !entityAttribute.getValue().trim().equals("")) {
                if (url.contains("/load/attribute/add")) {
                    _iServiceAttribute.newAttribute(entityAttribute);
                } else if (url.contains("/load/attribute/edit")) {
                    if (entityAttribute.getId() > 0) {
                        _iServiceAttribute.updateAttribute(entityAttribute);
                    }
                }
            }
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }

        request.setAttribute("lstAttribute", _iServiceAttribute.findAll());
        request.getRequestDispatcher("/views/admin/page/product/layout/modelAttribute-table-data.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
