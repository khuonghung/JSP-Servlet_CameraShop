package polymart.xyz.ass_jv4.dao;

import polymart.xyz.ass_jv4.entity.EntityPayment;
import polymart.xyz.ass_jv4.entity.EntityVisit;
import polymart.xyz.ass_jv4.entity.EntityVoucher;

import java.util.List;

public interface IDAOPayment extends GenericDAO<EntityPayment> {

    List<EntityPayment> findAll();

    boolean newPayment(EntityPayment payment);

    EntityPayment findIdPayment(EntityVisit phoneNumberVisit, String paymentAmount);

    EntityPayment findById(String id);

    boolean updatePayment(EntityPayment payment);

}
