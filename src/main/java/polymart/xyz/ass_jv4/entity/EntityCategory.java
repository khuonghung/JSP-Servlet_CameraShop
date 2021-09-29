package polymart.xyz.ass_jv4.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "category")
@NamedQueries({
        @NamedQuery(name = "findAllCategory",
                query = "SELECT o FROM EntityCategory o WHERE o.removed = false"),
        @NamedQuery(name = "findByNameCategory",
                query = "SELECT o FROM EntityCategory o WHERE o.name = ?1 AND o.removed = false")
})
public class EntityCategory {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "name")
    private String name;
    @Column(name = "describes")
    private String description;
    @Column(name = "remove")
    private boolean removed;
    @OneToMany(mappedBy = "entityCategory")
    private List<EntityProduct> lstEntityProducts;

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

    public List<EntityProduct> getLstEntityProducts() {
        return lstEntityProducts;
    }

    public void setLstEntityProducts(List<EntityProduct> lstEntityProducts) {
        this.lstEntityProducts = lstEntityProducts;
    }
}
