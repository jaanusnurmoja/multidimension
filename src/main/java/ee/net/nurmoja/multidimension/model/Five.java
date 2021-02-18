package ee.net.nurmoja.multidimension.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "five")
public class Five implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "four_id")
    private Four four;

    @Column(name = "title")
    private String title;

    @Column(name = "created", nullable = false)
    private Date created;

    @Column(name = "modified")
    private Date modified;

    public Five() {
    }

    public Five(Four four) {
        this.four = four;
    }

    public Four getParent(){
        return four;
    }

    public Integer getId() {
        return this.id;
    }

    public Four getFour() {
        return this.four;
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

    public void setId(Integer id) {
        this.id = id;
    }

    public void setFour(Four four) {
        this.four = four;
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

    public boolean equals(final Object o) {
        if (o == this) return true;
        if (!(o instanceof Five)) return false;
        final Five other = (Five) o;
        if (!other.canEqual((Object) this)) return false;
        final Object this$id = this.getId();
        final Object other$id = other.getId();
        if (this$id == null ? other$id != null : !this$id.equals(other$id)) return false;
        final Object this$four = this.getFour();
        final Object other$four = other.getFour();
        if (this$four == null ? other$four != null : !this$four.equals(other$four)) return false;
        final Object this$title = this.getTitle();
        final Object other$title = other.getTitle();
        if (this$title == null ? other$title != null : !this$title.equals(other$title)) return false;
        final Object this$created = this.getCreated();
        final Object other$created = other.getCreated();
        if (this$created == null ? other$created != null : !this$created.equals(other$created)) return false;
        final Object this$modified = this.getModified();
        final Object other$modified = other.getModified();
        if (this$modified == null ? other$modified != null : !this$modified.equals(other$modified)) return false;
        return true;
    }

    protected boolean canEqual(final Object other) {
        return other instanceof Five;
    }

    public int hashCode() {
        final int PRIME = 59;
        int result = 1;
        final Object $id = this.getId();
        result = result * PRIME + ($id == null ? 43 : $id.hashCode());
        final Object $four = this.getFour();
        result = result * PRIME + ($four == null ? 43 : $four.hashCode());
        final Object $title = this.getTitle();
        result = result * PRIME + ($title == null ? 43 : $title.hashCode());
        final Object $created = this.getCreated();
        result = result * PRIME + ($created == null ? 43 : $created.hashCode());
        final Object $modified = this.getModified();
        result = result * PRIME + ($modified == null ? 43 : $modified.hashCode());
        return result;
    }

    public String toString() {
        return "Five(id=" + this.getId() + ", four=" + this.getFour() + ", title=" + this.getTitle() + ", created=" + this.getCreated() + ", modified=" + this.getModified() + ")";
    }
}
