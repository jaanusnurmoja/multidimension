package ee.net.nurmoja.multidimension.repository;

import ee.net.nurmoja.multidimension.model.One;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface OneRepository extends JpaRepository<One, Integer>, JpaSpecificationExecutor<One> {

}
