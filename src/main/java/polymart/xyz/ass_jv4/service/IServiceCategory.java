package polymart.xyz.ass_jv4.service;

import polymart.xyz.ass_jv4.entity.EntityCategory;

import java.util.List;

public interface IServiceCategory {

    List<EntityCategory> findAll();

    EntityCategory findById(String id);

    boolean newCategory(EntityCategory category);

    boolean updateCategory(EntityCategory category);

}
