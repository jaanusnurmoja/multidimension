package ee.net.nurmoja.multidimension.repository;

import ee.net.nurmoja.multidimension.model.Experimental;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface ExperimentalRepository extends JpaRepository<Experimental, Integer>, JpaSpecificationExecutor<Experimental> {

}
