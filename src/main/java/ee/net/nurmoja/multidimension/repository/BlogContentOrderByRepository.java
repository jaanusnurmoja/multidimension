package ee.net.nurmoja.multidimension.repository;

import ee.net.nurmoja.multidimension.model.BlogContentOrderBy;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface BlogContentOrderByRepository extends JpaRepository<BlogContentOrderBy, Long>, JpaSpecificationExecutor<BlogContentOrderBy> {

}
