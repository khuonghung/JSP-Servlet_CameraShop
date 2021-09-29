package polymart.xyz.ass_jv4.service;

import polymart.xyz.ass_jv4.entity.EntityVisit;

import java.util.List;

public interface IServiceVisit {

    List<EntityVisit> findAll();

    EntityVisit findByPhone(String phoneNumber);

    EntityVisit findByPhoneAnhPassword(String phoneNumber, String password);

    boolean updateVisit(EntityVisit entityVisit);

    boolean newVisit(EntityVisit entityVisit);

}
