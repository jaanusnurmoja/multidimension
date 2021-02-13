package ee.net.nurmoja.multidimension.model;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Data
@Table(name = "fields")
public class Fields implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "tables_id", nullable = false)
    private Integer tablesId;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "showInTable", nullable = false)
    private Integer showInTable;

    @Column(name = "showInForm", nullable = false)
    private Integer showInForm;

    @Column(name = "showInDetails", nullable = false)
    private Integer showInDetails;

    @Column(name = "lookupTable")
    private String lookupTable;

    @Column(name = "lookupKey")
    private String lookupKey;

    @Column(name = "lookupDisplay")
    private String lookupDisplay;

    @Column(name = "formDisplay", nullable = false)
    private String formDisplay;

}
