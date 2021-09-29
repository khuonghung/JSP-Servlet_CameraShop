package polymart.xyz.ass_jv4.service.implement;

import polymart.xyz.ass_jv4.dao.IDAOCategory;
import polymart.xyz.ass_jv4.dao.implement.DAOCategory;
import polymart.xyz.ass_jv4.entity.EntityCategory;
import polymart.xyz.ass_jv4.service.IServiceCategory;

import java.util.List;

public class ServiceCategory implements IServiceCategory {

    private static IDAOCategory _idaoCategory = new DAOCategory();

    @Override
    public List<EntityCategory> findAll() {
        return _idaoCategory.findAll();
    }

    @Override
    public EntityCategory findById(String id) {
        return _idaoCategory.findById(id);
    }

    @Override
    public boolean newCategory(EntityCategory modelCategory) {
        return _idaoCategory.newCategory(modelCategory);
    }

    @Override
    public boolean updateCategory(EntityCategory category) {
        return _idaoCategory.updateCategory(category);
    }
}
