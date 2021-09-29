package polymart.xyz.ass_jv4.entity;

import javax.persistence.*;

@Entity
@Table(name = "productimage", uniqueConstraints = {
        @UniqueConstraint(columnNames = {"idproduct"})
})
@NamedQueries({
        @NamedQuery(name = "findByIDProductAndImage",
                query = "SELECT o FROM EntityProductImage o WHERE o.entityProduct.id = ?1 AND o.image = ?2"),
        @NamedQuery(name = "findByIdProduct",
                query = "SELECT o FROM EntityProductImage o WHERE o.entityProduct.id = ?1")
})
public class EntityProductImage {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne
    @JoinColumn(name = "idproduct")
    private EntityProduct entityProduct;
    @Column(name = "image")
    private String image;

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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
