package polymart.xyz.ass_jv4.dao.implement;

import polymart.xyz.ass_jv4.dao.IDAOContact;
import polymart.xyz.ass_jv4.entity.EntityContact;
import polymart.xyz.ass_jv4.utils.ContaiUtils;

import javax.persistence.TypedQuery;
import java.util.List;

public class DAOContact extends AbstractDAO<EntityContact> implements IDAOContact {
    @Override
    public List<EntityContact> findAll() {
        TypedQuery<EntityContact> query = em.createNamedQuery("findAllContact", EntityContact.class);
        return query.getResultList();
    }

    @Override
    public EntityContact findById(String id) {
        try {
            return em.find(EntityContact.class, Integer.parseInt(id));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean updateContact(EntityContact entityContact) {
        if (findById(entityContact.getId() + "") != null) {
            return update(entityContact, ContaiUtils.UPDATE);
        }
        return false;
    }

    @Override
    public boolean newContact(EntityContact entityContact) {
        return update(entityContact, ContaiUtils.INSERT);
    }
}
