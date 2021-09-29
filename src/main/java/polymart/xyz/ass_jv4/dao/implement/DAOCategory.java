package polymart.xyz.ass_jv4.dao.implement;

import polymart.xyz.ass_jv4.dao.IDAOCategory;
import polymart.xyz.ass_jv4.entity.EntityCategory;
import polymart.xyz.ass_jv4.utils.ContaiUtils;

import javax.persistence.TypedQuery;
import java.util.List;

public class DAOCategory extends AbstractDAO<EntityCategory> implements IDAOCategory {
    @Override
    public List<EntityCategory> findAll() {
        TypedQuery<EntityCategory> query = em.createNamedQuery("findAllCategory", EntityCategory.class);
        return query.getResultList();
    }

    @Override
    public EntityCategory findByName(String name) {
        TypedQuery<EntityCategory> query = em.createNamedQuery("findByNameCategory", EntityCategory.class);
        query = query(query, name);
        if (query.getResultList().size() > 0) {
            return query.getSingleResult();
        }
        return null;
    }

    @Override
    public EntityCategory findById(String id) {
        try {
            return em.find(EntityCategory.class, Integer.parseInt(id));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean newCategory(EntityCategory category) {
        if (findByName(category.getName()) == null) {
            return update(category, ContaiUtils.INSERT);
        }
        return false;
    }

    @Override
    public boolean updateCategory(EntityCategory category) {
        if (findById(category.getId() + "") != null) {
            return update(category, ContaiUtils.UPDATE);
        }
        return false;
    }
}
