package ee.net.nurmoja.multidimension.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.time.LocalDateTime;

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

}
