package polymart.xyz.ass_jv4.dao.implement;

import polymart.xyz.ass_jv4.dao.IDAOBrand;
import polymart.xyz.ass_jv4.entity.EntityBrand;
import polymart.xyz.ass_jv4.utils.ContaiUtils;

import javax.persistence.TypedQuery;
import java.util.List;

public class DAOBrand extends AbstractDAO<EntityBrand> implements IDAOBrand {

    public DAOBrand() {
    }

    @Override
    public List<EntityBrand> findAll() {
        TypedQuery<EntityBrand> query = em.createNamedQuery("findAllBrand", EntityBrand.class);
        return query.getResultList();
    }

    @Override
    public EntityBrand findById(String id) {
        try {
            EntityBrand entityBrand = em.find(EntityBrand.class, Integer.parseInt(id));
            if (entityBrand != null && !entityBrand.isRemoved()) {
                return entityBrand;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public EntityBrand findByName(String name) {
        TypedQuery<EntityBrand> query = em.createNamedQuery("findByNameBrand", EntityBrand.class);
        query = query(query, name);
        if (query.getResultList().size() > 0) {
            return query.getSingleResult();
        }
        return null;
    }

    @Override
    public boolean updateBrand(EntityBrand brand) {
        EntityBrand entityBrand = findById(brand.getId() + "");
        if (entityBrand != null) {
            if (findByEmailAndPhone(brand.getEmail(), brand.getPhoneNumber()).size() == 0) {
                return update(brand, ContaiUtils.UPDATE);
            }
        }
        return false;
    }

    @Override
    public boolean newBrand(EntityBrand brand) {
        if (findByEmailAndPhone(brand.getEmail(), brand.getPhoneNumber()).size() == 0) {
            return update(brand, ContaiUtils.INSERT);
        }
        return false;
    }

    private List<EntityBrand> findByEmailAndPhone(String email, String phone) {
        TypedQuery<EntityBrand> query = em.createNamedQuery("findCheckByEmailPhoneNumber", EntityBrand.class);
        query = query(query, email, phone);
        return query.getResultList();
    }
}
