package ee.net.nurmoja.multidimension.model;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Data
@Table(name = "blog_post_sub_part")
public class BlogPostSubPart implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "sub_title")
    private String subTitle;

    @Column(name = "image", nullable = false)
    private String image;

    @Column(name = "description", nullable = false)
    private String description;

    @ManyToOne
    @JoinColumn (name = "blog_post_id")
    private BlogPost blogPost;

    @OneToOne
    @JoinColumn(name = "blog_content_order_by_id", nullable = false)
    private BlogContentOrderBy blogContentOrderBy;

    @OneToMany(mappedBy = "blogPostSubPart")
    private List<BlogPostParagraph> blogPostParagraphs;

}
