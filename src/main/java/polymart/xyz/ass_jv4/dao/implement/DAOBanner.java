package polymart.xyz.ass_jv4.dao.implement;

import polymart.xyz.ass_jv4.dao.IDAOBanner;
import polymart.xyz.ass_jv4.entity.EntityBanner;
import polymart.xyz.ass_jv4.utils.ContaiUtils;

import javax.persistence.TypedQuery;
import java.util.Collections;
import java.util.Date;
import java.util.List;

public class DAOBanner extends AbstractDAO<EntityBanner> implements IDAOBanner {
    @Override
    public List<EntityBanner> findAll() {
        TypedQuery<EntityBanner> query = em.createNamedQuery("findAllBanner", EntityBanner.class);
        return query.getResultList();
    }

    @Override
    public List<EntityBanner> findShowBanner() {
        TypedQuery<EntityBanner> query = em.createNamedQuery("findShowBanner", EntityBanner.class);
        query = query(query, new Date());
        List<EntityBanner> lst = query.getResultList();
        return query.getResultList();
    }

    @Override
    public EntityBanner findById(String id) {
        try {
            return em.find(EntityBanner.class, Integer.parseInt(id));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean updateBanner(EntityBanner entityBanner) {
        if (findById(entityBanner.getId() + "") != null) {
            return update(entityBanner, ContaiUtils.UPDATE);
        }
        return false;
    }

    @Override
    public boolean newBanner(EntityBanner entityBanner) {
        return update(entityBanner, ContaiUtils.INSERT);
    }
}
