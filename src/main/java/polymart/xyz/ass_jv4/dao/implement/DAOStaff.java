package polymart.xyz.ass_jv4.dao.implement;

import polymart.xyz.ass_jv4.dao.IDAOStaff;
import polymart.xyz.ass_jv4.entity.EntityStaff;
import polymart.xyz.ass_jv4.utils.ContaiUtils;

import javax.persistence.TypedQuery;
import java.util.List;

public class DAOStaff extends AbstractDAO<EntityStaff> implements IDAOStaff {

    @Override
    public List<EntityStaff> findAll() {
        TypedQuery<EntityStaff> query = em.createNamedQuery("findAllStaff", EntityStaff.class);
        return query.getResultList();
    }

    @Override
    public EntityStaff findByEmail(String email) {
        TypedQuery<EntityStaff> query = em.createNamedQuery("findByEmailStaff", EntityStaff.class);
        query = query(query, email);
        if (query.getResultList().size() > 0) {
            return query.getSingleResult();
        }
        return null;
    }

    @Override
    public boolean updateStaff(EntityStaff staff) {
        EntityStaff entityStaff = findByEmail(staff.getEmail());
        if (entityStaff == null) {
            return false;
        }
        staff.setId(entityStaff.getId());
        staff.setPassword(entityStaff.getPassword());
        return update(staff, ContaiUtils.UPDATE);
    }

    @Override
    public boolean editStaff(EntityStaff staff, String emailOld) {
        EntityStaff entityStaff = findByEmail(emailOld);
        if (entityStaff == null) {
            return false;
        }
        staff.setId(entityStaff.getId());
        staff.setPassword(entityStaff.getPassword());
        return update(staff, ContaiUtils.UPDATE);
    }

    @Override
    public EntityStaff findByFullName(String lastName, String firstName) {
        TypedQuery<EntityStaff> query = em.createNamedQuery("findByFullNameStaff", EntityStaff.class);
        query = query(query, lastName, firstName);
        if (query.getResultList().size() > 0) {
            return query.getSingleResult();
        }
        return null;
    }

}
