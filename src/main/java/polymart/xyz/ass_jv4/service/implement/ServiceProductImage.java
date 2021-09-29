package polymart.xyz.ass_jv4.service.implement;

import polymart.xyz.ass_jv4.dao.IDAOProductImage;
import polymart.xyz.ass_jv4.dao.implement.DAOProductImage;
import polymart.xyz.ass_jv4.entity.EntityProductImage;
import polymart.xyz.ass_jv4.service.IServiceProductImage;

import java.util.List;

public class ServiceProductImage implements IServiceProductImage {

    private IDAOProductImage _idaoProductImage = new DAOProductImage();

    @Override
    public EntityProductImage findByIdProductAndImage(String idProduct, String image) {
        return _idaoProductImage.findByIdProductAndImage(idProduct, image);
    }

    @Override
    public List<EntityProductImage> findByIdProduct(String idProduct) {
        return _idaoProductImage.findByIdProduct(idProduct);
    }
}
