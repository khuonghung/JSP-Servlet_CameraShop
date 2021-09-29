package polymart.xyz.ass_jv4.entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;

@Entity
@Table(name = "contact")
@NamedQueries({
        @NamedQuery(name = "findAllContact",
                query = "SELECT o FROM EntityContact o ORDER BY o.id DESC")
})
public class EntityContact {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "email")
    private String email;

    @Column(name = "subject")
    private String subject;

    @Column(name = "body")
    private String body;

    @Column(name = "date_send")
    private Timestamp dateSend;

    @Column(name = "seen")
    private Boolean seen;

    @OneToMany(mappedBy = "entityContact")
    private List<EntityRepContact> lstEntityRepContacts;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public Timestamp getDateSend() {
        return dateSend;
    }

    public void setDateSend(Timestamp dateSend) {
        this.dateSend = dateSend;
    }

    public Boolean getSeen() {
        return seen;
    }

    public void setSeen(Boolean seen) {
        this.seen = seen;
    }

    public List<EntityRepContact> getLstEntityRepContacts() {
        return lstEntityRepContacts;
    }

    public void setLstEntityRepContacts(List<EntityRepContact> lstEntityRepContacts) {
        this.lstEntityRepContacts = lstEntityRepContacts;
    }

    @Override
    public String toString() {
        return "EntityContact{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", subject='" + subject + '\'' +
                ", body='" + body + '\'' +
                ", dateSend=" + dateSend +
                ", seen=" + seen +
                ", lstEntityRepContacts=" + lstEntityRepContacts +
                '}';
    }
}
