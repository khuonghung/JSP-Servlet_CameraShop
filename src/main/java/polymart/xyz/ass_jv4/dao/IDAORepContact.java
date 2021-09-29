package polymart.xyz.ass_jv4.dao;

import polymart.xyz.ass_jv4.entity.EntityRepContact;

import java.util.List;

public interface IDAORepContact extends GenericDAO<EntityRepContact> {

    List<EntityRepContact> findAll();

    EntityRepContact findById(String id);

    boolean newRepContact(EntityRepContact entityRepContact);

}
