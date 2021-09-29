package polymart.xyz.ass_jv4.controller.load;

import polymart.xyz.ass_jv4.entity.*;
import polymart.xyz.ass_jv4.service.IServiceLike;
import polymart.xyz.ass_jv4.service.IServiceProduct;
import polymart.xyz.ass_jv4.service.IServiceProductDetails;
import polymart.xyz.ass_jv4.service.IServiceProductImage;
import polymart.xyz.ass_jv4.service.implement.ServiceLike;
import polymart.xyz.ass_jv4.service.implement.ServiceProduct;
import polymart.xyz.ass_jv4.service.implement.ServiceProductDetails;
import polymart.xyz.ass_jv4.service.implement.ServiceProductImage;
import polymart.xyz.ass_jv4.utils.SessionUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServletLoadProduct", value = {"/load/product", "/load/like"})
public class ServletLoadProduct extends HttpServlet {

    private IServiceProduct _iServiceProduct;
    private IServiceProductDetails _iServiceProductDetails;
    private IServiceProductImage _iServiceProductImage;
    private IServiceLike _iServiceLike;

    @Override
    public void init() throws ServletException {
        _iServiceProduct = new ServiceProduct();
        _iServiceProductDetails = new ServiceProductDetails();
        _iServiceProductImage = new ServiceProductImage();
        _iServiceLike = new ServiceLike();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String url = request.getRequestURI();
        if (url.contains("/load/like")) {
            String id = request.getParameter("id");
            EntityProduct entityProduct = _iServiceProduct.findById(id);
            if (entityProduct != null) {
                EntityVisit entityVisit = new EntityVisit();
                entityVisit = (EntityVisit) SessionUtils.getSessionUtils().getSessionModel("visit", entityVisit, request);
                List<EntityLike> lst = _iServiceLike.findByProductAndUser(entityVisit, entityProduct);
                if (lst != null && lst.size() > 0) {
                    EntityLike entityLike = lst.get(0);
                    _iServiceLike.updateLike(entityLike);
                } else {
                    EntityLike entityLike = new EntityLike();
                    entityLike.setEntityVisit(entityVisit);
                    entityLike.setEntityProduct(entityProduct);
                    _iServiceLike.newLike(entityLike);
                }
            }
            return;
        } else if (url.contains("/load/product")) {
            String id = request.getParameter("id");
            String idDetails = request.getParameter("idDetails");
            String imageBig = request.getParameter("imageBig");
            String view = request.getParameter("view");
            System.out.println(view);
            if (view != null) {
                EntityProduct product = _iServiceProduct.findById(view);
                if (product != null) {
                    product.setView(product.getView() + 1);
                    System.out.println(product);
                    _iServiceProduct.updateProduct(product);
                }
            }
            if (id != null) {
                EntityProduct product = _iServiceProduct.findById(id);
                if (product != null) {
                    String price = "0";
                    if (idDetails != null && !idDetails.equals("")) {
                        EntityProductDetails entityProductDetails = _iServiceProductDetails.findById(idDetails);
                        if (entityProductDetails != null) {
                            price = entityProductDetails.getPrice() + "";
                            request.setAttribute("idDetails", idDetails);
                        }
                    }
                    String image = "";
                    List<EntityProductImage> lst = _iServiceProductImage.findByIdProduct(product.getId() + "");
                    if (lst != null && lst.size() > 0) {
                        if (imageBig != null && Integer.parseInt(imageBig) > -1) {
                            image = lst.get(Integer.parseInt(imageBig)).getImage();
                        } else {
                            image = lst.get(0).getImage();
                        }
                    }
                    System.out.println(image);
                    request.setAttribute("imageBig", image);
                    request.setAttribute("price", price);
                    request.setAttribute("product", product);
                    request.getRequestDispatcher("/views/admin/page/product/layout/modalShowDetailProduct.jsp").forward(request, response);
                    return;
                }
            }
            response.sendRedirect(request.getContextPath() + "/admin/product");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
