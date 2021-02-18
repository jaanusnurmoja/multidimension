package ee.net.nurmoja.multidimension.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "two")
public class Two implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "one_id")
    private One one;

    @Column(name = "title")
    private String title;

    @Column(name = "created", nullable = false)
    private Date created;

    @Column(name = "modified")
    private Date modified;

    @OneToMany(mappedBy = "two")
    private List<Three> threes;

    public Two() {
    }

    public Two(One one) {
        this.one = one;
    }

    public One getParent(){
        return one;
    }

    public void getChildren(){
        this.getThrees();
    }

    public Integer getId() {
        return this.id;
    }

    public One getOne() {
        return this.one;
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

    public List<Three> getThrees() {
        return this.threes;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setOne(One one) {
        this.one = one;
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

    public void setThrees(List<Three> threes) {
        this.threes = threes;
    }

    public boolean equals(final Object o) {
        if (o == this) return true;
        if (!(o instanceof Two)) return false;
        final Two other = (Two) o;
        if (!other.canEqual((Object) this)) return false;
        final Object this$id = this.getId();
        final Object other$id = other.getId();
        if (this$id == null ? other$id != null : !this$id.equals(other$id)) return false;
        final Object this$one = this.getOne();
        final Object other$one = other.getOne();
        if (this$one == null ? other$one != null : !this$one.equals(other$one)) return false;
        final Object this$title = this.getTitle();
        final Object other$title = other.getTitle();
        if (this$title == null ? other$title != null : !this$title.equals(other$title)) return false;
        final Object this$created = this.getCreated();
        final Object other$created = other.getCreated();
        if (this$created == null ? other$created != null : !this$created.equals(other$created)) return false;
        final Object this$modified = this.getModified();
        final Object other$modified = other.getModified();
        if (this$modified == null ? other$modified != null : !this$modified.equals(other$modified)) return false;
        final Object this$threes = this.getThrees();
        final Object other$threes = other.getThrees();
        if (this$threes == null ? other$threes != null : !this$threes.equals(other$threes)) return false;
        return true;
    }

    protected boolean canEqual(final Object other) {
        return other instanceof Two;
    }

    public int hashCode() {
        final int PRIME = 59;
        int result = 1;
        final Object $id = this.getId();
        result = result * PRIME + ($id == null ? 43 : $id.hashCode());
        final Object $one = this.getOne();
        result = result * PRIME + ($one == null ? 43 : $one.hashCode());
        final Object $title = this.getTitle();
        result = result * PRIME + ($title == null ? 43 : $title.hashCode());
        final Object $created = this.getCreated();
        result = result * PRIME + ($created == null ? 43 : $created.hashCode());
        final Object $modified = this.getModified();
        result = result * PRIME + ($modified == null ? 43 : $modified.hashCode());
        final Object $threes = this.getThrees();
        result = result * PRIME + ($threes == null ? 43 : $threes.hashCode());
        return result;
    }

    public String toString() {
        return "Two(id=" + this.getId() + ", one=" + this.getOne() + ", title=" + this.getTitle() + ", created=" + this.getCreated() + ", modified=" + this.getModified() + ", threes=" + this.getThrees().toString() + ")";
    }
}
