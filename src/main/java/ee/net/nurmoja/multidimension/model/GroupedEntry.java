package ee.net.nurmoja.multidimension.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "grouped_entry")
public class GroupedEntry implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @JoinColumn(name = "main_id")
    @ManyToOne
    private MainData mainData;

    @Column(name = "url")
    private String url;

    @Column(name = "title")
    private String title;

    @Column(name = "image")
    private String image;

    public GroupedEntry() {
    }

    public Integer getId() {
        return this.id;
    }

    public MainData getMainData() {
        return this.mainData;
    }

    public String getUrl() {
        return this.url;
    }

    public String getTitle() {
        return this.title;
    }

    public String getImage() {
        return this.image;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setMainData(MainData mainData) {
        this.mainData = mainData;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public boolean equals(final Object o) {
        if (o == this) return true;
        if (!(o instanceof GroupedEntry)) return false;
        final GroupedEntry other = (GroupedEntry) o;
        if (!other.canEqual((Object) this)) return false;
        final Object this$id = this.getId();
        final Object other$id = other.getId();
        if (this$id == null ? other$id != null : !this$id.equals(other$id)) return false;
        final Object this$mainData = this.getMainData();
        final Object other$mainData = other.getMainData();
        if (this$mainData == null ? other$mainData != null : !this$mainData.equals(other$mainData)) return false;
        final Object this$url = this.getUrl();
        final Object other$url = other.getUrl();
        if (this$url == null ? other$url != null : !this$url.equals(other$url)) return false;
        final Object this$title = this.getTitle();
        final Object other$title = other.getTitle();
        if (this$title == null ? other$title != null : !this$title.equals(other$title)) return false;
        final Object this$image = this.getImage();
        final Object other$image = other.getImage();
        if (this$image == null ? other$image != null : !this$image.equals(other$image)) return false;
        return true;
    }

    protected boolean canEqual(final Object other) {
        return other instanceof GroupedEntry;
    }

    public int hashCode() {
        final int PRIME = 59;
        int result = 1;
        final Object $id = this.getId();
        result = result * PRIME + ($id == null ? 43 : $id.hashCode());
        final Object $mainData = this.getMainData();
        result = result * PRIME + ($mainData == null ? 43 : $mainData.hashCode());
        final Object $url = this.getUrl();
        result = result * PRIME + ($url == null ? 43 : $url.hashCode());
        final Object $title = this.getTitle();
        result = result * PRIME + ($title == null ? 43 : $title.hashCode());
        final Object $image = this.getImage();
        result = result * PRIME + ($image == null ? 43 : $image.hashCode());
        return result;
    }

    public String toString() {
        return "GroupedEntry(id=" + this.getId() + ", mainData=" + this.getMainData() + ", url=" + this.getUrl() + ", title=" + this.getTitle() + ", image=" + this.getImage() + ")";
    }
}
