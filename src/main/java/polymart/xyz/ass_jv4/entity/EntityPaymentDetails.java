package polymart.xyz.ass_jv4.entity;

import javax.persistence.*;

@Entity
@Table(name = "paymentdetails", uniqueConstraints = {
        @UniqueConstraint(columnNames = {"idpayment", "idproductdetails"})
})
public class EntityPaymentDetails {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne
    @JoinColumn(name = "idpayment")
    private EntityPayment entityPayment;
    @ManyToOne
    @JoinColumn(name = "idproductdetails")
    private EntityProductDetails entityProductDetails;
    @Column(name = "quantity")
    private int quantity;
    @Column(name = "price")
    private Long price;
    @Column(name = "pricesale")
    private Long priceSale; // giá giảm cho từng sản phẩm

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public EntityPayment getEntityPayment() {
        return entityPayment;
    }

    public void setEntityPayment(EntityPayment entityPayment) {
        this.entityPayment = entityPayment;
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

    public Long getPriceSale() {
        return priceSale;
    }

    public void setPriceSale(Long priceSale) {
        this.priceSale = priceSale;
    }
}
