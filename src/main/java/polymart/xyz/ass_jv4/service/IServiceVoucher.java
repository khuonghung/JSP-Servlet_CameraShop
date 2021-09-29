package polymart.xyz.ass_jv4.service;

import polymart.xyz.ass_jv4.entity.EntityVoucher;

import java.util.List;

public interface IServiceVoucher {

    List<EntityVoucher> findAll();

    EntityVoucher findById(String id);

    EntityVoucher findByIdEdit(String id);

    boolean newVoucher(EntityVoucher entityVoucher);

    boolean updateVoucher(EntityVoucher entityVoucher);

}
