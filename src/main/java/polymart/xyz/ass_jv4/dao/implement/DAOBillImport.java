package polymart.xyz.ass_jv4.dao.implement;

import polymart.xyz.ass_jv4.dao.IDAOBillImport;
import polymart.xyz.ass_jv4.entity.EntityBillImport;
import polymart.xyz.ass_jv4.utils.ContaiUtils;

import javax.persistence.TypedQuery;
import java.util.List;

public class DAOBillImport extends AbstractDAO<EntityBillImport> implements IDAOBillImport {
    @Override
    public List<EntityBillImport> findAll() {
        TypedQuery<EntityBillImport> query = em.createNamedQuery("findAllBillImport", EntityBillImport.class);
        return query.getResultList();
    }

    @Override
    public EntityBillImport findById(String id) {
        try {
            return em.find(EntityBillImport.class, Integer.parseInt(id));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean newBillImport(EntityBillImport entityBillImport) {
        return update(entityBillImport, ContaiUtils.INSERT);
    }

    @Override
    public EntityBillImport findByAll(EntityBillImport entityBillImport) {
        TypedQuery<EntityBillImport> query = em.createNamedQuery("findByAllBillImport", EntityBillImport.class);
        query = query(query, entityBillImport.getEntityStaffImport(), entityBillImport.getEntityStaffCheck(), entityBillImport.getDateImport());
        if (query.getResultList().size() > 0) {
            return query.getSingleResult();
        }
        return null;
    }
}
