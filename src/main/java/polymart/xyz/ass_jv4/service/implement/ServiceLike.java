package polymart.xyz.ass_jv4.service.implement;

import polymart.xyz.ass_jv4.dao.IDAOLike;
import polymart.xyz.ass_jv4.dao.implement.DAOLike;
import polymart.xyz.ass_jv4.entity.EntityLike;
import polymart.xyz.ass_jv4.entity.EntityProduct;
import polymart.xyz.ass_jv4.entity.EntityVisit;
import polymart.xyz.ass_jv4.service.IServiceLike;

import java.util.List;

public class ServiceLike implements IServiceLike {

    private IDAOLike _idaoLike = new DAOLike();

    @Override
    public List<EntityLike> findAll() {
        return _idaoLike.findAll();
    }

    @Override
    public List<EntityLike> findByProductAndUser(EntityVisit entityVisitm, EntityProduct entityProduct) {
        return _idaoLike.findByProductAndUser(entityVisitm, entityProduct);
    }

    @Override
    public EntityLike findById(String id) {
        return _idaoLike.findById(id);
    }

    @Override
    public boolean updateLike(EntityLike entityLike) {
        return _idaoLike.updateLike(entityLike);
    }

    @Override
    public boolean newLike(EntityLike entityLike) {
        return _idaoLike.newLike(entityLike);
    }
}
