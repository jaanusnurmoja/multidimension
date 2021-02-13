package ee.net.nurmoja.multidimension.repository;

import ee.net.nurmoja.multidimension.model.MainData;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface MainDataRepository extends JpaRepository<MainData, Integer>, JpaSpecificationExecutor<MainData> {

}
