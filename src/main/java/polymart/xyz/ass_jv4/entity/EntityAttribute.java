package polymart.xyz.ass_jv4.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "attribute")
@NamedQueries({
        @NamedQuery(name = "findAllAttribute",
                query = "SELECT o FROM EntityAttribute o WHERE o.removed = false"),
        @NamedQuery(name = "findByNameAndValue",
                query = "SELECT o FROM EntityAttribute o WHERE o.name =?1 AND o.value =?2 AND o.removed = false")
})
public class EntityAttribute {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "name")
    private String name;
    @Column(name = "value")
    private String value;
    @Column(name = "remove")
    private boolean removed;
    @OneToMany(mappedBy = "entityAttribute")
    private List<EntityProductDetails> lstProductDetails;

    @Override
    public String toString() {
        return "EntityAttribute{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", value='" + value + '\'' +
                ", removed=" + removed +
                '}';
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

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public boolean isRemoved() {
        return removed;
    }

    public void setRemoved(boolean removed) {
        this.removed = removed;
    }

    public List<EntityProductDetails> getLstProductDetails() {
        return lstProductDetails;
    }

    public void setLstProductDetails(List<EntityProductDetails> lstProductDetails) {
        this.lstProductDetails = lstProductDetails;
    }
}
