package ee.net.nurmoja.multidimension.model;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Data
@Table(name = "experimental")
public class Experimental implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "status")
    private String status = "draft";

    @Column(name = "sort")
    private Integer sort;

    @Column(name = "owner")
    private Integer owner;

    @Column(name = "created_on")
    private Date createdOn;

    @Column(name = "modified_by")
    private Integer modifiedBy;

    @Column(name = "modified_on")
    private Date modifiedOn;

    @Column(name = "eesnimi")
    private String eesnimi;

    @Column(name = "perekonnanimi", nullable = false)
    private String perekonnanimi;

    @Column(name = "syndinud", nullable = false)
    private Date syndinud;

    @Column(name = "surnud")
    private Date surnud;

    @Column(name = "elus")
    private Integer elus;

    @Column(name = "five_id")
    private Integer fiveId;

}
