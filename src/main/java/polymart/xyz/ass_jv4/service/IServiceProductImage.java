package polymart.xyz.ass_jv4.service;

import polymart.xyz.ass_jv4.entity.EntityProductImage;

import java.util.List;

public interface IServiceProductImage {

    EntityProductImage findByIdProductAndImage(String idProduct, String image);

    List<EntityProductImage> findByIdProduct(String idProduct);

}
