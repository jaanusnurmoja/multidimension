package ee.net.nurmoja.multidimension.repository;

import ee.net.nurmoja.multidimension.model.Three;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface ThreeRepository extends JpaRepository<Three, Integer>, JpaSpecificationExecutor<Three> {

}
