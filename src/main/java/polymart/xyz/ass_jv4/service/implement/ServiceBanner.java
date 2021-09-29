package polymart.xyz.ass_jv4.service.implement;

import polymart.xyz.ass_jv4.dao.IDAOBanner;
import polymart.xyz.ass_jv4.dao.implement.DAOBanner;
import polymart.xyz.ass_jv4.entity.EntityBanner;
import polymart.xyz.ass_jv4.service.IServiceBanner;

import java.util.List;

public class ServiceBanner implements IServiceBanner {

    private static final IDAOBanner _idaoBanner = new DAOBanner();

    @Override
    public List<EntityBanner> findAll() {
        return _idaoBanner.findAll();
    }

    @Override
    public List<EntityBanner> findShowBanner() {
        return _idaoBanner.findShowBanner();
    }

    @Override
    public EntityBanner findById(String id) {
        return _idaoBanner.findById(id);
    }

    @Override
    public boolean updateBanner(EntityBanner entityBanner) {
        return _idaoBanner.updateBanner(entityBanner);
    }

    @Override
    public boolean newBanner(EntityBanner entityBanner) {
        return _idaoBanner.newBanner(entityBanner);
    }
}
