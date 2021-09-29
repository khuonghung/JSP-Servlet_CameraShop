package polymart.xyz.ass_jv4.service.implement;

import polymart.xyz.ass_jv4.dao.IDAOBrand;
import polymart.xyz.ass_jv4.dao.implement.DAOBrand;
import polymart.xyz.ass_jv4.entity.EntityBrand;
import polymart.xyz.ass_jv4.service.IServiceBrand;

import java.util.List;

public class ServiceBrand implements IServiceBrand {

    private static IDAOBrand _iDaoBrand = new DAOBrand();

    @Override
    public List<EntityBrand> findAll() {
        return _iDaoBrand.findAll();
    }

    @Override
    public EntityBrand findById(String id) {
        return _iDaoBrand.findById(id);
    }

    @Override
    public boolean updateBrand(EntityBrand entityBrand) {
        return _iDaoBrand.updateBrand(entityBrand);
    }

    @Override
    public boolean newBrand(EntityBrand entityBrand) {
        return _iDaoBrand.newBrand(entityBrand);
    }
}
