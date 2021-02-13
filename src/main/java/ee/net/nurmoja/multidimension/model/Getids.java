package ee.net.nurmoja.multidimension.model;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "getids")
@Data
public class Getids implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue
    private Long id;

    @Column(name = "mainId")
    private String mainId;

    @Column(name = "main", nullable = false)
    private Long main;

    @Column(name = "locationId")
    private String locationId;

    @Column(name = "location", nullable = false)
    private Long location;

    @Column(name = "groupedId")
    private String groupedId;

    @Column(name = "grouped_entry", nullable = false)
    private Long groupedEntry;

    @Column(name = "collectionId")
    private String collectionId;

    @Column(name = "collection", nullable = false)
    private Long collection;

    @Column(name = "itemsId")
    private String itemsId;

    @Column(name = "items", nullable = false)
    private Long items;

    public void setId(Long id) {
        id = Long.parseLong(getMainId()
                .concat(getLocationId())
                .concat(getGroupedId())
                .concat(getCollectionId())
                .concat(getItemsId()));
        this.id = id;
    }

    public Long getId() {
        return id;
    }
}
