package ee.net.nurmoja.multidimension.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "three")
public class Three implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @JoinColumn(name = "two_id")
    @ManyToOne
    private Two two;

    @Column(name = "title")
    private String title;

    @Column(name = "created", nullable = false)
    private Date created;

    @Column(name = "modified")
    private Date modified;

    @OneToMany(mappedBy = "three")
    List<Four> fours;

    public Three() {
    }

    public Three(Two two) {
        this.two = two;
    }

    public Two getParent(){
        return two;
    }

    public Integer getId() {
        return this.id;
    }

    public Two getTwo() {
        return this.two;
    }

    public String getTitle() {
        return this.title;
    }

    public Date getCreated() {
        return this.created;
    }

    public Date getModified() {
        return this.modified;
    }

    public List<Four> getFours() {
        return this.fours;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setTwo(Two two) {
        this.two = two;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public void setModified(Date modified) {
        this.modified = modified;
    }

    public void setFours(List<Four> fours) {
        this.fours = fours;
    }

    public boolean equals(final Object o) {
        if (o == this) return true;
        if (!(o instanceof Three)) return false;
        final Three other = (Three) o;
        if (!other.canEqual((Object) this)) return false;
        final Object this$id = this.getId();
        final Object other$id = other.getId();
        if (this$id == null ? other$id != null : !this$id.equals(other$id)) return false;
        final Object this$two = this.getTwo();
        final Object other$two = other.getTwo();
        if (this$two == null ? other$two != null : !this$two.equals(other$two)) return false;
        final Object this$title = this.getTitle();
        final Object other$title = other.getTitle();
        if (this$title == null ? other$title != null : !this$title.equals(other$title)) return false;
        final Object this$created = this.getCreated();
        final Object other$created = other.getCreated();
        if (this$created == null ? other$created != null : !this$created.equals(other$created)) return false;
        final Object this$modified = this.getModified();
        final Object other$modified = other.getModified();
        if (this$modified == null ? other$modified != null : !this$modified.equals(other$modified)) return false;
        final Object this$fours = this.getFours();
        final Object other$fours = other.getFours();
        if (this$fours == null ? other$fours != null : !this$fours.equals(other$fours)) return false;
        return true;
    }

    protected boolean canEqual(final Object other) {
        return other instanceof Three;
    }

    public int hashCode() {
        final int PRIME = 59;
        int result = 1;
        final Object $id = this.getId();
        result = result * PRIME + ($id == null ? 43 : $id.hashCode());
        final Object $two = this.getTwo();
        result = result * PRIME + ($two == null ? 43 : $two.hashCode());
        final Object $title = this.getTitle();
        result = result * PRIME + ($title == null ? 43 : $title.hashCode());
        final Object $created = this.getCreated();
        result = result * PRIME + ($created == null ? 43 : $created.hashCode());
        final Object $modified = this.getModified();
        result = result * PRIME + ($modified == null ? 43 : $modified.hashCode());
        final Object $fours = this.getFours();
        result = result * PRIME + ($fours == null ? 43 : $fours.hashCode());
        return result;
    }

    public String toString() {
        return "Three(id=" + this.getId() + ", two=" + this.getTwo() + ", title=" + this.getTitle() + ", created=" + this.getCreated() + ", modified=" + this.getModified() + ", fours=" + this.getFours().toString() + ")";
    }
}
