package polymart.xyz.ass_jv4.service;

import polymart.xyz.ass_jv4.entity.EntityPayment;
import polymart.xyz.ass_jv4.entity.EntityVisit;

import java.util.List;

public interface IServicePayment {

    List<EntityPayment> findAll();

    boolean newPayment(EntityPayment payment);

    EntityPayment findIdPayment(EntityVisit phoneNumberVisit, String paymentAmount);

    EntityPayment findById(String id);

    boolean updatePayment(EntityPayment payment);

}
