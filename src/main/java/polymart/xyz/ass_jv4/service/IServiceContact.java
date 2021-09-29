package polymart.xyz.ass_jv4.service;

import polymart.xyz.ass_jv4.entity.EntityContact;

import java.util.List;

public interface IServiceContact {

    List<EntityContact> findAll();

    EntityContact findById(String id);

    boolean updateContact(EntityContact entityContact);

    boolean newContact(EntityContact entityContact);

}
