package ee.net.nurmoja.multidimension.model;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "two")
@Data
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

}
