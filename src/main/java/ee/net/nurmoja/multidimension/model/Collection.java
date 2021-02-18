package ee.net.nurmoja.multidimension.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "collection")
public class Collection implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @ManyToOne
    @JoinColumn(name="main_id")
    private MainData mainData;

    @Column(name = "heading", nullable = false)
    private String heading;

    @OneToMany(mappedBy = "collection")
    private List<Item> items;

    public Collection() {
    }

    public MainData getParent(){
        return mainData;
    }

    public List<List<?>> getChildren(Collection c) {
        List<List<?>> children = new ArrayList<>();
        children.add(this.getItems(c));
        return children;
    }

    public MainData getMainData() {
        return mainData;
    }

    public void setMainData(MainData mainData) {
        this.mainData = mainData;
    }


    public List<Item> getItems(Collection c) {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public Integer getId() {
        return this.id;
    }

    public String getHeading() {
        return this.heading;
    }

    public List<Item> getItems() {
        return this.items;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setHeading(String heading) {
        this.heading = heading;
    }

    public boolean equals(final Object o) {
        if (o == this) return true;
        if (!(o instanceof Collection)) return false;
        final Collection other = (Collection) o;
        if (!other.canEqual((Object) this)) return false;
        final Object this$id = this.getId();
        final Object other$id = other.getId();
        if (this$id == null ? other$id != null : !this$id.equals(other$id)) return false;
        final Object this$mainData = this.getMainData();
        final Object other$mainData = other.getMainData();
        if (this$mainData == null ? other$mainData != null : !this$mainData.equals(other$mainData)) return false;
        final Object this$heading = this.getHeading();
        final Object other$heading = other.getHeading();
        if (this$heading == null ? other$heading != null : !this$heading.equals(other$heading)) return false;
        final Object this$items = this.getItems();
        final Object other$items = other.getItems();
        if (this$items == null ? other$items != null : !this$items.equals(other$items)) return false;
        return true;
    }

    protected boolean canEqual(final Object other) {
        return other instanceof Collection;
    }

    public int hashCode() {
        final int PRIME = 59;
        int result = 1;
        final Object $id = this.getId();
        result = result * PRIME + ($id == null ? 43 : $id.hashCode());
        final Object $mainData = this.getMainData();
        result = result * PRIME + ($mainData == null ? 43 : $mainData.hashCode());
        final Object $heading = this.getHeading();
        result = result * PRIME + ($heading == null ? 43 : $heading.hashCode());
        final Object $items = this.getItems();
        result = result * PRIME + ($items == null ? 43 : $items.hashCode());
        return result;
    }

    public String toString() {
        return "Collection(id=" + this.getId() + ", mainData=" + this.getMainData() + ", heading=" + this.getHeading() + ", items=" + this.getItems().toString() + ")";
    }
}
