package polymart.xyz.ass_jv4.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "brand")
@NamedQueries({
        @NamedQuery(name = "findAllBrand",
                query = "SELECT o FROM EntityBrand o WHERE o.removed = false"),
        @NamedQuery(name = "findByNameBrand",
                query = "SELECT o FROM EntityBrand o WHERE o.name = ?1 AND o.removed = false"),
        @NamedQuery(name = "findCheckByEmailPhoneNumber",
                query = "SELECT o FROM EntityBrand o WHERE o.email = ?1 AND o.phoneNumber = ?2 AND o.removed = false")
})
public class EntityBrand {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "name")
    private String name;
    @Column(name = "address")
    private String address;
    @Column(name = "phonenumber")
    private String phoneNumber;
    @Column(name = "email")
    private String email;
    @Column(name = "describes")
    private String description;
    @Column(name = "remove")
    private boolean removed;
    @OneToMany(mappedBy = "entityBrand")
    private List<EntityProduct> lstProducts;

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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public List<EntityProduct> getLstProducts() {
        return lstProducts;
    }

    public void setLstProducts(List<EntityProduct> lstProducts) {
        this.lstProducts = lstProducts;
    }
}
