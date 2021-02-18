package ee.net.nurmoja.multidimension.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "fields")
public class Fields implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "tables_id", nullable = false)
    private Integer tablesId;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "showInTable", nullable = false)
    private Integer showInTable;

    @Column(name = "showInForm", nullable = false)
    private Integer showInForm;

    @Column(name = "showInDetails", nullable = false)
    private Integer showInDetails;

    @Column(name = "lookupTable")
    private String lookupTable;

    @Column(name = "lookupKey")
    private String lookupKey;

    @Column(name = "lookupDisplay")
    private String lookupDisplay;

    @Column(name = "formDisplay", nullable = false)
    private String formDisplay;

    public Fields() {
    }

    public Integer getId() {
        return this.id;
    }

    public Integer getTablesId() {
        return this.tablesId;
    }

    public String getName() {
        return this.name;
    }

    public Integer getShowInTable() {
        return this.showInTable;
    }

    public Integer getShowInForm() {
        return this.showInForm;
    }

    public Integer getShowInDetails() {
        return this.showInDetails;
    }

    public String getLookupTable() {
        return this.lookupTable;
    }

    public String getLookupKey() {
        return this.lookupKey;
    }

    public String getLookupDisplay() {
        return this.lookupDisplay;
    }

    public String getFormDisplay() {
        return this.formDisplay;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setTablesId(Integer tablesId) {
        this.tablesId = tablesId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setShowInTable(Integer showInTable) {
        this.showInTable = showInTable;
    }

    public void setShowInForm(Integer showInForm) {
        this.showInForm = showInForm;
    }

    public void setShowInDetails(Integer showInDetails) {
        this.showInDetails = showInDetails;
    }

    public void setLookupTable(String lookupTable) {
        this.lookupTable = lookupTable;
    }

    public void setLookupKey(String lookupKey) {
        this.lookupKey = lookupKey;
    }

    public void setLookupDisplay(String lookupDisplay) {
        this.lookupDisplay = lookupDisplay;
    }

    public void setFormDisplay(String formDisplay) {
        this.formDisplay = formDisplay;
    }

    public boolean equals(final Object o) {
        if (o == this) return true;
        if (!(o instanceof Fields)) return false;
        final Fields other = (Fields) o;
        if (!other.canEqual((Object) this)) return false;
        final Object this$id = this.getId();
        final Object other$id = other.getId();
        if (this$id == null ? other$id != null : !this$id.equals(other$id)) return false;
        final Object this$tablesId = this.getTablesId();
        final Object other$tablesId = other.getTablesId();
        if (this$tablesId == null ? other$tablesId != null : !this$tablesId.equals(other$tablesId)) return false;
        final Object this$name = this.getName();
        final Object other$name = other.getName();
        if (this$name == null ? other$name != null : !this$name.equals(other$name)) return false;
        final Object this$showInTable = this.getShowInTable();
        final Object other$showInTable = other.getShowInTable();
        if (this$showInTable == null ? other$showInTable != null : !this$showInTable.equals(other$showInTable))
            return false;
        final Object this$showInForm = this.getShowInForm();
        final Object other$showInForm = other.getShowInForm();
        if (this$showInForm == null ? other$showInForm != null : !this$showInForm.equals(other$showInForm))
            return false;
        final Object this$showInDetails = this.getShowInDetails();
        final Object other$showInDetails = other.getShowInDetails();
        if (this$showInDetails == null ? other$showInDetails != null : !this$showInDetails.equals(other$showInDetails))
            return false;
        final Object this$lookupTable = this.getLookupTable();
        final Object other$lookupTable = other.getLookupTable();
        if (this$lookupTable == null ? other$lookupTable != null : !this$lookupTable.equals(other$lookupTable))
            return false;
        final Object this$lookupKey = this.getLookupKey();
        final Object other$lookupKey = other.getLookupKey();
        if (this$lookupKey == null ? other$lookupKey != null : !this$lookupKey.equals(other$lookupKey)) return false;
        final Object this$lookupDisplay = this.getLookupDisplay();
        final Object other$lookupDisplay = other.getLookupDisplay();
        if (this$lookupDisplay == null ? other$lookupDisplay != null : !this$lookupDisplay.equals(other$lookupDisplay))
            return false;
        final Object this$formDisplay = this.getFormDisplay();
        final Object other$formDisplay = other.getFormDisplay();
        if (this$formDisplay == null ? other$formDisplay != null : !this$formDisplay.equals(other$formDisplay))
            return false;
        return true;
    }

    protected boolean canEqual(final Object other) {
        return other instanceof Fields;
    }

    public int hashCode() {
        final int PRIME = 59;
        int result = 1;
        final Object $id = this.getId();
        result = result * PRIME + ($id == null ? 43 : $id.hashCode());
        final Object $tablesId = this.getTablesId();
        result = result * PRIME + ($tablesId == null ? 43 : $tablesId.hashCode());
        final Object $name = this.getName();
        result = result * PRIME + ($name == null ? 43 : $name.hashCode());
        final Object $showInTable = this.getShowInTable();
        result = result * PRIME + ($showInTable == null ? 43 : $showInTable.hashCode());
        final Object $showInForm = this.getShowInForm();
        result = result * PRIME + ($showInForm == null ? 43 : $showInForm.hashCode());
        final Object $showInDetails = this.getShowInDetails();
        result = result * PRIME + ($showInDetails == null ? 43 : $showInDetails.hashCode());
        final Object $lookupTable = this.getLookupTable();
        result = result * PRIME + ($lookupTable == null ? 43 : $lookupTable.hashCode());
        final Object $lookupKey = this.getLookupKey();
        result = result * PRIME + ($lookupKey == null ? 43 : $lookupKey.hashCode());
        final Object $lookupDisplay = this.getLookupDisplay();
        result = result * PRIME + ($lookupDisplay == null ? 43 : $lookupDisplay.hashCode());
        final Object $formDisplay = this.getFormDisplay();
        result = result * PRIME + ($formDisplay == null ? 43 : $formDisplay.hashCode());
        return result;
    }

    public String toString() {
        return "Fields(id=" + this.getId() + ", tablesId=" + this.getTablesId() + ", name=" + this.getName() + ", showInTable=" + this.getShowInTable() + ", showInForm=" + this.getShowInForm() + ", showInDetails=" + this.getShowInDetails() + ", lookupTable=" + this.getLookupTable() + ", lookupKey=" + this.getLookupKey() + ", lookupDisplay=" + this.getLookupDisplay() + ", formDisplay=" + this.getFormDisplay() + ")";
    }
}
