package ee.net.nurmoja.multidimension.model;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "three")
@Data
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

}
