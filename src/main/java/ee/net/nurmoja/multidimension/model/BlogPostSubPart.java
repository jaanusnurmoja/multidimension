package ee.net.nurmoja.multidimension.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Data
@NoArgsConstructor
@Entity
@Table(name = "blog_post_sub_part")
public class BlogPostSubPart implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue
    private Long id;

    @OneToOne(mappedBy = "blogPostSubPart")
    private BlogContentOrderBy blogContentOrderBy;

    @ManyToOne
    @JoinColumn(name = "blog_post_id" nullable = true)
    private BlogPost blogPost;

    private String subTitle;

    @OneToMany(mappedBy = "blogPostSubPart")
    private List<BlogPostParagraph> blogPostParagraphList;
}
