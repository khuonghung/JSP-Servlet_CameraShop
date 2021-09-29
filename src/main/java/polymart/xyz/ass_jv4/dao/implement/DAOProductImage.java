package polymart.xyz.ass_jv4.dao.implement;

import polymart.xyz.ass_jv4.dao.IDAOProductImage;
import polymart.xyz.ass_jv4.entity.EntityProductImage;
import polymart.xyz.ass_jv4.utils.ContaiUtils;

import javax.persistence.TypedQuery;
import java.util.List;

public class DAOProductImage extends AbstractDAO<EntityProductImage> implements IDAOProductImage {
    @Override
    public void saveImage(EntityProductImage entityProduct) {
        if (findByIdProductAndImage(entityProduct.getEntityProduct().getId() + "",
                entityProduct.getImage()) == null) {
            update(entityProduct, ContaiUtils.INSERT);
        }
    }

    @Override
    public EntityProductImage findByIdProductAndImage(String idProduct, String image) {
        try {
            TypedQuery<EntityProductImage> query = em.createNamedQuery("findByIDProductAndImage", EntityProductImage.class);
            query = query(query, Integer.parseInt(idProduct), image);
            if (query.getResultList().size() > 0) {
                return query.getSingleResult();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<EntityProductImage> findByIdProduct(String idProduct) {
        try {
            TypedQuery<EntityProductImage> query = em.createNamedQuery("findByIdProduct", EntityProductImage.class);
            query = query(query, Integer.parseInt(idProduct));
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
