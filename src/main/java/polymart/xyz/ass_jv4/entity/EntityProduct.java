package polymart.xyz.ass_jv4.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "product", uniqueConstraints = {
        @UniqueConstraint(columnNames = {"idcategory", "idbrand", "idstaffadd"})
})
@NamedQueries({
        @NamedQuery(name = "findAllProduct",
                query = "SELECT o FROM EntityProduct o WHERE o.removed = false"),
        @NamedQuery(name = "findAllProductByAllAttribute",
                query = "SELECT o FROM EntityProduct o WHERE o.name = ?1 AND o.entityCategory.id = ?2 AND o.entityBrand.id = ?3" +
                        "AND o.entityStaff.id = ?4 AND o.removed = false"),
        @NamedQuery(name = "newProduct",
                query = "SELECT o FROM EntityProduct o WHERE o.removed = false AND o.status = true ORDER BY o.id DESC"),
        @NamedQuery(name = "hotSaleProduct",
                query = "SELECT o FROM EntityProduct o WHERE o.removed = false AND o.status = true AND o.persenSale > 0 ORDER BY o.persenSale DESC"),
        @NamedQuery(name = "mostViewedProduct",
                query = "SELECT o FROM EntityProduct as o WHERE o.removed = false AND o.status = true AND o.view > 0 ORDER BY o.view DESC"),
        @NamedQuery(name = "findByIdCategory",
                query = "SELECT o FROM EntityProduct as o WHERE o.removed = false AND o.status = true AND o.entityCategory.id = ?1 ORDER BY o.id DESC"),
        @NamedQuery(name = "findByIdBrand",
                query = "SELECT o FROM EntityProduct as o WHERE o.removed = false AND o.status = true AND o.entityBrand.id = ?1 ORDER BY o.id DESC"),
//        @NamedQuery(name = "findByMinMaxProduct",
//                query = "SELECT DISTINCT o FROM EntityProduct as o WHERE o.removed = false AND o.status = true AND o.id = " +
//                        "(SELECT x.entityProduct.id FROM EntityProductDetails x WHERE x.price >= ?1 AND x.price <= ?2)" +
//                        " ORDER BY o.id DESC"),
        @NamedQuery(name = "findByMinMaxProduct",
                query = "SELECT DISTINCT product FROM EntityProduct as product, EntityProductDetails pdetails " +
                        "WHERE product.removed = false AND product.status = true AND product.id = pdetails.entityProduct.id " +
                        "AND pdetails.price >= ?1 AND pdetails.price <= ?2 ORDER BY product.id DESC"),
//        @NamedQuery(name = "findByTopBuyProduct",
//                query = "SELECT DISTINCT o FROM EntityProduct as o WHERE o.removed = false AND o.status = true AND o.id = " +
//                        "(SELECT x.entityProduct.id FROM EntityProductDetails x WHERE x.id = " +
//                        "(SELECT e.entityProductDetails.id FROM EntityPaymentDetails e GROUP BY e.entityProductDetails.id HAVING COUNT(e) = " +
//                        "(SELECT COUNT(t) FROM EntityPaymentDetails t)" +
//                        ")" +
//                        ")"
//        ),
        @NamedQuery(name = "findByTopBuyProduct",
                query = "SELECT DISTINCT product FROM EntityProduct product, EntityProductDetails prodetails, " +
                        "EntityPaymentDetails paydetails WHERE product.removed = false AND product.status = true " +
                        "AND product.id = prodetails.entityProduct.id AND prodetails.id = paydetails.entityProductDetails.id " +
                        "GROUP By product " +
                        "ORDER BY COUNT(paydetails.entityProductDetails.id) DESC"
        ),
//        @NamedQuery(name = "findByHotProduct",
//                query = "SELECT DISTINCT o FROM EntityProduct as o GROUP BY o HAVING o.removed = false AND o.status = true AND o.view > 0 AND o.persenSale > 0 ORDER BY o.view DESC, o.persenSale DESC"
//        ),
        @NamedQuery(name = "findByHotProduct",
                query = "SELECT DISTINCT product FROM EntityProduct product, EntityLike lai " +
                        "WHERE product.removed = false AND product.status = true AND product.id = lai.entityProduct.id " +
                        "AND product.view > 0 AND product.persenSale > 0 " +
                        "GROUP BY product HAVING COUNT(lai.entityProduct.id) > 0 " +
                        "ORDER BY product.view DESC, product.persenSale DESC, COUNT(lai.entityProduct.id) DESC "
        ),
        @NamedQuery(name = "findByNewImportProduct",
                query = "SELECT DISTINCT product FROM EntityProduct product, EntityProductDetails pdetails, " +
                        "EntityBillImportDetails idetails " +
                        "WHERE product.removed = false AND product.status = true AND " +
                        "product.id = pdetails.entityProduct.id AND pdetails.id = idetails.entityProductDetails.id " +
                        "ORDER BY idetails.id DESC"
        ),
})
public class EntityProduct {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "name")
    private String name;
    @ManyToOne
    @JoinColumn(name = "idcategory")
    private EntityCategory entityCategory;
    @ManyToOne
    @JoinColumn(name = "idbrand")
    private EntityBrand entityBrand;
    @ManyToOne
    @JoinColumn(name = "idstaffadd")
    private EntityStaff entityStaff;
    @Column(name = "describes")
    private String description;
    @Column(name = "views")
    private int view;
    @Column(name = "status")
    private boolean status; // trạng thái kinh doanh
    @Column(name = "remove")
    private boolean removed;
    @Column(name = "persensale")
    private int persenSale;
    // phần trăm giảm cho toàn bộ thuộc 1 sản phẩm
    @OneToMany(mappedBy = "entityProduct")
    private List<EntityProductDetails> lstEntityProductDetails;

    @OneToMany(mappedBy = "entityProduct")
    private List<EntityProductImage> lstEntityProductImages;

    @OneToMany(mappedBy = "entityProduct")
    private List<EntityLike> lstEntityLikes;

    @Override
    public String toString() {
        return "EntityProduct{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", entityCategory=" + entityCategory +
                ", entityBrand=" + entityBrand +
                ", entityStaff=" + entityStaff +
                ", description='" + description + '\'' +
                ", view=" + view +
                ", status=" + status +
                ", removed=" + removed +
                ", persenSale=" + persenSale +
                '}';
    }

    public List<EntityLike> getLstEntityLikes() {
        return lstEntityLikes;
    }

    public void setLstEntityLikes(List<EntityLike> lstEntityLikes) {
        this.lstEntityLikes = lstEntityLikes;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public EntityCategory getEntityCategory() {
        return entityCategory;
    }

    public void setEntityCategory(EntityCategory entityCategory) {
        this.entityCategory = entityCategory;
    }

    public EntityBrand getEntityBrand() {
        return entityBrand;
    }

    public void setEntityBrand(EntityBrand entityBrand) {
        this.entityBrand = entityBrand;
    }

    public EntityStaff getEntityStaff() {
        return entityStaff;
    }

    public void setEntityStaff(EntityStaff entityStaff) {
        this.entityStaff = entityStaff;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getView() {
        return view;
    }

    public void setView(int view) {
        this.view = view;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public boolean isRemoved() {
        return removed;
    }

    public void setRemoved(boolean removed) {
        this.removed = removed;
    }

    public int getPersenSale() {
        return persenSale;
    }

    public void setPersenSale(int persenSale) {
        this.persenSale = persenSale;
    }

    public List<EntityProductDetails> getLstEntityProductDetails() {
        return lstEntityProductDetails;
    }

    public void setLstEntityProductDetails(List<EntityProductDetails> lstEntityProductDetails) {
        this.lstEntityProductDetails = lstEntityProductDetails;
    }

    public List<EntityProductImage> getLstEntityProductImages() {
        return lstEntityProductImages;
    }

    public void setLstEntityProductImages(List<EntityProductImage> lstEntityProductImages) {
        this.lstEntityProductImages = lstEntityProductImages;
    }
}
