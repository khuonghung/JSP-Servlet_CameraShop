package polymart.xyz.ass_jv4.dao.implement;

import polymart.xyz.ass_jv4.dao.IDAOVisit;
import polymart.xyz.ass_jv4.entity.EntityVisit;
import polymart.xyz.ass_jv4.utils.ContaiUtils;

import javax.persistence.TypedQuery;
import java.util.List;

public class DAOVisit extends AbstractDAO<EntityVisit> implements IDAOVisit {
    @Override
    public List<EntityVisit> findAll() {
        TypedQuery<EntityVisit> query = em.createNamedQuery("findAllVisit", EntityVisit.class);
        if (query.getResultList().size() > 0) {
            return query.getResultList();
        }
        return null;
    }

    @Override
    public EntityVisit findByPhone(String phoneNumber) {
        return em.find(EntityVisit.class, phoneNumber);
    }

    @Override
    public EntityVisit findByPhoneAnhPassword(String phoneNumber, String password) {
        TypedQuery<EntityVisit> query = em.createNamedQuery("findByPhoneAndPasswordVisit", EntityVisit.class);
        query = query(query, phoneNumber, password);
        if (query.getResultList().size() > 0) {
            return query.getSingleResult();
        }
        return null;
    }

    @Override
    public boolean updateVisit(EntityVisit entityVisit) {
        if (findByPhone(entityVisit.getPhoneNumber()) != null) {
            return update(entityVisit, ContaiUtils.UPDATE);
        }
        return false;
    }

    @Override
    public boolean newVisit(EntityVisit entityVisit) {
        if (findByPhone(entityVisit.getPhoneNumber()) == null) {
            return update(entityVisit, ContaiUtils.INSERT);
        }
        return false;
    }
}
