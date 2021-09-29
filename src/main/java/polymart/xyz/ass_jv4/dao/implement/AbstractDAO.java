package polymart.xyz.ass_jv4.dao.implement;

import polymart.xyz.ass_jv4.dao.GenericDAO;
import polymart.xyz.ass_jv4.utils.ContaiUtils;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import java.util.List;

import static polymart.xyz.ass_jv4.utils.EntityUtils.getEntityUtils;

public class AbstractDAO<T> implements GenericDAO<T> {

    public static final EntityManager em = getEntityUtils().getEntityManager();

    @Override
    public boolean update(T entity, String sql) {
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();
            if (sql.equals(ContaiUtils.INSERT)) {
                em.persist(entity);
            } else if (sql.equals(ContaiUtils.UPDATE)) {
                em.merge(entity);
            } else if (sql.equals(ContaiUtils.DELETE)) {
                em.remove(entity);
            }
            transaction.commit();
            return true;
        } catch (Exception e) {
            transaction.rollback();
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public TypedQuery<T> query(TypedQuery<T> query, Object... parameters) {
        try {
            for (int i = 0; i < parameters.length; i++) {
                query.setParameter(i + 1, parameters[i]);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return query;
    }

}
