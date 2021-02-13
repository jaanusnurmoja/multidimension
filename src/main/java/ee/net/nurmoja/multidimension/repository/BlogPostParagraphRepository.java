package ee.net.nurmoja.multidimension.repository;

import ee.net.nurmoja.multidimension.model.BlogPostParagraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface BlogPostParagraphRepository extends JpaRepository<BlogPostParagraph, Integer>, JpaSpecificationExecutor<BlogPostParagraph> {
}
