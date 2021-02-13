package ee.net.nurmoja.multidimension.controller;

import ee.net.nurmoja.multidimension.model.*;
import ee.net.nurmoja.multidimension.repository.*;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping(value = "/api")
class MainDataController {
    private final MainDataRepository mainDataRepository;
    private final LocationRepository locationRepository;
    private final GroupedEntryRepository groupedEntryRepository;
    private final CollectionRepository collectionRepository;
    private final ItemRepository itemRepository;

    MainDataController(MainDataRepository mainDataRepository, LocationRepository locationRepository, GroupedEntryRepository groupedEntryRepository,
                       CollectionRepository collectionRepository, ItemRepository itemRepository) {
        this.mainDataRepository = mainDataRepository;
        this.locationRepository = locationRepository;
        this.groupedEntryRepository = groupedEntryRepository;
        this.collectionRepository = collectionRepository;
        this.itemRepository = itemRepository;
    }

    @PostMapping("/mainDatas/add")
    String newMainData(@RequestBody MainData newMainData) {

        MainData saved = mainDataRepository.save(newMainData);

        if (newMainData.getCollections() != null) {
            List<String> result = new ArrayList<>();
            newMainData.getCollections().forEach(coll -> {
                coll.setMainData(saved);
                result.add(saveCollection(coll));
            });
        }
        if (newMainData.getLocations() != null) {
            List<String> result = new ArrayList<>();
            newMainData.getLocations().forEach(oneLocation -> {
                oneLocation.setMainData(saved);
                result.add(saveLocation(oneLocation));
            });
        }

        if (newMainData.getGroupedEntries() != null) {
            List<String> result = new ArrayList<>();
            newMainData.getGroupedEntries().forEach(oneGrouped -> {
                oneGrouped.setMainData(saved);
                result.add(saveGroupedEntry(oneGrouped));
            });

        }

        return saved.getId().toString();
    }

    @PostMapping("/groupedEntries/add")
    String newGroupedEntry(@RequestBody GroupedEntry newGroupedEntry) {
        // TODO Auto-generated method stub
        if (newGroupedEntry.getMainData() != null) {
            MainData md = mainDataRepository.save(newGroupedEntry.getMainData());
            newGroupedEntry.setMainData(md);
        }

        return saveGroupedEntry(newGroupedEntry);
    }

    String saveGroupedEntry(@RequestBody GroupedEntry newGroupedEntry) {
        // TODO Auto-generated method stub
        GroupedEntry saved = groupedEntryRepository.save(newGroupedEntry);

        return saved.getTitle();
    }

    @PostMapping("/collections/add")
    String newCollection(@RequestBody Collection newCollection) {
        if (newCollection.getMainData() != null) {
            MainData md = mainDataRepository.save(newCollection.getMainData());
            newCollection.setMainData(md);
        }

        return saveCollection(newCollection);

    }

    String saveCollection(@RequestBody Collection newCollection) {

        List<String> result = new ArrayList<>();
        Collection saved = collectionRepository.save(newCollection);
        result.add(saved.getHeading());

        if (newCollection.getItems() != null) {
            newCollection.getItems().forEach(oneItem -> {
                oneItem.setCollection(saved);
                result.add(saveItem(oneItem));
            });
        }
        return String.join("\n", result);
    }

    @PostMapping("/locations/add")
    String newLocation(@RequestBody Location newLocation) {
        if (newLocation.getMainData() != null) {
            MainData md = mainDataRepository.save(newLocation.getMainData());
            newLocation.setMainData(md);
        }

        return saveLocation(newLocation);

    }

    String saveLocation(@RequestBody Location newLocation) {
        Location saved = locationRepository.save(newLocation);
        return saved.getName();
    }

    @PostMapping("/items/add")
    String newItem(@RequestBody Item newItem) {
        if (newItem.getCollection() != null) {
            Collection saved = collectionRepository.save(newItem.getCollection());
            newItem.setCollection(saved);
        }

        return saveItem(newItem);

    }

    String saveItem(@RequestBody Item item) {
        Item saved = itemRepository.save(item);

        return saved.getTitle();

    }

    @PatchMapping("/mainData/{id}")
    public MainData replaceMainData(@RequestBody MainData newMainData, @PathVariable Integer id) {

        return mainDataRepository.findById(id)
                .map(mainDataWork -> mainDataRepository.save(newMainData)).orElseGet(() -> {
                    newMainData.setId(id);
                    return mainDataRepository.save(newMainData);
                });
    }

}
