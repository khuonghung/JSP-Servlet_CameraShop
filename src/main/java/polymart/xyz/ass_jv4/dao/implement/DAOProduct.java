package polymart.xyz.ass_jv4.dao.implement;

import polymart.xyz.ass_jv4.dao.IDAOProduct;
import polymart.xyz.ass_jv4.entity.EntityProduct;
import polymart.xyz.ass_jv4.utils.ContaiUtils;

import javax.persistence.TypedQuery;
import java.util.Collections;
import java.util.List;

public class DAOProduct extends AbstractDAO<EntityProduct> implements IDAOProduct {

    private EntityProduct _entityProduct;

    @Override
    public List<EntityProduct> findAll() {
        TypedQuery<EntityProduct> query = em.createNamedQuery("findAllProduct", EntityProduct.class);
        return query.getResultList();
    }

    @Override
    public List<EntityProduct> findNewProduct() {
        TypedQuery<EntityProduct> query = em.createNamedQuery("newProduct", EntityProduct.class);
        query.setMaxResults(12);
        return query.getResultList();
    }

    @Override
    public List<EntityProduct> findHotSaleProduct() {
        TypedQuery<EntityProduct> query = em.createNamedQuery("hotSaleProduct", EntityProduct.class);
        query.setMaxResults(12);
        return query.getResultList();
    }

    @Override
    public List<EntityProduct> findMostViewedProduct() {
        TypedQuery<EntityProduct> query = em.createNamedQuery("mostViewedProduct", EntityProduct.class);
        query.setMaxResults(12);
        return query.getResultList();
    }

    @Override
    public List<EntityProduct> findByTopBuy() {
        TypedQuery<EntityProduct> query = em.createNamedQuery("findByTopBuyProduct", EntityProduct.class);
        query.setMaxResults(12);
        return query.getResultList();
    }

    @Override
    public List<EntityProduct> findNewImportProduct() {
        TypedQuery<EntityProduct> query = em.createNamedQuery("findByNewImportProduct", EntityProduct.class);
//        List<EntityProduct> lst = query.getResultList();
//        Collections.reverse(lst);
        return query.getResultList();
    }

    @Override
    public List<EntityProduct> findHotProduct() {
        TypedQuery<EntityProduct> query = em.createNamedQuery("findByHotProduct", EntityProduct.class);
        query.setMaxResults(12);
        return query.getResultList();
    }

    @Override
    public List<EntityProduct> findRandomProduct() {
        return null;
    }

    @Override
    public List<EntityProduct> findByIdCategory(String idCategory) {
        TypedQuery<EntityProduct> query = em.createNamedQuery("findByIdCategory", EntityProduct.class);
        try {
            query = query(query, Integer.parseInt(idCategory));
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<EntityProduct> findByIdBrand(String idBrand) {
        TypedQuery<EntityProduct> query = em.createNamedQuery("findByIdBrand", EntityProduct.class);
        try {
            query = query(query, Integer.parseInt(idBrand));
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<EntityProduct> findByMinAndMax(String min, String max) {
        TypedQuery<EntityProduct> query = em.createNamedQuery("findByMinMaxProduct", EntityProduct.class);
        try {
            query = query(query, Long.parseLong(min), Long.parseLong(max));
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public EntityProduct findById(String id) {
        try {
            EntityProduct entityProduct = em.find(EntityProduct.class, Integer.parseInt(id));
            if (entityProduct != null && !entityProduct.isRemoved()) {
                return entityProduct;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean updateProduct(EntityProduct product) {
        _entityProduct = findById(product.getId() + "");
        if (_entityProduct != null) {
            return update(product, ContaiUtils.UPDATE);
        }
        return false;
    }

    @Override
    public boolean newProduct(EntityProduct product) {
        _entityProduct = findById(product.getId() + "");
        if (_entityProduct == null) {
            return update(product, ContaiUtils.INSERT);
        }
        return false;
    }

    @Override
    public EntityProduct findByAllAttributes(String name, String idCategory, String idBrand, String idStaff) {
        TypedQuery<EntityProduct> query = em.createNamedQuery("findAllProductByAllAttribute", EntityProduct.class);
        try {
            query = query(query, name, Integer.parseInt(idCategory), Integer.parseInt(idBrand), Integer.parseInt(idStaff));
            if (query.getResultList().size() > 0) {
                return query.getSingleResult();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


}
