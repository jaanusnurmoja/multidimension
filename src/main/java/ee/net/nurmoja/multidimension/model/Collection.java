package ee.net.nurmoja.multidimension.model;

import lombok.Data;
import org.hibernate.internal.util.collections.JoinedIterable;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "collection")
@Data
public class Collection implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @ManyToOne
    @JoinColumn(name="main_id")
    private MainData mainData;

    @Column(name = "heading", nullable = false)
    private String heading;

    @OneToMany(mappedBy = "collection")
    private List<Item> items;

    public MainData getParent(){
        return mainData;
    }

    public List<List<?>> getChildren(Collection c) {
        List<List<?>> children = new ArrayList<>();
        children.add(this.getItems(c));
        return children;
    }

    public MainData getMainData() {
        return mainData;
    }

    public void setMainData(MainData mainData) {
        this.mainData = mainData;
    }


    public List<Item> getItems(Collection c) {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

}
