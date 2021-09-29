package polymart.xyz.ass_jv4.dao.implement;

import polymart.xyz.ass_jv4.dao.IDAOAccount;
import polymart.xyz.ass_jv4.entity.EntityStaff;
import polymart.xyz.ass_jv4.utils.ContaiUtils;

import javax.persistence.TypedQuery;
import java.util.List;

public class DAOAccount extends AbstractDAO<EntityStaff> implements IDAOAccount {

    @Override
    public String newAccount(EntityStaff signup) {
        TypedQuery<EntityStaff> query = em.createNamedQuery("findByEmailStaff", EntityStaff.class);
        query = query(query, signup.getEmail());
        if (query.getResultList().size() > 0) {
            return ContaiUtils.REGISTER_EMAIL_FALSE;
        }
        if (update(signup, ContaiUtils.INSERT)) {
            return ContaiUtils.REGISTER_TRUE;
        }
        return ContaiUtils.REGISTER_FALSE;
    }

    @Override
    public String newLogin(EntityStaff signin) {
        TypedQuery<EntityStaff> query = em.createNamedQuery("loginStaff", EntityStaff.class);
        query = query(query, signin.getEmail(), signin.getPassword());
        List<EntityStaff> lst = query.getResultList();
        if (lst.size() > 0) {
            if (lst.get(0).isBlocked()) {
                return ContaiUtils.ACCOUNT_BLOCK;
            }
            if (lst.get(0).isActive()) {
                return ContaiUtils.LOGIN_TRUE;
            } else {
                return ContaiUtils.ACTIVE_FALSE;
            }
        }
        return ContaiUtils.LOGIN_FALSE;
    }

    @Override
    public EntityStaff findByEmail(String email) {
        TypedQuery<EntityStaff> query = em.createNamedQuery("findByEmailStaff", EntityStaff.class);
        query = query(query, email);
        List<EntityStaff> lstStaff = query.getResultList();
        if (lstStaff.size() > 0) {
            return lstStaff.get(0);
        }
        return null;
    }

    @Override
    public EntityStaff findById(String id) {
        try {
            return em.find(EntityStaff.class, Integer.parseInt(id));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean activeAccount(String id) {
        try {
            EntityStaff entityStaff = em.find(EntityStaff.class, Integer.parseInt(id));
            entityStaff.setActive(true);
            return update(entityStaff, ContaiUtils.UPDATE);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}
