package polymart.xyz.ass_jv4.entity;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "staff")
@NamedQueries({
        @NamedQuery(name = "findAllStaff",
                query = "SELECT o FROM EntityStaff o WHERE o.removed = false"),
        @NamedQuery(name = "findByFullNameStaff",
                query = "SELECT o FROM EntityStaff o WHERE o.lastName LIKE ?1 AND o.firstName LIKE ?2 AND o.removed = false"),
        @NamedQuery(name = "findByEmailStaff",
                query = "SELECT o FROM EntityStaff o WHERE o.email = ?1 AND o.removed = false"),
        @NamedQuery(name = "loginStaff",
                query = "SELECT o FROM EntityStaff o WHERE o.email = ?1 AND o.password = ?2 AND o.removed = false")
})
public class EntityStaff {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "lastname")
    private String lastName;
    @Column(name = "firstname")
    private String firstName;
    @Column(name = "birthday")
    private Date birthday;
    @Column(name = "sex")
    private boolean sex;
    @Column(name = "address")
    private String address;
    @Column(name = "phonenumber")
    private String phoneNumber;
    @Column(name = "email")
    private String email;
    @Column(name = "password")
    private String password;
    @Column(name = "role")
    private int role = 0;
    @Column(name = "avatar")
    private String avatar;
    @Column(name = "note")
    private String note;
    @Column(name = "active")
    private boolean active;
    @Column(name = "block")
    private boolean blocked;
    @Column(name = "remove")
    private boolean removed;
    @OneToMany(mappedBy = "entityStaff")
    private List<EntityBanner> lstEntityBanners;
    @OneToMany(mappedBy = "entityStaffImport")
    private List<EntityBillImport> lstEntityBillImports;
    @OneToMany(mappedBy = "entityStaffCheck")
    private List<EntityBillImport> lstEntityBillImportsCheck;
    @OneToMany(mappedBy = "entityStaffSale")
    private List<EntityPayment> lstEntityPaymentsSale;
    @OneToMany(mappedBy = "entityStaffCashier")
    private List<EntityPayment> lstEntityPaymentsCashier;
    @OneToMany(mappedBy = "entityStaff")
    private List<EntityProduct> lstEntityProductss;
    @OneToMany(mappedBy = "entityStaff")
    private List<EntityVoucher> lstEntityVouchers;
    @OneToMany(mappedBy = "entityStaff")
    private List<EntityRepContact> entityStaff;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public boolean isSex() {
        return sex;
    }

    public void setSex(boolean sex) {
        this.sex = sex;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public boolean isBlocked() {
        return blocked;
    }

    public void setBlocked(boolean blocked) {
        this.blocked = blocked;
    }

    public boolean isRemoved() {
        return removed;
    }

    public void setRemoved(boolean removed) {
        this.removed = removed;
    }

    public List<EntityBanner> getLstEntityBanners() {
        return lstEntityBanners;
    }

    public void setLstEntityBanners(List<EntityBanner> lstEntityBanners) {
        this.lstEntityBanners = lstEntityBanners;
    }

    public List<EntityBillImport> getLstEntityBillImports() {
        return lstEntityBillImports;
    }

    public void setLstEntityBillImports(List<EntityBillImport> lstEntityBillImports) {
        this.lstEntityBillImports = lstEntityBillImports;
    }

    public List<EntityBillImport> getLstEntityBillImportsCheck() {
        return lstEntityBillImportsCheck;
    }

    public void setLstEntityBillImportsCheck(List<EntityBillImport> lstEntityBillImportsCheck) {
        this.lstEntityBillImportsCheck = lstEntityBillImportsCheck;
    }

    public List<EntityPayment> getLstEntityPaymentsSale() {
        return lstEntityPaymentsSale;
    }

    public void setLstEntityPaymentsSale(List<EntityPayment> lstEntityPaymentsSale) {
        this.lstEntityPaymentsSale = lstEntityPaymentsSale;
    }

    public List<EntityPayment> getLstEntityPaymentsCashier() {
        return lstEntityPaymentsCashier;
    }

    public void setLstEntityPaymentsCashier(List<EntityPayment> lstEntityPaymentsCashier) {
        this.lstEntityPaymentsCashier = lstEntityPaymentsCashier;
    }

    public List<EntityProduct> getLstEntityProductss() {
        return lstEntityProductss;
    }

    public void setLstEntityProductss(List<EntityProduct> lstEntityProductss) {
        this.lstEntityProductss = lstEntityProductss;
    }

    public List<EntityVoucher> getLstEntityVouchers() {
        return lstEntityVouchers;
    }

    public void setLstEntityVouchers(List<EntityVoucher> lstEntityVouchers) {
        this.lstEntityVouchers = lstEntityVouchers;
    }

    public List<EntityRepContact> getEntityStaff() {
        return entityStaff;
    }

    public void setEntityStaff(List<EntityRepContact> entityStaff) {
        this.entityStaff = entityStaff;
    }
}
