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
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id",unique=true, nullable = false)
    private Long id;

    @Column(name = "sub_title")
    private String subTitle;

    @Column(name = "image")
    private String image;

    @Column(name = "description")
    private String description;

    @Column(name = "order_by", nullable = false)
    private Long orderBy;

    @ManyToOne
    @JoinColumn (name = "blog_post_id")
    private BlogPost blogPost;

    @OneToMany(mappedBy = "blogPostSubPart")
    private List<BlogPostParagraph> blogPostParagraphs;

}
