package polymart.xyz.ass_jv4.entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;

@Entity
@Table(name = "banner", uniqueConstraints = {
        @UniqueConstraint(columnNames = {"idstaffcreate"})
})
@NamedQueries({
        @NamedQuery(name = "findAllBanner",
                query = "SELECT o FROM EntityBanner o WHERE o.removed = false"),
        @NamedQuery(name = "findShowBanner",
                query = "SELECT o FROM EntityBanner o WHERE o.dateCreated < ?1 AND o.removed = false " +
                        "ORDER BY o.id DESC")
})
public class EntityBanner {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "name")
    private String name;
    @Column(name = "describes")
    private String description;
    @Column(name = "event")
    private String event;
    @Column(name = "image")
    private String image;
    @ManyToOne
    @JoinColumn(name = "idstaffcreate")
    private EntityStaff entityStaff;
    @Column(name = "datecreate")
    private Date dateCreated;
    @Column(name = "dateend")
    private Date dateEnded;
    @Column(name = "link")
    private String link;
    @Column(name = "remove")
    private boolean removed;

    @Override
    public String toString() {
        return "EntityBanner{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", event='" + event + '\'' +
                ", image='" + image + '\'' +
                ", entityStaff=" + entityStaff +
                ", dateCreated=" + dateCreated +
                ", dateEnded=" + dateEnded +
                ", link='" + link + '\'' +
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getEvent() {
        return event;
    }

    public void setEvent(String event) {
        this.event = event;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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

    public Date getDateEnded() {
        return dateEnded;
    }

    public void setDateEnded(Date dateEnded) {
        this.dateEnded = dateEnded;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public boolean isRemoved() {
        return removed;
    }

    public void setRemoved(boolean removed) {
        this.removed = removed;
    }
}
