package polymart.xyz.ass_jv4.dao;

import polymart.xyz.ass_jv4.entity.EntityProductImage;

import java.util.List;

public interface IDAOProductImage extends GenericDAO<EntityProductImage> {

    void saveImage(EntityProductImage entityProduct);

    EntityProductImage findByIdProductAndImage(String idProduct, String image);

    List<EntityProductImage> findByIdProduct(String idProduct);

}
