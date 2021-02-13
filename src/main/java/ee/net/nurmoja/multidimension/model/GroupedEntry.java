package ee.net.nurmoja.multidimension.model;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "grouped_entry")
@Data
public class GroupedEntry implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @JoinColumn(name = "main_id")
    @ManyToOne
    private MainData mainData;

    @Column(name = "url")
    private String url;

    @Column(name = "title")
    private String title;

    @Column(name = "image")
    private String image;

}
