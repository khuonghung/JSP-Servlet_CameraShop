package polymart.xyz.ass_jv4.service;

import polymart.xyz.ass_jv4.entity.EntityBrand;

import java.util.List;

public interface IServiceBrand {

    List<EntityBrand> findAll();

    EntityBrand findById(String id);

    boolean updateBrand(EntityBrand entityBrand);

    boolean newBrand(EntityBrand modelBrand);

}
