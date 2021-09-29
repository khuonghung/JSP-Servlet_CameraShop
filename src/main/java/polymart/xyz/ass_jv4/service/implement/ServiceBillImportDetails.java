package polymart.xyz.ass_jv4.service.implement;

import polymart.xyz.ass_jv4.dao.IDAOBillImportDetails;
import polymart.xyz.ass_jv4.dao.implement.DAOBillImportDetails;
import polymart.xyz.ass_jv4.entity.EntityBillImportDetails;
import polymart.xyz.ass_jv4.service.IServiceBillImportDetails;

public class ServiceBillImportDetails implements IServiceBillImportDetails {

    private IDAOBillImportDetails _idaoBillImportDetails = new DAOBillImportDetails();

    @Override
    public EntityBillImportDetails findById(String id) {
        return _idaoBillImportDetails.findById(id);
    }
}
