package ee.net.nurmoja.multidimension.model;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "blog_content_order_by")
@Data
public class BlogContentOrderBy implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "order_by", nullable = false)
    private Integer orderBy;

    @OneToOne
    @JoinColumn(name = "blogPostParagraph_id")
    private BlogPostParagraph blogPostParagraph;

    @OneToOne
    @JoinColumn(name = "blogPostSubPart_id")
    private BlogPostSubPart blogPostSubPart;

}
