package polymart.xyz.ass_jv4.service;

import polymart.xyz.ass_jv4.entity.EntityLike;
import polymart.xyz.ass_jv4.entity.EntityProduct;
import polymart.xyz.ass_jv4.entity.EntityVisit;

import java.util.List;

public interface IServiceLike {

    List<EntityLike> findAll();

    List<EntityLike> findByProductAndUser(EntityVisit entityVisitm, EntityProduct entityProduct);

    EntityLike findById(String id);

    boolean updateLike(EntityLike entityLike);

    boolean newLike(EntityLike entityLike);

}
