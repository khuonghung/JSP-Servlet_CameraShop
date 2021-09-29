package polymart.xyz.ass_jv4.dao.implement;

import polymart.xyz.ass_jv4.dao.IDAOPaymentDetails;
import polymart.xyz.ass_jv4.entity.EntityPaymentDetails;
import polymart.xyz.ass_jv4.utils.ContaiUtils;

public class DAOPaymentDetails extends AbstractDAO<EntityPaymentDetails> implements IDAOPaymentDetails {
    @Override
    public boolean newPaymentDetails(EntityPaymentDetails entityPaymentDetails) {
        return update(entityPaymentDetails, ContaiUtils.INSERT);
    }
}
