package ee.net.nurmoja.multidimension.repository;

import ee.net.nurmoja.multidimension.model.Four;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface FourRepository extends JpaRepository<Four, Integer>, JpaSpecificationExecutor<Four> {

}
