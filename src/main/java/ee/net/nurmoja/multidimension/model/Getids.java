package ee.net.nurmoja.multidimension.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "getids")
public class Getids implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue
    private Long id;

    @Column(name = "mainId")
    private String mainId;

    @Column(name = "main", nullable = false)
    private Long main;

    @Column(name = "locationId")
    private String locationId;

    @Column(name = "location", nullable = false)
    private Long location;

    @Column(name = "groupedId")
    private String groupedId;

    @Column(name = "grouped_entry", nullable = false)
    private Long groupedEntry;

    @Column(name = "collectionId")
    private String collectionId;

    @Column(name = "collection", nullable = false)
    private Long collection;

    @Column(name = "itemsId")
    private String itemsId;

    @Column(name = "items", nullable = false)
    private Long items;

    public Getids() {
    }

    public void setId(Long id) {
        id = Long.parseLong(getMainId()
                .concat(getLocationId())
                .concat(getGroupedId())
                .concat(getCollectionId())
                .concat(getItemsId()));
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public String getMainId() {
        return this.mainId;
    }

    public Long getMain() {
        return this.main;
    }

    public String getLocationId() {
        return this.locationId;
    }

    public Long getLocation() {
        return this.location;
    }

    public String getGroupedId() {
        return this.groupedId;
    }

    public Long getGroupedEntry() {
        return this.groupedEntry;
    }

    public String getCollectionId() {
        return this.collectionId;
    }

    public Long getCollection() {
        return this.collection;
    }

    public String getItemsId() {
        return this.itemsId;
    }

    public Long getItems() {
        return this.items;
    }

    public void setMainId(String mainId) {
        this.mainId = mainId;
    }

    public void setMain(Long main) {
        this.main = main;
    }

    public void setLocationId(String locationId) {
        this.locationId = locationId;
    }

    public void setLocation(Long location) {
        this.location = location;
    }

    public void setGroupedId(String groupedId) {
        this.groupedId = groupedId;
    }

    public void setGroupedEntry(Long groupedEntry) {
        this.groupedEntry = groupedEntry;
    }

    public void setCollectionId(String collectionId) {
        this.collectionId = collectionId;
    }

    public void setCollection(Long collection) {
        this.collection = collection;
    }

    public void setItemsId(String itemsId) {
        this.itemsId = itemsId;
    }

    public void setItems(Long items) {
        this.items = items;
    }

    public boolean equals(final Object o) {
        if (o == this) return true;
        if (!(o instanceof Getids)) return false;
        final Getids other = (Getids) o;
        if (!other.canEqual((Object) this)) return false;
        final Object this$id = this.getId();
        final Object other$id = other.getId();
        if (this$id == null ? other$id != null : !this$id.equals(other$id)) return false;
        final Object this$mainId = this.getMainId();
        final Object other$mainId = other.getMainId();
        if (this$mainId == null ? other$mainId != null : !this$mainId.equals(other$mainId)) return false;
        final Object this$main = this.getMain();
        final Object other$main = other.getMain();
        if (this$main == null ? other$main != null : !this$main.equals(other$main)) return false;
        final Object this$locationId = this.getLocationId();
        final Object other$locationId = other.getLocationId();
        if (this$locationId == null ? other$locationId != null : !this$locationId.equals(other$locationId))
            return false;
        final Object this$location = this.getLocation();
        final Object other$location = other.getLocation();
        if (this$location == null ? other$location != null : !this$location.equals(other$location)) return false;
        final Object this$groupedId = this.getGroupedId();
        final Object other$groupedId = other.getGroupedId();
        if (this$groupedId == null ? other$groupedId != null : !this$groupedId.equals(other$groupedId)) return false;
        final Object this$groupedEntry = this.getGroupedEntry();
        final Object other$groupedEntry = other.getGroupedEntry();
        if (this$groupedEntry == null ? other$groupedEntry != null : !this$groupedEntry.equals(other$groupedEntry))
            return false;
        final Object this$collectionId = this.getCollectionId();
        final Object other$collectionId = other.getCollectionId();
        if (this$collectionId == null ? other$collectionId != null : !this$collectionId.equals(other$collectionId))
            return false;
        final Object this$collection = this.getCollection();
        final Object other$collection = other.getCollection();
        if (this$collection == null ? other$collection != null : !this$collection.equals(other$collection))
            return false;
        final Object this$itemsId = this.getItemsId();
        final Object other$itemsId = other.getItemsId();
        if (this$itemsId == null ? other$itemsId != null : !this$itemsId.equals(other$itemsId)) return false;
        final Object this$items = this.getItems();
        final Object other$items = other.getItems();
        if (this$items == null ? other$items != null : !this$items.equals(other$items)) return false;
        return true;
    }

    protected boolean canEqual(final Object other) {
        return other instanceof Getids;
    }

    public int hashCode() {
        final int PRIME = 59;
        int result = 1;
        final Object $id = this.getId();
        result = result * PRIME + ($id == null ? 43 : $id.hashCode());
        final Object $mainId = this.getMainId();
        result = result * PRIME + ($mainId == null ? 43 : $mainId.hashCode());
        final Object $main = this.getMain();
        result = result * PRIME + ($main == null ? 43 : $main.hashCode());
        final Object $locationId = this.getLocationId();
        result = result * PRIME + ($locationId == null ? 43 : $locationId.hashCode());
        final Object $location = this.getLocation();
        result = result * PRIME + ($location == null ? 43 : $location.hashCode());
        final Object $groupedId = this.getGroupedId();
        result = result * PRIME + ($groupedId == null ? 43 : $groupedId.hashCode());
        final Object $groupedEntry = this.getGroupedEntry();
        result = result * PRIME + ($groupedEntry == null ? 43 : $groupedEntry.hashCode());
        final Object $collectionId = this.getCollectionId();
        result = result * PRIME + ($collectionId == null ? 43 : $collectionId.hashCode());
        final Object $collection = this.getCollection();
        result = result * PRIME + ($collection == null ? 43 : $collection.hashCode());
        final Object $itemsId = this.getItemsId();
        result = result * PRIME + ($itemsId == null ? 43 : $itemsId.hashCode());
        final Object $items = this.getItems();
        result = result * PRIME + ($items == null ? 43 : $items.hashCode());
        return result;
    }

    public String toString() {
        return "Getids(id=" + this.getId() + ", mainId=" + this.getMainId() + ", main=" + this.getMain() + ", locationId=" + this.getLocationId() + ", location=" + this.getLocation() + ", groupedId=" + this.getGroupedId() + ", groupedEntry=" + this.getGroupedEntry() + ", collectionId=" + this.getCollectionId() + ", collection=" + this.getCollection() + ", itemsId=" + this.getItemsId() + ", items=" + this.getItems() + ")";
    }
}
