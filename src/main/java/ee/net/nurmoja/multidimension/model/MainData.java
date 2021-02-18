package ee.net.nurmoja.multidimension.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "main_data")
public class MainData implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "created", nullable = false)
    private Date created;

    @OneToMany(mappedBy = "mainData")
    private List<Location> locations;

    public MainData() {
    }

    public List<Location> getLocations() {
        return locations;
    }

    public void setLocations(List<Location> locations) {
        this.locations = locations;
    }

    @OneToMany(mappedBy = "mainData")
    private List<GroupedEntry> groupedEntries;

    @OneToMany(mappedBy = "mainData")
    private List<Collection> collections;

    public List<List<?>> getChildren(MainData m) {
        List<List<?>> children = new ArrayList<>();
        children.add(this.getLocations());
        children.add(this.getGroupedEntries());
        children.add(this.getCollections());
        return children;
    }

    public Integer getId() {
        return this.id;
    }

    public String getName() {
        return this.name;
    }

    public Date getCreated() {
        return this.created;
    }

    public List<GroupedEntry> getGroupedEntries() {
        return this.groupedEntries;
    }

    public List<Collection> getCollections() {
        return this.collections;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public void setGroupedEntries(List<GroupedEntry> groupedEntries) {
        this.groupedEntries = groupedEntries;
    }

    public void setCollections(List<Collection> collections) {
        this.collections = collections;
    }

    public boolean equals(final Object o) {
        if (o == this) return true;
        if (!(o instanceof MainData)) return false;
        final MainData other = (MainData) o;
        if (!other.canEqual((Object) this)) return false;
        final Object this$id = this.getId();
        final Object other$id = other.getId();
        if (this$id == null ? other$id != null : !this$id.equals(other$id)) return false;
        final Object this$name = this.getName();
        final Object other$name = other.getName();
        if (this$name == null ? other$name != null : !this$name.equals(other$name)) return false;
        final Object this$created = this.getCreated();
        final Object other$created = other.getCreated();
        if (this$created == null ? other$created != null : !this$created.equals(other$created)) return false;
        final Object this$locations = this.getLocations();
        final Object other$locations = other.getLocations();
        if (this$locations == null ? other$locations != null : !this$locations.equals(other$locations)) return false;
        final Object this$groupedEntries = this.getGroupedEntries();
        final Object other$groupedEntries = other.getGroupedEntries();
        if (this$groupedEntries == null ? other$groupedEntries != null : !this$groupedEntries.equals(other$groupedEntries))
            return false;
        final Object this$collections = this.getCollections();
        final Object other$collections = other.getCollections();
        if (this$collections == null ? other$collections != null : !this$collections.equals(other$collections))
            return false;
        return true;
    }

    protected boolean canEqual(final Object other) {
        return other instanceof MainData;
    }

    public int hashCode() {
        final int PRIME = 59;
        int result = 1;
        final Object $id = this.getId();
        result = result * PRIME + ($id == null ? 43 : $id.hashCode());
        final Object $name = this.getName();
        result = result * PRIME + ($name == null ? 43 : $name.hashCode());
        final Object $created = this.getCreated();
        result = result * PRIME + ($created == null ? 43 : $created.hashCode());
        final Object $locations = this.getLocations();
        result = result * PRIME + ($locations == null ? 43 : $locations.hashCode());
        final Object $groupedEntries = this.getGroupedEntries();
        result = result * PRIME + ($groupedEntries == null ? 43 : $groupedEntries.hashCode());
        final Object $collections = this.getCollections();
        result = result * PRIME + ($collections == null ? 43 : $collections.hashCode());
        return result;
    }

    public String toString() {
        return "MainData(id=" + this.getId() + ", name=" + this.getName() + ", created=" + this.getCreated() + ", locations=" + this.getLocations().toString() + ", groupedEntries=" + this.getGroupedEntries().toString() + ", collections=" + this.getCollections().toString() + ")";
    }
}
