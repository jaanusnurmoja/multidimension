package ee.net.nurmoja.multidimension.repository;

import ee.net.nurmoja.multidimension.model.Five;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface FiveRepository extends JpaRepository<Five, Integer>, JpaSpecificationExecutor<Five> {

}
