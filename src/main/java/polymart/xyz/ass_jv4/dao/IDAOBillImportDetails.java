package polymart.xyz.ass_jv4.dao;

import polymart.xyz.ass_jv4.entity.EntityBillImportDetails;

public interface IDAOBillImportDetails extends GenericDAO<EntityBillImportDetails> {

    void newBillImportDetails(EntityBillImportDetails entityBillImportDetails);

    EntityBillImportDetails findById(String id);

}
