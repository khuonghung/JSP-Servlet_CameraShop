package polymart.xyz.ass_jv4.dao.implement;

import polymart.xyz.ass_jv4.dao.IDAOLike;
import polymart.xyz.ass_jv4.entity.EntityLike;
import polymart.xyz.ass_jv4.entity.EntityProduct;
import polymart.xyz.ass_jv4.entity.EntityVisit;
import polymart.xyz.ass_jv4.utils.ContaiUtils;

import javax.persistence.TypedQuery;
import java.util.List;

public class DAOLike extends AbstractDAO<EntityLike> implements IDAOLike {
    @Override
    public List<EntityLike> findAll() {
        TypedQuery<EntityLike> query = em.createNamedQuery("findAllLike", EntityLike.class);
        return query.getResultList();
    }

    @Override
    public List<EntityLike> findByProductAndUser(EntityVisit entityVisitm, EntityProduct entityProduct) {
        TypedQuery<EntityLike> query = em.createNamedQuery("findByVisitAndProductLike", EntityLike.class);
        query = query(query, entityVisitm, entityProduct);
        return query.getResultList();
    }

    @Override
    public EntityLike findById(String id) {
        try {
            return em.find(EntityLike.class, Integer.parseInt(id));
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public boolean updateLike(EntityLike entityLike) {
        if (findById(entityLike.getId() + "") != null) {
            return update(entityLike, ContaiUtils.DELETE);
        }
        return false;
    }

    @Override
    public boolean newLike(EntityLike entityLike) {
        if (findById(entityLike.getId() + "") == null) {
            return update(entityLike, ContaiUtils.INSERT);
        }
        return false;
    }

}
