package ee.net.nurmoja.multidimension.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.lang.Nullable;

import javax.persistence.*;
import java.io.Serializable;

@Data
@NoArgsConstructor
@Entity
@Table(name = "blog_post_paragraph")
public class BlogPostParagraph implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue
    private Long id;
    @ManyToOne
    @JoinColumn(name = "blog_post_id")
    BlogPost blogPost;
    @ManyToOne
    @JoinColumn(name = "blogPostSubPart_id")
    @Nullable
    private BlogPostSubPart blogPostSubPart;
    private String text;
    @OneToOne(mappedBy = "blogPostParagraph")
    private BlogContentOrderBy blogContentOrderBy;
}
