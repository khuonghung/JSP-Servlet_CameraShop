package polymart.xyz.ass_jv4.dao;

import polymart.xyz.ass_jv4.entity.EntityBillImport;

import java.util.List;

public interface IDAOBillImport extends GenericDAO<EntityBillImport> {

    List<EntityBillImport> findAll();

    EntityBillImport findById(String id);

    boolean newBillImport(EntityBillImport entityBillImport);

    EntityBillImport findByAll(EntityBillImport entityBillImport);

}
