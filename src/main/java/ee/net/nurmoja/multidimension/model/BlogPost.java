package ee.net.nurmoja.multidimension.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Table(name = "blog_post")
@Data
@NoArgsConstructor
@Entity
public class BlogPost {

    @GeneratedValue
    @Id
    private Long id;
    private String title;
    private String text;
    @Column(name = "created_at")
    private LocalDateTime createdAt;
    private String author;
    @OneToMany(mappedBy = "blogPost")
    private List<BlogPostSubPart> blogPostSubParts;

}
