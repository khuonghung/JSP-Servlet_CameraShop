package polymart.xyz.ass_jv4.service;

import polymart.xyz.ass_jv4.entity.EntityProduct;

import java.util.List;

public interface IServiceProduct {

    List<EntityProduct> findAll();

    List<EntityProduct> findNewProduct();

    List<EntityProduct> findHotSaleProduct();

    List<EntityProduct> findMostViewedProduct();

    List<EntityProduct> findRandomProduct();

    List<EntityProduct> findByTopBuy();

    List<EntityProduct> findNewImportProduct();

    List<EntityProduct> findHotProduct();

    List<EntityProduct> findByIdCategory(String idCategory);

    List<EntityProduct> findByIdBrand(String idBrand);

    List<EntityProduct> findByMinAndMax(String min, String max);

    boolean updateProduct(EntityProduct product);

    boolean newProduct(EntityProduct product);

    EntityProduct findById(String id);

}
