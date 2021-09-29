package polymart.xyz.ass_jv4.service.implement;

import polymart.xyz.ass_jv4.dao.IDAOPaymentDetails;
import polymart.xyz.ass_jv4.dao.implement.DAOPaymentDetails;
import polymart.xyz.ass_jv4.entity.EntityPaymentDetails;
import polymart.xyz.ass_jv4.service.IServicePaymentDetails;

public class ServicePaymentDetails implements IServicePaymentDetails {

    private IDAOPaymentDetails _idaoPaymentDetails = new DAOPaymentDetails();

    @Override
    public boolean newPaymentDetails(EntityPaymentDetails entityPaymentDetails) {
        return _idaoPaymentDetails.newPaymentDetails(entityPaymentDetails);
    }
}
