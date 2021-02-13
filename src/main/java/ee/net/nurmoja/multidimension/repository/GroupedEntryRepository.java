package ee.net.nurmoja.multidimension.repository;

import ee.net.nurmoja.multidimension.model.GroupedEntry;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface GroupedEntryRepository extends JpaRepository<GroupedEntry, Integer>, JpaSpecificationExecutor<GroupedEntry> {

}
