package polymart.xyz.ass_jv4.service;

import polymart.xyz.ass_jv4.entity.EntityStaff;

public interface IServiceAccount {

    String newAccount(EntityStaff entityStaff);

    EntityStaff findByEmail(String email);

    EntityStaff findById(String id);

    String newLogin(EntityStaff signin);

    boolean activeAccount(String id);

}
