package polymart.xyz.ass_jv4.dao;

import polymart.xyz.ass_jv4.entity.EntityAttribute;

import java.util.List;

public interface IDAOAttribute extends GenericDAO<EntityAttribute> {

    List<EntityAttribute> findAll();

    EntityAttribute findById(String id);

    EntityAttribute findByNameAndValue(String name, String value);

    boolean newAttribute(EntityAttribute entityAttribute);

    boolean updateAttribute(EntityAttribute entityAttribute);


}
