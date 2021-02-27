package ee.net.nurmoja.multidimension.repository;

import ee.net.nurmoja.multidimension.model.BlogPost;
import ee.net.nurmoja.multidimension.model.BlogPostSubPart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;
import java.util.Optional;

public interface BlogPostSubPartRepository extends JpaRepository<BlogPostSubPart, Long>, JpaSpecificationExecutor<BlogPostSubPart> {

    List<BlogPostSubPart> findAllByBlogPostIdOrderByOrderingAsc(Long id);
    BlogPostSubPart getByIdOrderByBlogPostParagraphsOrderingAsc(Long id);
}
