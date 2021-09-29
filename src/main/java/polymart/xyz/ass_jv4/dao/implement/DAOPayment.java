package polymart.xyz.ass_jv4.dao.implement;

import polymart.xyz.ass_jv4.dao.IDAOPayment;
import polymart.xyz.ass_jv4.entity.EntityPayment;
import polymart.xyz.ass_jv4.entity.EntityVisit;
import polymart.xyz.ass_jv4.entity.EntityVoucher;
import polymart.xyz.ass_jv4.utils.ContaiUtils;

import javax.persistence.TypedQuery;
import java.util.List;

public class DAOPayment extends AbstractDAO<EntityPayment> implements IDAOPayment {
    @Override
    public List<EntityPayment> findAll() {
        TypedQuery<EntityPayment> query = em.createNamedQuery("findAllPyament", EntityPayment.class);
        return query.getResultList();
    }

    @Override
    public boolean newPayment(EntityPayment payment) {
        return update(payment, ContaiUtils.INSERT);
    }

    @Override
    public EntityPayment findIdPayment(EntityVisit phoneNumberVisit, String paymentAmount) {
        TypedQuery<EntityPayment> query = em.createNamedQuery("findIdPayment", EntityPayment.class);
        try {
            query = query(query, phoneNumberVisit, Long.parseLong(paymentAmount));
            if (query.getResultList().size() > 0) {
                return query.getResultList().get(0);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public EntityPayment findById(String id) {
        try {
            return em.find(EntityPayment.class, Integer.parseInt(id));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean updatePayment(EntityPayment payment) {
        return update(payment, ContaiUtils.UPDATE);
    }
}
