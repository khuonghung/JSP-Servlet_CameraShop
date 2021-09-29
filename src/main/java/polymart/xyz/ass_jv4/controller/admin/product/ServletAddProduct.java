package polymart.xyz.ass_jv4.controller.admin.product;

import org.apache.commons.beanutils.BeanUtils;
import polymart.xyz.ass_jv4.entity.*;
import polymart.xyz.ass_jv4.service.IServiceAttribute;
import polymart.xyz.ass_jv4.service.IServiceBrand;
import polymart.xyz.ass_jv4.service.IServiceCategory;
import polymart.xyz.ass_jv4.service.IServiceProduct;
import polymart.xyz.ass_jv4.service.implement.ServiceAttribute;
import polymart.xyz.ass_jv4.service.implement.ServiceBrand;
import polymart.xyz.ass_jv4.service.implement.ServiceCategory;
import polymart.xyz.ass_jv4.service.implement.ServiceProduct;
import polymart.xyz.ass_jv4.utils.BeanModelUtils;
import polymart.xyz.ass_jv4.utils.PathFileUtils;
import polymart.xyz.ass_jv4.utils.SessionUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@MultipartConfig
@WebServlet(name = "ServletAddProduct", value = {"/admin/product/add", "/admin/product/add/", "/admin/product/add-reload"})
public class ServletAddProduct extends HttpServlet {

    private IServiceBrand _iServiceBrand;
    private IServiceProduct _iServiceProduct;
    private IServiceCategory _iServiceCategory;
    private IServiceAttribute _iServiceAttribute;

    @Override
    public void init() throws ServletException {
        _iServiceCategory = new ServiceCategory();
        _iServiceBrand = new ServiceBrand();
        _iServiceProduct = new ServiceProduct();
        _iServiceAttribute = new ServiceAttribute();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        request.setAttribute("lstBrand", _iServiceBrand.findAll());
        request.setAttribute("lstCategory", _iServiceCategory.findAll());
        request.setAttribute("lstAttribute", _iServiceAttribute.findAll());

        request.getRequestDispatcher("/views/admin/page/product/addProduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        EntityProduct modelProduct = new EntityProduct();
        try {
            BeanUtils.populate(modelProduct, request.getParameterMap());
            String idCatregory = request.getParameter("category");
            String idBrand = request.getParameter("brand");
            if (idCatregory != null && Integer.parseInt(idCatregory) > 0) {
                EntityCategory entityCategory = _iServiceCategory.findById(idCatregory);
                if (entityCategory != null) {
                    modelProduct.setEntityCategory(entityCategory);
                }
            }
            if (idBrand != null && Integer.parseInt(idBrand) > 0) {
                EntityBrand entityBrand = _iServiceBrand.findById(idBrand);
                if (entityBrand != null) {
                    modelProduct.setEntityBrand(entityBrand);
                }
            }
            String url = request.getRequestURI();
            if (!url.contains("/add-reload")) {
                List<EntityProductImage> lstEntityProductImages = new ArrayList<>();
                Collection<Part> getParts = request.getParts();
                EntityProductImage entityProductImage;
                for (Part part : getParts) {
                    if (part != null && part.getSubmittedFileName() != null
                            && !part.getSubmittedFileName().equals("") && part.getName().contains("image")) {
                        entityProductImage = new EntityProductImage();
                        entityProductImage.setImage(BeanModelUtils.getBeanModel().saveFile(request, part, PathFileUtils.getPathFile().product));
                        lstEntityProductImages.add(entityProductImage);
                    }
                }
                modelProduct.setLstEntityProductImages(lstEntityProductImages);
                List<EntityProductDetails> lstEntityProductDetails = new ArrayList<>();
                String[] attributes = request.getParameterValues("idAttributes");
                String[] prices = request.getParameterValues("prices");
                String[] locations = request.getParameterValues("locations");
                EntityAttribute entityAttribute;
                EntityProductDetails entityProductDetails;
                for (int i = 0; i < attributes.length; i++) {
                    String attribute = attributes[i];
                    String price = prices[i];
                    String location = locations[i];
                    if (attribute != null && !attribute.trim().equals("") && Integer.parseInt(attribute) > 0
                            && price != null && Long.parseLong(price) > 0
                            && location != null && !location.trim().equals("")) {
                        entityAttribute = _iServiceAttribute.findById(attribute);
                        if (entityAttribute != null) {
                            entityProductDetails = new EntityProductDetails();
                            entityProductDetails.setEntityAttribute(entityAttribute);
                            entityProductDetails.setPrice(Long.valueOf(price));
                            entityProductDetails.setLocation(location);
                            lstEntityProductDetails.add(entityProductDetails);
                        }
                    }
                }
                modelProduct.setLstEntityProductDetails(lstEntityProductDetails);
                EntityStaff modelStaff = (EntityStaff) SessionUtils.getSessionUtils().getSessionModel("user", new EntityStaff(), request);
                modelProduct.setEntityStaff(modelStaff);
                modelProduct.setStatus(true);
                if (_iServiceProduct.newProduct(modelProduct)) {
                    response.sendRedirect(request.getContextPath() + "/admin/product/quan-ly-san-pham");
                    return;
                } else {
                    request.setAttribute("addProductError", "Thêm sản phẩm mới thất bại");
                }
            }
            request.setAttribute("product", modelProduct);
            request.setAttribute("lstBrand", _iServiceBrand.findAll());
            request.setAttribute("lstCategory", _iServiceCategory.findAll());
            request.setAttribute("lstAttribute", _iServiceAttribute.findAll());

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("/views/admin/page/product/addProduct.jsp").forward(request, response);

    }
}
