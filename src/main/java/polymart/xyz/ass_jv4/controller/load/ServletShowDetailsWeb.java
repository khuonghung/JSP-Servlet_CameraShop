package polymart.xyz.ass_jv4.controller.load;

import polymart.xyz.ass_jv4.entity.EntityProduct;
import polymart.xyz.ass_jv4.service.IServiceProduct;
import polymart.xyz.ass_jv4.service.implement.ServiceProduct;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletShowDetailsWeb", value = "/load/web/product")
public class ServletShowDetailsWeb extends HttpServlet {

    private IServiceProduct _iServiceProduct;

    @Override
    public void init() throws ServletException {
        _iServiceProduct = new ServiceProduct();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        if (id != null) {
            EntityProduct entityProduct = _iServiceProduct.findById(id);
            if (entityProduct != null) {

                request.setAttribute("product1", entityProduct);
                request.getRequestDispatcher("/views/website/layout/showDetailsQuickView.jsp").forward(request, response);
            }
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
