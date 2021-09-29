package polymart.xyz.ass_jv4.service;

import polymart.xyz.ass_jv4.entity.EntityAttribute;

import java.util.List;

public interface IServiceAttribute {

    List<EntityAttribute> findAll();

    EntityAttribute findById(String id);

    boolean newAttribute(EntityAttribute entityAttribute);

    boolean updateAttribute(EntityAttribute entityAttribute);

}
