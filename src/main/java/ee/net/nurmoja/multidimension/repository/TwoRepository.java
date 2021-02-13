package ee.net.nurmoja.multidimension.repository;

import ee.net.nurmoja.multidimension.model.Two;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TwoRepository extends JpaRepository<Two, Integer>, JpaSpecificationExecutor<Two> {

}
