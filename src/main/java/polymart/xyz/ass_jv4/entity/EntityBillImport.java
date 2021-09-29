package polymart.xyz.ass_jv4.entity;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "billimport", uniqueConstraints = {
        @UniqueConstraint(columnNames = {"idstaffimport", "idstaffcheck"})
})
@NamedQueries({
        @NamedQuery(name = "findAllBillImport",
                query = "SELECT o FROM EntityBillImport o WHERE o.removed = false"),
        @NamedQuery(name = "findByAllBillImport",
                query = "SELECT o FROM EntityBillImport o WHERE o.entityStaffImport = ?1 " +
                        "AND o.entityStaffCheck = ?2 AND o.dateImport = ?3 AND o.removed = false")
})
public class EntityBillImport {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne
    @JoinColumn(name = "idstaffimport")
    private EntityStaff entityStaffImport;
    @ManyToOne
    @JoinColumn(name = "idstaffcheck")
    private EntityStaff entityStaffCheck;
    @Column(name = "dateimport")
    private Date dateImport;
    @Column(name = "remove")
    private boolean removed;
    @OneToMany(mappedBy = "entityBillImport")
    private List<EntityBillImportDetails> lstBillimportDetails;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public EntityStaff getEntityStaffImport() {
        return entityStaffImport;
    }

    public void setEntityStaffImport(EntityStaff entityStaffImport) {
        this.entityStaffImport = entityStaffImport;
    }

    public EntityStaff getEntityStaffCheck() {
        return entityStaffCheck;
    }

    public void setEntityStaffCheck(EntityStaff entityStaffCheck) {
        this.entityStaffCheck = entityStaffCheck;
    }

    public Date getDateImport() {
        return dateImport;
    }

    public void setDateImport(Date dateImport) {
        this.dateImport = dateImport;
    }

    public boolean isRemoved() {
        return removed;
    }

    public void setRemoved(boolean removed) {
        this.removed = removed;
    }

    public List<EntityBillImportDetails> getLstBillimportDetails() {
        return lstBillimportDetails;
    }

    public void setLstBillimportDetails(List<EntityBillImportDetails> lstBillimportDetails) {
        this.lstBillimportDetails = lstBillimportDetails;
    }

}
