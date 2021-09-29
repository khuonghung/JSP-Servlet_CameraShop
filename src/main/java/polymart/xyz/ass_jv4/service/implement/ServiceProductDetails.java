package polymart.xyz.ass_jv4.service.implement;

import polymart.xyz.ass_jv4.dao.IDAOProductDetails;
import polymart.xyz.ass_jv4.dao.implement.DAOProductDetails;
import polymart.xyz.ass_jv4.entity.EntityProductDetails;
import polymart.xyz.ass_jv4.service.IServiceProductDetails;

import java.util.List;

public class ServiceProductDetails implements IServiceProductDetails {

    private IDAOProductDetails _idaoProductDetails = new DAOProductDetails();

    @Override
    public List<EntityProductDetails> findAll() {
        return _idaoProductDetails.findAll();
    }

    @Override
    public EntityProductDetails findById(String id) {
        return _idaoProductDetails.findById(id);
    }

    @Override
    public boolean updateProductDetails(EntityProductDetails entityProductDetails) {
        return _idaoProductDetails.updateProductDetails(entityProductDetails);
    }
}
