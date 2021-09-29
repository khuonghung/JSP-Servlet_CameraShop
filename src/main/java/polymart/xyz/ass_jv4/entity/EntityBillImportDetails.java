package polymart.xyz.ass_jv4.entity;

import javax.persistence.*;

@Entity
@Table(name = "billimportdetails", uniqueConstraints = {
        @UniqueConstraint(columnNames = {"idbillimport", "idproductdetail"})
})
public class EntityBillImportDetails {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne
    @JoinColumn(name = "idbillimport")
    private EntityBillImport entityBillImport;
    @ManyToOne
    @JoinColumn(name = "idproductdetail")
    private EntityProductDetails entityProductDetails;
    @Column(name = "quantity")
    private int quantity;
    @Column(name = "price")
    private Long price;

    @Override
    public String toString() {
        return "EntityBillImportDetails{" +
                "id=" + id +
                ", entityBillImport=" + entityBillImport +
                ", entityProductDetails=" + entityProductDetails +
                ", quantity=" + quantity +
                ", price=" + price +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public EntityBillImport getEntityBillImport() {
        return entityBillImport;
    }

    public void setEntityBillImport(EntityBillImport entityBillImport) {
        this.entityBillImport = entityBillImport;
    }

    public EntityProductDetails getEntityProductDetails() {
        return entityProductDetails;
    }

    public void setEntityProductDetails(EntityProductDetails entityProductDetails) {
        this.entityProductDetails = entityProductDetails;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }
}
