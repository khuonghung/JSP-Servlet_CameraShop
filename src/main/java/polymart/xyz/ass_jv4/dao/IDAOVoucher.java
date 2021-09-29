package polymart.xyz.ass_jv4.dao;

import polymart.xyz.ass_jv4.entity.EntityVoucher;

import java.util.List;

public interface IDAOVoucher extends GenericDAO<EntityVoucher> {

    List<EntityVoucher> findAll();

    EntityVoucher findById(String id);

    boolean newVoucher(EntityVoucher entityVoucher);

    boolean updateVoucher(EntityVoucher entityVoucher);

}
