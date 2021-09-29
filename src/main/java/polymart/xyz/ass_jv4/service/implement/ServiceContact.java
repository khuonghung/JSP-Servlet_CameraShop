package polymart.xyz.ass_jv4.service.implement;

import polymart.xyz.ass_jv4.dao.IDAOContact;
import polymart.xyz.ass_jv4.dao.implement.DAOContact;
import polymart.xyz.ass_jv4.entity.EntityContact;
import polymart.xyz.ass_jv4.service.IServiceContact;

import java.util.List;

public class ServiceContact implements IServiceContact {

    private IDAOContact _idaoContact = new DAOContact();

    @Override
    public List<EntityContact> findAll() {
        return _idaoContact.findAll();
    }

    @Override
    public EntityContact findById(String id) {
        return _idaoContact.findById(id);
    }

    @Override
    public boolean updateContact(EntityContact entityContact) {
        return _idaoContact.updateContact(entityContact);
    }

    @Override
    public boolean newContact(EntityContact entityContact) {
        return _idaoContact.newContact(entityContact);
    }
}
