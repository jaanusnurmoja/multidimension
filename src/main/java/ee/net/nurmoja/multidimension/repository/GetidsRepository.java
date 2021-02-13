package ee.net.nurmoja.multidimension.repository;

import ee.net.nurmoja.multidimension.model.Getids;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface GetidsRepository extends JpaRepository<Getids, Void>, JpaSpecificationExecutor<Getids> {

}
