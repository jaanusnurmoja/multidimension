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
    @Basic(optional = false)
    @Column(name = "id",unique=true, nullable = false)
    private Long id;

    @Column(name = "ordering")
    private Integer ordering;

    @Column(name = "text")
    private String text;

    @ManyToOne
    @JoinColumn(name = "blog_post_sub_part_id")
    private BlogPostSubPart blogPostSubPart;

/*
    @ManyToOne
    @JoinColumn(name = "blog_post_id")
    private BlogPost blogPost;
*/
    private Long blogPostId;

}
