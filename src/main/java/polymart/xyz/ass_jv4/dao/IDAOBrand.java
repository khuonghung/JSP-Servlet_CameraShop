package polymart.xyz.ass_jv4.dao;

import polymart.xyz.ass_jv4.entity.EntityBrand;

import java.util.List;

public interface IDAOBrand extends GenericDAO<EntityBrand> {

    List<EntityBrand> findAll();

    EntityBrand findById(String id);

    EntityBrand findByName(String name);

    boolean updateBrand(EntityBrand brand);

    boolean newBrand(EntityBrand brand);

}
