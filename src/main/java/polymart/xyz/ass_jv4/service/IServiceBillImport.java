package polymart.xyz.ass_jv4.service;

import polymart.xyz.ass_jv4.entity.EntityBillImport;

import java.util.List;

public interface IServiceBillImport {

    List<EntityBillImport> findAll();

    EntityBillImport findById(String id);

    boolean newBillImport(EntityBillImport entityBillImport);

}
