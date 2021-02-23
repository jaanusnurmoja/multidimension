package ee.net.nurmoja.multidimension.repository;

import ee.net.nurmoja.multidimension.model.BlogPostParagraph;
import ee.net.nurmoja.multidimension.model.BlogPostSubPart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface BlogPostParagraphRepository extends JpaRepository<BlogPostParagraph, Long>, JpaSpecificationExecutor<BlogPostParagraph> {

    List<BlogPostParagraph> getAllByBlogPostSubPartOrderByOrdering(BlogPostSubPart subPart);
}
