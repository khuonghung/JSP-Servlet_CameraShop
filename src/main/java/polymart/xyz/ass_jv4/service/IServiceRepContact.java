package polymart.xyz.ass_jv4.service;

import polymart.xyz.ass_jv4.entity.EntityRepContact;

import java.util.List;

public interface IServiceRepContact {

    List<EntityRepContact> findAll();

    EntityRepContact findById(String id);

    boolean newRepContact(EntityRepContact entityRepContact);

}
