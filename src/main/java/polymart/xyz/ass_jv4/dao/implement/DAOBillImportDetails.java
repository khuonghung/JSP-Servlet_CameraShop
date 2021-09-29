package polymart.xyz.ass_jv4.dao.implement;

import polymart.xyz.ass_jv4.dao.IDAOBillImportDetails;
import polymart.xyz.ass_jv4.entity.EntityBillImportDetails;
import polymart.xyz.ass_jv4.utils.ContaiUtils;

public class DAOBillImportDetails extends AbstractDAO<EntityBillImportDetails> implements IDAOBillImportDetails {
    @Override
    public void newBillImportDetails(EntityBillImportDetails entityBillImportDetails) {
        update(entityBillImportDetails, ContaiUtils.INSERT);
    }

    @Override
    public EntityBillImportDetails findById(String id) {
        try {
            return em.find(EntityBillImportDetails.class, Integer.parseInt(id));
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}
