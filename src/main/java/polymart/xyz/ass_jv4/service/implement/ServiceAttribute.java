package polymart.xyz.ass_jv4.service.implement;

import polymart.xyz.ass_jv4.dao.IDAOAttribute;
import polymart.xyz.ass_jv4.dao.implement.DAOAttribute;
import polymart.xyz.ass_jv4.entity.EntityAttribute;
import polymart.xyz.ass_jv4.service.IServiceAttribute;

import java.util.List;

public class ServiceAttribute implements IServiceAttribute {

    private IDAOAttribute _idaoAttribute = new DAOAttribute();

    @Override
    public List<EntityAttribute> findAll() {
        return _idaoAttribute.findAll();
    }

    @Override
    public EntityAttribute findById(String id) {
        return _idaoAttribute.findById(id);
    }

    @Override
    public boolean newAttribute(EntityAttribute entityAttribute) {
        return _idaoAttribute.newAttribute(entityAttribute);
    }

    @Override
    public boolean updateAttribute(EntityAttribute entityAttribute) {
        return _idaoAttribute.updateAttribute(entityAttribute);
    }
}
