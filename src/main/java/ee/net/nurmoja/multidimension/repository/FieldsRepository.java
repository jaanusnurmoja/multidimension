package ee.net.nurmoja.multidimension.repository;

import ee.net.nurmoja.multidimension.model.Fields;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface FieldsRepository extends JpaRepository<Fields, Integer>, JpaSpecificationExecutor<Fields> {

}
