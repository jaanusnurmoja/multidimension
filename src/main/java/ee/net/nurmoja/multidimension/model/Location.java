package ee.net.nurmoja.multidimension.model;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "location")
@Data
public class Location implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "name", nullable = false)
    private String name;

    @JoinColumn(name = "main_id")
    @ManyToOne
    private MainData mainData;

    public MainData getParent(){
        return mainData;
    }

}
