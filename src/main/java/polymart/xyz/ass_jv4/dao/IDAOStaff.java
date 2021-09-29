package polymart.xyz.ass_jv4.dao;

import polymart.xyz.ass_jv4.entity.EntityStaff;

import java.util.List;

public interface IDAOStaff extends GenericDAO<EntityStaff> {

    List<EntityStaff> findAll();

    EntityStaff findByEmail(String email);

    boolean updateStaff(EntityStaff staff);

    boolean editStaff(EntityStaff staff, String emailOld);

    EntityStaff findByFullName(String lastName, String firstName);

}
