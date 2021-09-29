package polymart.xyz.ass_jv4.service.implement;

import polymart.xyz.ass_jv4.dao.IDAOBillImport;
import polymart.xyz.ass_jv4.dao.IDAOBillImportDetails;
import polymart.xyz.ass_jv4.dao.implement.DAOBillImport;
import polymart.xyz.ass_jv4.dao.implement.DAOBillImportDetails;
import polymart.xyz.ass_jv4.entity.EntityBillImport;
import polymart.xyz.ass_jv4.entity.EntityBillImportDetails;
import polymart.xyz.ass_jv4.service.IServiceBillImport;

import java.util.ArrayList;
import java.util.List;

import static com.mysql.cj.conf.PropertyKey.logger;

public class ServiceBillImprt implements IServiceBillImport {

    private IDAOBillImport _idaoBillImport = new DAOBillImport();
    private IDAOBillImportDetails _idaoBillImportDetails = new DAOBillImportDetails();

    @Override

    public List<EntityBillImport> findAll() {
        return _idaoBillImport.findAll();
    }

    @Override
    public EntityBillImport findById(String id) {
        return _idaoBillImport.findById(id);
    }

    @Override
    public boolean newBillImport(EntityBillImport entityBillImport) {
        if (_idaoBillImport.newBillImport(entityBillImport)) {
            EntityBillImport billImport = _idaoBillImport.findByAll(entityBillImport);
            if (billImport != null) {
                System.out.println(entityBillImport.getLstBillimportDetails());
                for (EntityBillImportDetails x : entityBillImport.getLstBillimportDetails()) {
                    x.setEntityBillImport(billImport);
                    System.out.println(x);
                    _idaoBillImportDetails.newBillImportDetails(x);
                }
                return true;
            }
        }
        return false;
    }
}
