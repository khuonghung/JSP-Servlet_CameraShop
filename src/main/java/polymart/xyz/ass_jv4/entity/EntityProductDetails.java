package polymart.xyz.ass_jv4.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "productdetails", uniqueConstraints = {
        @UniqueConstraint(columnNames = {"idproduct", "idattribute"})
})
@NamedQueries({
        @NamedQuery(name = "findByAll",
                query = "SELECT o FROM EntityProductDetails o WHERE o.entityProduct = ?1 " +
                        "AND o.entityAttribute = ?2 AND o.price = ?3"),
        @NamedQuery(name = "findAll",
                query = "SELECT o FROM EntityProductDetails o")
})
public class EntityProductDetails {

    @Id
    @Column(name = "id") // cái này phải có khoá ngoại là product đúng k
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne
    @JoinColumn(name = "idproduct")
    private EntityProduct entityProduct;
    @ManyToOne
    @JoinColumn(name = "idattribute")
    private EntityAttribute entityAttribute;
    @Column(name = "price")
    private Long price;
    @Column(name = "location")
    private String location;
    @Column(name = "quantity")
    private int quantity;
    @OneToMany(mappedBy = "entityProductDetails")
    private List<EntityBillImportDetails> lstEntityBillImportDetails;
    @OneToMany(mappedBy = "entityProductDetails")
    private List<EntityPaymentDetails> lstEntityPaymentDetails;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public EntityProduct getEntityProduct() {
        return entityProduct;
    }

    public void setEntityProduct(EntityProduct entityProduct) {
        this.entityProduct = entityProduct;
    }

    public EntityAttribute getEntityAttribute() {
        return entityAttribute;
    }

    public void setEntityAttribute(EntityAttribute entityAttribute) {
        this.entityAttribute = entityAttribute;
    }

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public List<EntityBillImportDetails> getLstEntityBillImportDetails() {
        return lstEntityBillImportDetails;
    }

    public void setLstEntityBillImportDetails(List<EntityBillImportDetails> lstEntityBillImportDetails) {
        this.lstEntityBillImportDetails = lstEntityBillImportDetails;
    }

    public List<EntityPaymentDetails> getLstEntityPaymentDetails() {
        return lstEntityPaymentDetails;
    }

    public void setLstEntityPaymentDetails(List<EntityPaymentDetails> lstEntityPaymentDetails) {
        this.lstEntityPaymentDetails = lstEntityPaymentDetails;
    }
}
