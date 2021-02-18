package ee.net.nurmoja.multidimension.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "four")
public class Four implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "three_id")
    Three three;

    @Column(name = "title")
    private String title;

    @Column(name = "created", nullable = false)
    private Date created;

    @Column(name = "modified")
    private Date modified;

    @OneToMany(mappedBy = "four")
    List<Five> fives;

    public Four() {
    }

    public Four(Three three) {
        this.three = three;
    }

    public Three getParent(){
        return three;
    }


    public Integer getId() {
        return this.id;
    }

    public Three getThree() {
        return this.three;
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

    public List<Five> getFives() {
        return this.fives;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setThree(Three three) {
        this.three = three;
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

    public void setFives(List<Five> fives) {
        this.fives = fives;
    }

    public boolean equals(final Object o) {
        if (o == this) return true;
        if (!(o instanceof Four)) return false;
        final Four other = (Four) o;
        if (!other.canEqual((Object) this)) return false;
        final Object this$id = this.getId();
        final Object other$id = other.getId();
        if (this$id == null ? other$id != null : !this$id.equals(other$id)) return false;
        final Object this$three = this.getThree();
        final Object other$three = other.getThree();
        if (this$three == null ? other$three != null : !this$three.equals(other$three)) return false;
        final Object this$title = this.getTitle();
        final Object other$title = other.getTitle();
        if (this$title == null ? other$title != null : !this$title.equals(other$title)) return false;
        final Object this$created = this.getCreated();
        final Object other$created = other.getCreated();
        if (this$created == null ? other$created != null : !this$created.equals(other$created)) return false;
        final Object this$modified = this.getModified();
        final Object other$modified = other.getModified();
        if (this$modified == null ? other$modified != null : !this$modified.equals(other$modified)) return false;
        final Object this$fives = this.getFives();
        final Object other$fives = other.getFives();
        if (this$fives == null ? other$fives != null : !this$fives.equals(other$fives)) return false;
        return true;
    }

    protected boolean canEqual(final Object other) {
        return other instanceof Four;
    }

    public int hashCode() {
        final int PRIME = 59;
        int result = 1;
        final Object $id = this.getId();
        result = result * PRIME + ($id == null ? 43 : $id.hashCode());
        final Object $three = this.getThree();
        result = result * PRIME + ($three == null ? 43 : $three.hashCode());
        final Object $title = this.getTitle();
        result = result * PRIME + ($title == null ? 43 : $title.hashCode());
        final Object $created = this.getCreated();
        result = result * PRIME + ($created == null ? 43 : $created.hashCode());
        final Object $modified = this.getModified();
        result = result * PRIME + ($modified == null ? 43 : $modified.hashCode());
        final Object $fives = this.getFives();
        result = result * PRIME + ($fives == null ? 43 : $fives.hashCode());
        return result;
    }

    public String toString() {
        return "Four(id=" + this.getId() + ", three=" + this.getThree() + ", title=" + this.getTitle() + ", created=" + this.getCreated() + ", modified=" + this.getModified() + ", fives=" + this.getFives().toString() + ")";
    }
}
