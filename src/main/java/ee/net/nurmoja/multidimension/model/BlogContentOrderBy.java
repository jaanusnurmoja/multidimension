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

    @ManyToOne
    @JoinColumn(name = "blogPost_id", nullable = false)
    private BlogPost blogPost;

    @OneToOne(mappedBy = "blogContentOrderBy")
    private BlogPostParagraph blogPostParagraph;

    @OneToOne(mappedBy = "blogContentOrderBy")
    private BlogPostSubPart blogPostSubPart;

}
