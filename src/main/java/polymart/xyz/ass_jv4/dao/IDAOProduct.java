package polymart.xyz.ass_jv4.dao;

import polymart.xyz.ass_jv4.entity.EntityProduct;

import java.util.List;

public interface IDAOProduct extends GenericDAO<EntityProduct> {

    List<EntityProduct> findAll();

    List<EntityProduct> findNewProduct();

    List<EntityProduct> findHotSaleProduct();

    List<EntityProduct> findMostViewedProduct();

    List<EntityProduct> findByTopBuy();

    List<EntityProduct> findNewImportProduct();

    List<EntityProduct> findHotProduct();

    List<EntityProduct> findRandomProduct();

    List<EntityProduct> findByIdCategory(String idCategory);

    List<EntityProduct> findByIdBrand(String idBrand);

    List<EntityProduct> findByMinAndMax(String min, String max);

    EntityProduct findById(String id);

    boolean updateProduct(EntityProduct product);

    boolean newProduct(EntityProduct product);

    EntityProduct findByAllAttributes(String name, String idCategory, String idBrand, String idStaff);

}
