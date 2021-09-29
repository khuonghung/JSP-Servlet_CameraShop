package polymart.xyz.ass_jv4.entity;

import javax.persistence.*;

@Entity
@Table(name = "likes", uniqueConstraints = {
        @UniqueConstraint(columnNames = {"phonenumber", "idproduct"})
})
@NamedQueries({
        @NamedQuery(name = "findAllLike",
                query = "SELECT o FROM EntityLike o"),
        @NamedQuery(name = "findByVisitAndProductLike",
                query = "SELECT o FROM EntityLike o WHERE o.entityVisit = ?1 AND o.entityProduct = ?2")
})
public class EntityLike {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne
    @JoinColumn(name = "phoneNumber")
    private EntityVisit entityVisit;
    @ManyToOne
    @JoinColumn(name = "idProduct")
    private EntityProduct entityProduct;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public EntityVisit getEntityVisit() {
        return entityVisit;
    }

    public void setEntityVisit(EntityVisit entityVisit) {
        this.entityVisit = entityVisit;
    }

    public EntityProduct getEntityProduct() {
        return entityProduct;
    }

    public void setEntityProduct(EntityProduct entityProduct) {
        this.entityProduct = entityProduct;
    }
}
