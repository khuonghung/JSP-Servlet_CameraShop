package polymart.xyz.ass_jv4.dao.implement;

import polymart.xyz.ass_jv4.dao.IDAOVoucher;
import polymart.xyz.ass_jv4.entity.EntityVoucher;
import polymart.xyz.ass_jv4.utils.ContaiUtils;

import javax.persistence.TypedQuery;
import java.util.List;

public class DAOVoucher extends AbstractDAO<EntityVoucher> implements IDAOVoucher {
    @Override
    public List<EntityVoucher> findAll() {
        TypedQuery<EntityVoucher> query = em.createNamedQuery("findAllVoucher", EntityVoucher.class);
        return query.getResultList();
    }

    @Override
    public EntityVoucher findById(String id) {
        EntityVoucher entityVoucher = em.find(EntityVoucher.class, id);
        if (entityVoucher != null) {
            if (entityVoucher.getReQuantity() > 0 && !entityVoucher.isRemoved()) {
                return entityVoucher;
            }
        }
        return null;
    }

    @Override
    public boolean newVoucher(EntityVoucher entityVoucher) {
        if (findById(entityVoucher.getId()) == null) {
            return update(entityVoucher, ContaiUtils.INSERT);
        }
        return false;
    }

    @Override
    public boolean updateVoucher(EntityVoucher entityVoucher) {
        return update(entityVoucher, ContaiUtils.UPDATE);
    }
}
