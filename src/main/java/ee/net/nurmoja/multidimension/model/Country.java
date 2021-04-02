package ee.net.nurmoja.multidimension.model;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Data
@Table(name = "country")
public class Country implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "country_id", nullable = false)
    private Integer countryId;

    @Column(name = "iso2")
    private String iso2;

    @Column(name = "short_name")
    private String shortName;

    @Column(name = "long_name")
    private String longName;

    @Column(name = "iso3")
    private String iso3;

    @Column(name = "numcode")
    private String numcode;

    @Column(name = "un_member")
    private String unMember;

    @Column(name = "calling_code")
    private String callingCode;

    @Column(name = "cctld")
    private String cctld;

}
