package ee.net.nurmoja.multidimension.model;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "items")
@Data
public class Item implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @JoinColumn(name = "collection_id")
    @ManyToOne
    private Collection collection;

    @Column(name = "title", nullable = false)
    private String title;

    @Column(name = "year")
    private Short year;

    @Column(name = "description", nullable = false)
    private String description;

    public Collection getParent(){
        return collection;
    }


    public Collection getCollections() {
        return collection;
    }

    public void setCollections(Collection collection) {
        this.collection = collection;
    }
}
