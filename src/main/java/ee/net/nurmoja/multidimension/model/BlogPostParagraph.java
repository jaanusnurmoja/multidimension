package ee.net.nurmoja.multidimension.model;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "blog_post_paragraph")
@Data
public class BlogPostParagraph implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "order_by")
    private Integer orderBy;

    @Column(name = "text")
    private String text;

    @ManyToOne
    @JoinColumn(name = "blog_post_sub_part_id")
    private BlogPostSubPart blogPostSubPart;

    @ManyToOne
    @JoinColumn(name = "blog_post_id")
    private BlogPost blogPost;

    @OneToOne
    @JoinColumn(name = "blog_content_order_by_id")
    private BlogContentOrderBy blogContentOrderBy;

}
