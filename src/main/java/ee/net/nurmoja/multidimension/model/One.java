package ee.net.nurmoja.multidimension.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "one")
public class One implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "title")
    private String title;

    @Column(name = "created", nullable = false)
    private Date created;

    @Column(name = "modified")
    private Date modified;

    @OneToMany(mappedBy = "one")
    private List<Two> twos;

    public One() {
    }

    public One(One one) {
        this.id = one.id;
        this.title = one.title;
        this.created = one.created;
        this.modified = one.modified;
        one.twos.forEach(t->t.setOne(one));
        this.twos = one.twos;
    }

    public List<List<?>> getChildren(One one) {
        List<List<?>> children = new ArrayList<>();
        children.add(this.getTwos());
        return children;
    }

    public Integer getId() {
        return this.id;
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

    public List<Two> getTwos() {
        return this.twos;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public void setTwos(List<Two> twos) {
        this.twos = twos;
    }

    public boolean equals(final Object o) {
        if (o == this) return true;
        if (!(o instanceof One)) return false;
        final One other = (One) o;
        if (!other.canEqual((Object) this)) return false;
        final Object this$id = this.getId();
        final Object other$id = other.getId();
        if (this$id == null ? other$id != null : !this$id.equals(other$id)) return false;
        final Object this$title = this.getTitle();
        final Object other$title = other.getTitle();
        if (this$title == null ? other$title != null : !this$title.equals(other$title)) return false;
        final Object this$created = this.getCreated();
        final Object other$created = other.getCreated();
        if (this$created == null ? other$created != null : !this$created.equals(other$created)) return false;
        final Object this$modified = this.getModified();
        final Object other$modified = other.getModified();
        if (this$modified == null ? other$modified != null : !this$modified.equals(other$modified)) return false;
        final Object this$twos = this.getTwos();
        final Object other$twos = other.getTwos();
        if (this$twos == null ? other$twos != null : !this$twos.equals(other$twos)) return false;
        return true;
    }

    protected boolean canEqual(final Object other) {
        return other instanceof One;
    }

    public int hashCode() {
        final int PRIME = 59;
        int result = 1;
        final Object $id = this.getId();
        result = result * PRIME + ($id == null ? 43 : $id.hashCode());
        final Object $title = this.getTitle();
        result = result * PRIME + ($title == null ? 43 : $title.hashCode());
        final Object $created = this.getCreated();
        result = result * PRIME + ($created == null ? 43 : $created.hashCode());
        final Object $modified = this.getModified();
        result = result * PRIME + ($modified == null ? 43 : $modified.hashCode());
        final Object $twos = this.getTwos();
        result = result * PRIME + ($twos == null ? 43 : $twos.hashCode());
        return result;
    }

    public String toString() {
        return "One(id=" + this.getId() + ", title=" + this.getTitle() + ", created=" + this.getCreated() + ", modified=" + this.getModified() + ", twos=" + this.getTwos().toString() + ")";
    }
}
