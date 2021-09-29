package polymart.xyz.ass_jv4.service.implement;

import polymart.xyz.ass_jv4.dao.IDAOPayment;
import polymart.xyz.ass_jv4.dao.implement.DAOPayment;
import polymart.xyz.ass_jv4.entity.EntityPayment;
import polymart.xyz.ass_jv4.entity.EntityVisit;
import polymart.xyz.ass_jv4.entity.EntityVoucher;
import polymart.xyz.ass_jv4.service.IServicePayment;

import java.util.List;

public class ServicePayment implements IServicePayment {

    private IDAOPayment _idaoPayment = new DAOPayment();

    @Override
    public List<EntityPayment> findAll() {
        return _idaoPayment.findAll();
    }

    @Override
    public boolean newPayment(EntityPayment payment) {
        return _idaoPayment.newPayment(payment);
    }

    @Override
    public EntityPayment findIdPayment(EntityVisit phoneNumberVisit, String paymentAmount) {
        return _idaoPayment.findIdPayment(phoneNumberVisit, paymentAmount);
    }

    @Override
    public EntityPayment findById(String id) {
        return _idaoPayment.findById(id);
    }

    @Override
    public boolean updatePayment(EntityPayment payment) {
        return _idaoPayment.updatePayment(payment);
    }
}
