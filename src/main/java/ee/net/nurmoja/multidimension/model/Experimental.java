package ee.net.nurmoja.multidimension.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "experimental")
public class Experimental implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "status")
    private String status = "draft";

    @Column(name = "sort")
    private Integer sort;

    @Column(name = "owner")
    private Integer owner;

    @Column(name = "created_on")
    private Date createdOn;

    @Column(name = "modified_by")
    private Integer modifiedBy;

    @Column(name = "modified_on")
    private Date modifiedOn;

    @Column(name = "eesnimi")
    private String eesnimi;

    @Column(name = "perekonnanimi", nullable = false)
    private String perekonnanimi;

    @Column(name = "syndinud", nullable = false)
    private Date syndinud;

    @Column(name = "surnud")
    private Date surnud;

    @Column(name = "elus")
    private Integer elus;

    @Column(name = "five_id")
    private Integer fiveId;

    public Experimental() {
    }

    public Integer getId() {
        return this.id;
    }

    public String getStatus() {
        return this.status;
    }

    public Integer getSort() {
        return this.sort;
    }

    public Integer getOwner() {
        return this.owner;
    }

    public Date getCreatedOn() {
        return this.createdOn;
    }

    public Integer getModifiedBy() {
        return this.modifiedBy;
    }

    public Date getModifiedOn() {
        return this.modifiedOn;
    }

    public String getEesnimi() {
        return this.eesnimi;
    }

    public String getPerekonnanimi() {
        return this.perekonnanimi;
    }

    public Date getSyndinud() {
        return this.syndinud;
    }

    public Date getSurnud() {
        return this.surnud;
    }

    public Integer getElus() {
        return this.elus;
    }

    public Integer getFiveId() {
        return this.fiveId;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public void setOwner(Integer owner) {
        this.owner = owner;
    }

    public void setCreatedOn(Date createdOn) {
        this.createdOn = createdOn;
    }

    public void setModifiedBy(Integer modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    public void setModifiedOn(Date modifiedOn) {
        this.modifiedOn = modifiedOn;
    }

    public void setEesnimi(String eesnimi) {
        this.eesnimi = eesnimi;
    }

    public void setPerekonnanimi(String perekonnanimi) {
        this.perekonnanimi = perekonnanimi;
    }

    public void setSyndinud(Date syndinud) {
        this.syndinud = syndinud;
    }

    public void setSurnud(Date surnud) {
        this.surnud = surnud;
    }

    public void setElus(Integer elus) {
        this.elus = elus;
    }

    public void setFiveId(Integer fiveId) {
        this.fiveId = fiveId;
    }

    public boolean equals(final Object o) {
        if (o == this) return true;
        if (!(o instanceof Experimental)) return false;
        final Experimental other = (Experimental) o;
        if (!other.canEqual((Object) this)) return false;
        final Object this$id = this.getId();
        final Object other$id = other.getId();
        if (this$id == null ? other$id != null : !this$id.equals(other$id)) return false;
        final Object this$status = this.getStatus();
        final Object other$status = other.getStatus();
        if (this$status == null ? other$status != null : !this$status.equals(other$status)) return false;
        final Object this$sort = this.getSort();
        final Object other$sort = other.getSort();
        if (this$sort == null ? other$sort != null : !this$sort.equals(other$sort)) return false;
        final Object this$owner = this.getOwner();
        final Object other$owner = other.getOwner();
        if (this$owner == null ? other$owner != null : !this$owner.equals(other$owner)) return false;
        final Object this$createdOn = this.getCreatedOn();
        final Object other$createdOn = other.getCreatedOn();
        if (this$createdOn == null ? other$createdOn != null : !this$createdOn.equals(other$createdOn)) return false;
        final Object this$modifiedBy = this.getModifiedBy();
        final Object other$modifiedBy = other.getModifiedBy();
        if (this$modifiedBy == null ? other$modifiedBy != null : !this$modifiedBy.equals(other$modifiedBy))
            return false;
        final Object this$modifiedOn = this.getModifiedOn();
        final Object other$modifiedOn = other.getModifiedOn();
        if (this$modifiedOn == null ? other$modifiedOn != null : !this$modifiedOn.equals(other$modifiedOn))
            return false;
        final Object this$eesnimi = this.getEesnimi();
        final Object other$eesnimi = other.getEesnimi();
        if (this$eesnimi == null ? other$eesnimi != null : !this$eesnimi.equals(other$eesnimi)) return false;
        final Object this$perekonnanimi = this.getPerekonnanimi();
        final Object other$perekonnanimi = other.getPerekonnanimi();
        if (this$perekonnanimi == null ? other$perekonnanimi != null : !this$perekonnanimi.equals(other$perekonnanimi))
            return false;
        final Object this$syndinud = this.getSyndinud();
        final Object other$syndinud = other.getSyndinud();
        if (this$syndinud == null ? other$syndinud != null : !this$syndinud.equals(other$syndinud)) return false;
        final Object this$surnud = this.getSurnud();
        final Object other$surnud = other.getSurnud();
        if (this$surnud == null ? other$surnud != null : !this$surnud.equals(other$surnud)) return false;
        final Object this$elus = this.getElus();
        final Object other$elus = other.getElus();
        if (this$elus == null ? other$elus != null : !this$elus.equals(other$elus)) return false;
        final Object this$fiveId = this.getFiveId();
        final Object other$fiveId = other.getFiveId();
        if (this$fiveId == null ? other$fiveId != null : !this$fiveId.equals(other$fiveId)) return false;
        return true;
    }

    protected boolean canEqual(final Object other) {
        return other instanceof Experimental;
    }

    public int hashCode() {
        final int PRIME = 59;
        int result = 1;
        final Object $id = this.getId();
        result = result * PRIME + ($id == null ? 43 : $id.hashCode());
        final Object $status = this.getStatus();
        result = result * PRIME + ($status == null ? 43 : $status.hashCode());
        final Object $sort = this.getSort();
        result = result * PRIME + ($sort == null ? 43 : $sort.hashCode());
        final Object $owner = this.getOwner();
        result = result * PRIME + ($owner == null ? 43 : $owner.hashCode());
        final Object $createdOn = this.getCreatedOn();
        result = result * PRIME + ($createdOn == null ? 43 : $createdOn.hashCode());
        final Object $modifiedBy = this.getModifiedBy();
        result = result * PRIME + ($modifiedBy == null ? 43 : $modifiedBy.hashCode());
        final Object $modifiedOn = this.getModifiedOn();
        result = result * PRIME + ($modifiedOn == null ? 43 : $modifiedOn.hashCode());
        final Object $eesnimi = this.getEesnimi();
        result = result * PRIME + ($eesnimi == null ? 43 : $eesnimi.hashCode());
        final Object $perekonnanimi = this.getPerekonnanimi();
        result = result * PRIME + ($perekonnanimi == null ? 43 : $perekonnanimi.hashCode());
        final Object $syndinud = this.getSyndinud();
        result = result * PRIME + ($syndinud == null ? 43 : $syndinud.hashCode());
        final Object $surnud = this.getSurnud();
        result = result * PRIME + ($surnud == null ? 43 : $surnud.hashCode());
        final Object $elus = this.getElus();
        result = result * PRIME + ($elus == null ? 43 : $elus.hashCode());
        final Object $fiveId = this.getFiveId();
        result = result * PRIME + ($fiveId == null ? 43 : $fiveId.hashCode());
        return result;
    }

    public String toString() {
        return "Experimental(id=" + this.getId() + ", status=" + this.getStatus() + ", sort=" + this.getSort() + ", owner=" + this.getOwner() + ", createdOn=" + this.getCreatedOn() + ", modifiedBy=" + this.getModifiedBy() + ", modifiedOn=" + this.getModifiedOn() + ", eesnimi=" + this.getEesnimi() + ", perekonnanimi=" + this.getPerekonnanimi() + ", syndinud=" + this.getSyndinud() + ", surnud=" + this.getSurnud() + ", elus=" + this.getElus() + ", fiveId=" + this.getFiveId() + ")";
    }
}
