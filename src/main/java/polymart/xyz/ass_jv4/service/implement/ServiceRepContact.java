package polymart.xyz.ass_jv4.service.implement;

import polymart.xyz.ass_jv4.dao.IDAORepContact;
import polymart.xyz.ass_jv4.dao.implement.DAORepContact;
import polymart.xyz.ass_jv4.entity.EntityRepContact;
import polymart.xyz.ass_jv4.service.IServiceRepContact;

import java.util.List;

public class ServiceRepContact implements IServiceRepContact {

    private IDAORepContact _idaoRepContact = new DAORepContact();

    @Override
    public List<EntityRepContact> findAll() {
        return _idaoRepContact.findAll();
    }

    @Override
    public EntityRepContact findById(String id) {
        return _idaoRepContact.findById(id);
    }

    @Override
    public boolean newRepContact(EntityRepContact entityRepContact) {
        return _idaoRepContact.newRepContact(entityRepContact);
    }
}
