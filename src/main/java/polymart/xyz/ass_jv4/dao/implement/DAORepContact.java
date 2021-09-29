package polymart.xyz.ass_jv4.dao.implement;

import polymart.xyz.ass_jv4.dao.IDAORepContact;
import polymart.xyz.ass_jv4.entity.EntityRepContact;
import polymart.xyz.ass_jv4.utils.ContaiUtils;

import javax.persistence.TypedQuery;
import java.util.List;

public class DAORepContact extends AbstractDAO<EntityRepContact> implements IDAORepContact {
    @Override
    public List<EntityRepContact> findAll() {
        TypedQuery<EntityRepContact> query = em.createNamedQuery("findAllRepContact", EntityRepContact.class);
        return query.getResultList();
    }

    @Override
    public EntityRepContact findById(String id) {
        try {
            return em.find(EntityRepContact.class, Integer.parseInt(id));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean newRepContact(EntityRepContact entityRepContact) {
        return update(entityRepContact, ContaiUtils.INSERT);
    }
}
