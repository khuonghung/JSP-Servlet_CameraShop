package polymart.xyz.ass_jv4.service.implement;

import polymart.xyz.ass_jv4.dao.*;
import polymart.xyz.ass_jv4.dao.implement.*;
import polymart.xyz.ass_jv4.entity.*;
import polymart.xyz.ass_jv4.service.IServiceProduct;

import java.util.*;

public class ServiceProduct implements IServiceProduct {

    private static IDAOProduct _idaoProduct = new DAOProduct();
    private IDAOProductImage _idaoProductImage = new DAOProductImage();
    private IDAOProductDetails _idaoProductDetails = new DAOProductDetails();

    @Override
    public List<EntityProduct> findAll() {
        return _idaoProduct.findAll();
    }

    @Override
    public List<EntityProduct> findNewProduct() {
        return _idaoProduct.findNewProduct();
    }

    @Override
    public List<EntityProduct> findHotSaleProduct() {
        return _idaoProduct.findHotSaleProduct();
    }

    @Override
    public List<EntityProduct> findMostViewedProduct() {
        return _idaoProduct.findMostViewedProduct();
    }

    @Override
    public List<EntityProduct> findRandomProduct() {
        List<EntityProduct> lst = _idaoProduct.findMostViewedProduct();
        Collections.shuffle(lst);
        return lst;
    }

    @Override
    public List<EntityProduct> findByTopBuy() {
        return _idaoProduct.findByTopBuy();
    }

    @Override
    public List<EntityProduct> findNewImportProduct() {
        return _idaoProduct.findNewImportProduct();
    }

    @Override
    public List<EntityProduct> findHotProduct() {
        return _idaoProduct.findHotProduct();
    }

    @Override
    public List<EntityProduct> findByIdCategory(String idCategory) {
        return _idaoProduct.findByIdCategory(idCategory);
    }

    @Override
    public List<EntityProduct> findByIdBrand(String idBrand) {
        return _idaoProduct.findByIdBrand(idBrand);
    }

    @Override
    public List<EntityProduct> findByMinAndMax(String min, String max) {
        return _idaoProduct.findByMinAndMax(min, max);
    }

    @Override
    public boolean updateProduct(EntityProduct product) {
        return _idaoProduct.updateProduct(product);
    }

    @Override
    public boolean newProduct(EntityProduct product) {
        if (_idaoProduct.newProduct(product)) {
            EntityProduct eproduct = _idaoProduct.findByAllAttributes(product.getName(), product.getEntityCategory().getId() + "",
                    product.getEntityBrand().getId() + "", product.getEntityStaff().getId() + "");
            if (eproduct != null) {
                // save image
                for (EntityProductImage x : product.getLstEntityProductImages()) {
                    x.setEntityProduct(eproduct);
                    _idaoProductImage.saveImage(x);
                }
                // save details
                for (EntityProductDetails x : product.getLstEntityProductDetails()) {
                    x.setEntityProduct(eproduct);
                    _idaoProductDetails.newProductDetails(x);
                }
                return true;
            }
        }
        return false;
    }

    @Override
    public EntityProduct findById(String id) {
        return _idaoProduct.findById(id);
    }

}
