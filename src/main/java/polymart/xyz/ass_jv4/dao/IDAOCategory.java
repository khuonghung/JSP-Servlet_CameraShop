package polymart.xyz.ass_jv4.dao;

import polymart.xyz.ass_jv4.entity.EntityCategory;

import java.util.List;

public interface IDAOCategory extends GenericDAO<EntityCategory> {

    List<EntityCategory> findAll();

    EntityCategory findByName(String name);

    EntityCategory findById(String id);

    boolean newCategory(EntityCategory category);

    boolean updateCategory(EntityCategory category);

}
