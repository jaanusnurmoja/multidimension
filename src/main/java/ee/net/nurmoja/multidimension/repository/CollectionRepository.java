package ee.net.nurmoja.multidimension.repository;

import ee.net.nurmoja.multidimension.model.Collection;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface CollectionRepository extends JpaRepository<Collection, Integer>, JpaSpecificationExecutor<Collection> {

}
