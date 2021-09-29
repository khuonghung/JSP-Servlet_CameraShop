package polymart.xyz.ass_jv4.entity;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "repcontact", uniqueConstraints = {
        @UniqueConstraint(columnNames = {"idcontact", "idstaff"})})
@NamedQueries({
        @NamedQuery(name = "findAllRepContact",
        query = "SELECT o FROM EntityRepContact o ORDER BY o.id DESC")
})
public class EntityRepContact {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "idcontact")
    private EntityContact entityContact;

    @ManyToOne
    @JoinColumn(name = "idstaff")
    private EntityStaff entityStaff;

    @Column(name = "date_rep")
    private Timestamp dateRep;

    @Column(name = "email")
    private String email;

    @Column(name = "subject")
    private String subject;

    @Column(name = "body")
    private String body;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public EntityContact getEntityContact() {
        return entityContact;
    }

    public void setEntityContact(EntityContact entityContact) {
        this.entityContact = entityContact;
    }

    public EntityStaff getEntityStaff() {
        return entityStaff;
    }

    public void setEntityStaff(EntityStaff entityStaff) {
        this.entityStaff = entityStaff;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Timestamp getDateRep() {
        return dateRep;
    }

    public void setDateRep(Timestamp dateRep) {
        this.dateRep = dateRep;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }
}
