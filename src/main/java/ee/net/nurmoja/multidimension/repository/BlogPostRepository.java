package ee.net.nurmoja.multidimension.repository;

import ee.net.nurmoja.multidimension.model.BlogPost;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BlogPostRepository extends JpaRepository<BlogPost, Long> {
}
