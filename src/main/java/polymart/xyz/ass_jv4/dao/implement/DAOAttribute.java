package polymart.xyz.ass_jv4.dao.implement;

import polymart.xyz.ass_jv4.dao.IDAOAttribute;
import polymart.xyz.ass_jv4.entity.EntityAttribute;
import polymart.xyz.ass_jv4.utils.ContaiUtils;

import javax.persistence.TypedQuery;
import java.util.List;

public class DAOAttribute extends AbstractDAO<EntityAttribute> implements IDAOAttribute {
    @Override
    public List<EntityAttribute> findAll() {
        TypedQuery<EntityAttribute> query = em.createNamedQuery("findAllAttribute", EntityAttribute.class);
        return query.getResultList();
    }

    @Override
    public EntityAttribute findById(String id) {
        try {
            return em.find(EntityAttribute.class, Integer.parseInt(id));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public EntityAttribute findByNameAndValue(String name, String value) {
        TypedQuery<EntityAttribute> query = em.createNamedQuery("findByNameAndValue", EntityAttribute.class);
        query = query(query, name, value);
        if (query.getResultList().size() > 0) {
            return query.getSingleResult();
        }
        return null;
    }

    @Override
    public boolean newAttribute(EntityAttribute entityAttribute) {
        if (findByNameAndValue(entityAttribute.getName(), entityAttribute.getValue()) == null) {
            return update(entityAttribute, ContaiUtils.INSERT);
        }
        return false;
    }

    @Override
    public boolean updateAttribute(EntityAttribute entityAttribute) {
        if (findById(entityAttribute.getId() + "") != null
                && findByNameAndValue(entityAttribute.getName(), entityAttribute.getValue()) == null) {
            return update(entityAttribute, ContaiUtils.UPDATE);
        }
        return false;
    }
}
