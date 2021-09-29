package polymart.xyz.ass_jv4.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "payment", uniqueConstraints = {
        @UniqueConstraint(columnNames = {"idstaffsale", "idstaffcashier", "phonenumbervisit", "idvoucher"})
})
@NamedQueries({
        @NamedQuery(name = "findIdPayment",
                query = "SELECT o FROM EntityPayment o WHERE o.entityVisit = ?1 " +
                        "AND o.paymentAmount = ?2 ORDER BY o.id DESC"),
        @NamedQuery(name = "findAllPyament",
                query = "SELECT o FROM EntityPayment o")
})
public class EntityPayment {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne
    @JoinColumn(name = "idstaffsale")
    private EntityStaff entityStaffSale;
    @ManyToOne
    @JoinColumn(name = "idstaffcashier")
    private EntityStaff entityStaffCashier;
    @ManyToOne
    @JoinColumn(name = "phonenumbervisit")
    private EntityVisit entityVisit;
    @ManyToOne
    @JoinColumn(name = "idvoucher")
    private EntityVoucher entityVoucher;
    @Column(name = "payments")
    private String payments; // hình thức thanh toán
    @Column(name = "paymentamout")
    private Long paymentAmount;
    @Column(name = "statuspayment")
    private boolean statusPayment; //  trạng thái thanh toán
    @Column(name = "statusbill")
    private boolean statusBilling; // trạng thái hoá đơn huỷ hay chưa
    @OneToMany(mappedBy = "entityPayment")
    private List<EntityPaymentDetails> lstEntityPaymentDetails;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public EntityStaff getEntityStaffSale() {
        return entityStaffSale;
    }

    public void setEntityStaffSale(EntityStaff entityStaffSale) {
        this.entityStaffSale = entityStaffSale;
    }

    public EntityStaff getEntityStaffCashier() {
        return entityStaffCashier;
    }

    public void setEntityStaffCashier(EntityStaff entityStaffCashier) {
        this.entityStaffCashier = entityStaffCashier;
    }

    public EntityVisit getEntityVisit() {
        return entityVisit;
    }

    public void setEntityVisit(EntityVisit entityVisit) {
        this.entityVisit = entityVisit;
    }

    public EntityVoucher getEntityVoucher() {
        return entityVoucher;
    }

    public void setEntityVoucher(EntityVoucher entityVoucher) {
        this.entityVoucher = entityVoucher;
    }

    public String getPayments() {
        return payments;
    }

    public void setPayments(String payments) {
        this.payments = payments;
    }

    public Long getPaymentAmount() {
        return paymentAmount;
    }

    public void setPaymentAmount(Long paymentAmount) {
        this.paymentAmount = paymentAmount;
    }

    public boolean isStatusPayment() {
        return statusPayment;
    }

    public void setStatusPayment(boolean statusPayment) {
        this.statusPayment = statusPayment;
    }

    public boolean isStatusBilling() {
        return statusBilling;
    }

    public void setStatusBilling(boolean statusBilling) {
        this.statusBilling = statusBilling;
    }

    public List<EntityPaymentDetails> getLstEntityPaymentDetails() {
        return lstEntityPaymentDetails;
    }

    public void setLstEntityPaymentDetails(List<EntityPaymentDetails> lstEntityPaymentDetails) {
        this.lstEntityPaymentDetails = lstEntityPaymentDetails;
    }
}
