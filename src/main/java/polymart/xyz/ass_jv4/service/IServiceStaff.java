package polymart.xyz.ass_jv4.service;

import polymart.xyz.ass_jv4.entity.EntityStaff;

import java.util.List;

public interface IServiceStaff {

    List<EntityStaff> findAll();

    EntityStaff fingByEmail(String email);

    boolean updateStaff(EntityStaff modelStaff);

    boolean editStaff(EntityStaff modelStaff, String emailOld);

    boolean changePassword(String email, String password, String newPassword);

}
