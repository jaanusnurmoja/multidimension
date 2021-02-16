package ee.net.nurmoja.multidimension.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import java.time.LocalDateTime;
import java.util.List;

@Data
@NoArgsConstructor
@Entity
public class BlogPost {

    @GeneratedValue
    @Id
    private Long id;
    private String title;
    private String text;
    private LocalDateTime createdAt;
    private String author;
    @OneToMany(mappedBy = "blogPost")
    private List<BlogPostSubPart> blogPostSubParts;

}
