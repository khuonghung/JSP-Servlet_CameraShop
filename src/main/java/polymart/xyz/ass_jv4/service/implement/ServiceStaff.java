package polymart.xyz.ass_jv4.service.implement;

import polymart.xyz.ass_jv4.dao.IDAOStaff;
import polymart.xyz.ass_jv4.dao.implement.DAOStaff;
import polymart.xyz.ass_jv4.entity.EntityStaff;
import polymart.xyz.ass_jv4.service.IServiceStaff;

import java.util.List;

public class ServiceStaff implements IServiceStaff {

    private static IDAOStaff _idaoStaff = new DAOStaff();

    @Override
    public List<EntityStaff> findAll() {
        return _idaoStaff.findAll();
    }

    @Override
    public EntityStaff fingByEmail(String email) {
        return _idaoStaff.findByEmail(email);
    }

    @Override
    public boolean updateStaff(EntityStaff modelStaff) {
        return _idaoStaff.updateStaff(modelStaff);
    }

    @Override
    public boolean editStaff(EntityStaff modelStaff, String emailOld) {
        return _idaoStaff.editStaff(modelStaff, emailOld);
    }

    @Override
    public boolean changePassword(String email, String password, String newPassword) {
        EntityStaff entityStaff = _idaoStaff.findByEmail(email);
        if (entityStaff != null && entityStaff.getPassword().equals(password)) {
            entityStaff.setPassword(newPassword);
            return _idaoStaff.updateStaff(entityStaff);
        }
        return false;
    }
}
