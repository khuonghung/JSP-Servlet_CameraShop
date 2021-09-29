package polymart.xyz.ass_jv4.dao;

import polymart.xyz.ass_jv4.entity.EntityPaymentDetails;

public interface IDAOPaymentDetails extends GenericDAO<EntityPaymentDetails> {

    boolean newPaymentDetails(EntityPaymentDetails entityPaymentDetails);

}
