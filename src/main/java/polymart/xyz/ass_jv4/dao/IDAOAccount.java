package polymart.xyz.ass_jv4.dao;

import polymart.xyz.ass_jv4.entity.EntityStaff;

public interface IDAOAccount extends GenericDAO<EntityStaff> {

    String newAccount(EntityStaff signup);

    String newLogin(EntityStaff signin);

    EntityStaff findByEmail(String email);

    EntityStaff findById(String id);

    boolean activeAccount(String id);

}
