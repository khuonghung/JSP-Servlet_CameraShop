package polymart.xyz.ass_jv4.entity;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "voucher", uniqueConstraints = {
        @UniqueConstraint(columnNames = {"idstaffcreate"})
})
@NamedQueries({
        @NamedQuery(name = "findAllVoucher",
                query = "SELECT o FROM EntityVoucher o WHERE o.removed = false AND o.reQuantity > 0")
})
public class EntityVoucher {

    @Id
    @Column(name = "id")
    private String id;
    @Column(name = "event")
    private String event;
    @ManyToOne
    @JoinColumn(name = "idstaffcreate")
    private EntityStaff entityStaff;
    @Column(name = "datecreate")
    private Date dateCreated;
    @Column(name = "pricesale")
    private Long priceSale;
    @Column(name = "quantity")
    private int quantity;
    @Column(name = "requantity")
    private int reQuantity;
    @Column(name = "datestart")
    private Date dateStart;
    @Column(name = "dateend")
    private Date dateEnd;
    @Column(name = "describes")
    private String description;
    @Column(name = "remove")
    private boolean removed;
    @OneToMany(mappedBy = "entityVoucher")
    private List<EntityPayment> lstEntityPayments;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEvent() {
        return event;
    }

    public void setEvent(String event) {
        this.event = event;
    }

    public EntityStaff getEntityStaff() {
        return entityStaff;
    }

    public void setEntityStaff(EntityStaff entityStaff) {
        this.entityStaff = entityStaff;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public Long getPriceSale() {
        return priceSale;
    }

    public void setPriceSale(Long priceSale) {
        this.priceSale = priceSale;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getReQuantity() {
        return reQuantity;
    }

    public void setReQuantity(int reQuantity) {
        this.reQuantity = reQuantity;
    }

    public Date getDateStart() {
        return dateStart;
    }

    public void setDateStart(Date dateStart) {
        this.dateStart = dateStart;
    }

    public Date getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(Date dateEnd) {
        this.dateEnd = dateEnd;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isRemoved() {
        return removed;
    }

    public void setRemoved(boolean removed) {
        this.removed = removed;
    }

    public List<EntityPayment> getLstEntityPayments() {
        return lstEntityPayments;
    }

    public void setLstEntityPayments(List<EntityPayment> lstEntityPayments) {
        this.lstEntityPayments = lstEntityPayments;
    }

    @Override
    public String toString() {
        return "EntityVoucher{" +
                "id='" + id + '\'' +
                ", event='" + event + '\'' +
                ", entityStaff=" + entityStaff +
                ", dateCreated=" + dateCreated +
                ", priceSale=" + priceSale +
                ", quantity=" + quantity +
                ", reQuantity=" + reQuantity +
                ", dateStart=" + dateStart +
                ", dateEnd=" + dateEnd +
                ", description='" + description + '\'' +
                ", removed=" + removed +
                ", lstEntityPayments=" + lstEntityPayments +
                '}';
    }
}
