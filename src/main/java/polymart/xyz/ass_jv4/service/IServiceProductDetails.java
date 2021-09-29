package polymart.xyz.ass_jv4.service;

import polymart.xyz.ass_jv4.entity.EntityProductDetails;

import java.util.List;

public interface IServiceProductDetails {

    List<EntityProductDetails> findAll();

    EntityProductDetails findById(String id);

    boolean updateProductDetails(EntityProductDetails entityProductDetails);

}
