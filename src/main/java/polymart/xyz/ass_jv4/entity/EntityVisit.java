package polymart.xyz.ass_jv4.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "visit")
@NamedQueries({
        @NamedQuery(name = "findAllVisit",
                query = "SELECT o FROM EntityVisit o"),
        @NamedQuery(name = "findByPhoneAndPasswordVisit",
                query = "SELECT o FROM EntityVisit o WHERE o.phoneNumber = ?1 AND o.password = ?2")
})
public class EntityVisit {

    @Id
    @Column(name = "phonenumber")
    private String phoneNumber;
    @Column(name = "name")
    private String fullName;
    @Column(name = "address")
    private String address;
    @Column(name = "email")
    private String email;
    @Column(name = "password")
    private String password;
    @Column(name = "note")
    private String note;
    @OneToMany(mappedBy = "entityVisit")
    private List<EntityPayment> lstEntityPayments;
    @OneToMany(mappedBy = "entityVisit")
    private List<EntityLike> lstEntityLikes;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<EntityLike> getLstEntityLikes() {
        return lstEntityLikes;
    }

    public void setLstEntityLikes(List<EntityLike> lstEntityLikes) {
        this.lstEntityLikes = lstEntityLikes;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public List<EntityPayment> getLstEntityPayments() {
        return lstEntityPayments;
    }

    public void setLstEntityPayments(List<EntityPayment> lstEntityPayments) {
        this.lstEntityPayments = lstEntityPayments;
    }

    @Override
    public String toString() {
        return "EntityVisit{" +
                "phoneNumber='" + phoneNumber + '\'' +
                ", fullName='" + fullName + '\'' +
                ", address='" + address + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", note='" + note + '\'' +
                ", lstEntityPayments=" + lstEntityPayments +
                ", lstEntityLikes=" + lstEntityLikes +
                '}';
    }
}
