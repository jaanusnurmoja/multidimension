package ee.net.nurmoja.multidimension.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "items")
public class Item implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @JoinColumn(name = "collection_id")
    @ManyToOne
    private Collection collection;

    @Column(name = "title", nullable = false)
    private String title;

    @Column(name = "year")
    private Short year;

    @Column(name = "description", nullable = false)
    private String description;

    public Item() {
    }

    public Collection getParent(){
        return collection;
    }


    public Collection getCollections() {
        return collection;
    }

    public void setCollections(Collection collection) {
        this.collection = collection;
    }

    public Integer getId() {
        return this.id;
    }

    public Collection getCollection() {
        return this.collection;
    }

    public String getTitle() {
        return this.title;
    }

    public Short getYear() {
        return this.year;
    }

    public String getDescription() {
        return this.description;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setCollection(Collection collection) {
        this.collection = collection;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setYear(Short year) {
        this.year = year;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean equals(final Object o) {
        if (o == this) return true;
        if (!(o instanceof Item)) return false;
        final Item other = (Item) o;
        if (!other.canEqual((Object) this)) return false;
        final Object this$id = this.getId();
        final Object other$id = other.getId();
        if (this$id == null ? other$id != null : !this$id.equals(other$id)) return false;
        final Object this$collection = this.getCollection();
        final Object other$collection = other.getCollection();
        if (this$collection == null ? other$collection != null : !this$collection.equals(other$collection))
            return false;
        final Object this$title = this.getTitle();
        final Object other$title = other.getTitle();
        if (this$title == null ? other$title != null : !this$title.equals(other$title)) return false;
        final Object this$year = this.getYear();
        final Object other$year = other.getYear();
        if (this$year == null ? other$year != null : !this$year.equals(other$year)) return false;
        final Object this$description = this.getDescription();
        final Object other$description = other.getDescription();
        if (this$description == null ? other$description != null : !this$description.equals(other$description))
            return false;
        return true;
    }

    protected boolean canEqual(final Object other) {
        return other instanceof Item;
    }

    public int hashCode() {
        final int PRIME = 59;
        int result = 1;
        final Object $id = this.getId();
        result = result * PRIME + ($id == null ? 43 : $id.hashCode());
        final Object $collection = this.getCollection();
        result = result * PRIME + ($collection == null ? 43 : $collection.hashCode());
        final Object $title = this.getTitle();
        result = result * PRIME + ($title == null ? 43 : $title.hashCode());
        final Object $year = this.getYear();
        result = result * PRIME + ($year == null ? 43 : $year.hashCode());
        final Object $description = this.getDescription();
        result = result * PRIME + ($description == null ? 43 : $description.hashCode());
        return result;
    }

    public String toString() {
        return "Item(id=" + this.getId() + ", collection=" + this.getCollection() + ", title=" + this.getTitle() + ", year=" + this.getYear() + ", description=" + this.getDescription() + ")";
    }
}
