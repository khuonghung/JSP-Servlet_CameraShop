package polymart.xyz.ass_jv4.service;

import polymart.xyz.ass_jv4.entity.EntityBanner;

import java.util.List;

public interface IServiceBanner {

    List<EntityBanner> findAll();

    List<EntityBanner> findShowBanner();

    EntityBanner findById(String id);

    boolean updateBanner(EntityBanner entityBanner);

    boolean newBanner(EntityBanner entityBanner);

}
