package ee.net.nurmoja.multidimension.model;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Data
@Entity
@Table(name = "blog_post")
public class BlogPost {
    private static final long serialVersionUID = 1L;

    @GeneratedValue
    @Id
    private Long id;
    private String title;
    private String text;
    private LocalDateTime createdAt;
    @Value("${thisapp.author}")
    private String author;
    @OneToMany(mappedBy = "blogPost")
    private List<BlogContentOrderBy> blogContentOrderByList;
}
