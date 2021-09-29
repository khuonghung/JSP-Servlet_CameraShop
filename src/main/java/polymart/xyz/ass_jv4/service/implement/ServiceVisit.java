package polymart.xyz.ass_jv4.service.implement;

import polymart.xyz.ass_jv4.dao.IDAOVisit;
import polymart.xyz.ass_jv4.dao.implement.DAOVisit;
import polymart.xyz.ass_jv4.entity.EntityProductDetails;
import polymart.xyz.ass_jv4.entity.EntityVisit;
import polymart.xyz.ass_jv4.service.IServiceVisit;

import java.util.ArrayList;
import java.util.List;

public class ServiceVisit implements IServiceVisit {

    private static IDAOVisit _idaoVisit = new DAOVisit();

    @Override
    public List<EntityVisit> findAll() {
        return _idaoVisit.findAll();
    }

    @Override
    public EntityVisit findByPhone(String phoneNumber) {
        return _idaoVisit.findByPhone(phoneNumber);
    }

    @Override
    public EntityVisit findByPhoneAnhPassword(String phoneNumber, String password) {
        return _idaoVisit.findByPhoneAnhPassword(phoneNumber, password);
    }

    @Override
    public boolean updateVisit(EntityVisit entityVisit) {
        return _idaoVisit.updateVisit(entityVisit);
    }

    @Override
    public boolean newVisit(EntityVisit entityVisit) {
        return _idaoVisit.newVisit(entityVisit);
    }

}
