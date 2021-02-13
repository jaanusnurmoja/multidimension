package ee.net.nurmoja.multidimension.repository;

import ee.net.nurmoja.multidimension.model.BlogPostSubPart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface BlogPostSubPartRepository extends JpaRepository<BlogPostSubPart, Integer>, JpaSpecificationExecutor<BlogPostSubPart> {
}
