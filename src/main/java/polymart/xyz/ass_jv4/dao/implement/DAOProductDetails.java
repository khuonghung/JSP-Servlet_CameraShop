package polymart.xyz.ass_jv4.dao.implement;

import polymart.xyz.ass_jv4.dao.IDAOProductDetails;
import polymart.xyz.ass_jv4.entity.EntityProductDetails;
import polymart.xyz.ass_jv4.utils.ContaiUtils;

import javax.persistence.TypedQuery;
import java.util.List;

public class DAOProductDetails extends AbstractDAO<EntityProductDetails> implements IDAOProductDetails {

    @Override
    public List<EntityProductDetails> findAll() {
        TypedQuery<EntityProductDetails> query = em.createNamedQuery("findAll", EntityProductDetails.class);
        return query.getResultList();
    }

    @Override
    public boolean newProductDetails(EntityProductDetails entityProductDetails) {
        TypedQuery<EntityProductDetails> query = em.createNamedQuery("findByAll", EntityProductDetails.class);
        query = query(query, entityProductDetails.getEntityProduct(), entityProductDetails.getEntityAttribute(),
                entityProductDetails.getPrice());
        if (query.getResultList().size() == 0) {
            return update(entityProductDetails, ContaiUtils.INSERT);
        }
        return false;
    }

    @Override
    public boolean updateProductDetails(EntityProductDetails entityProductDetails) {
        if (findById(entityProductDetails.getId() + "") != null) {
            return update(entityProductDetails, ContaiUtils.UPDATE);
        }
        return false;
    }

    @Override
    public EntityProductDetails findById(String id) {
        try {
            return em.find(EntityProductDetails.class, Integer.parseInt(id));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
