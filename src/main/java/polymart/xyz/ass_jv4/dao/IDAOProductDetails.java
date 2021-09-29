package polymart.xyz.ass_jv4.dao;

import polymart.xyz.ass_jv4.entity.EntityProductDetails;

import java.util.List;

public interface IDAOProductDetails extends GenericDAO<EntityProductDetails> {

    List<EntityProductDetails> findAll();

    boolean newProductDetails(EntityProductDetails entityProductDetails);

    boolean updateProductDetails(EntityProductDetails entityProductDetails);

    EntityProductDetails findById(String id);
}
