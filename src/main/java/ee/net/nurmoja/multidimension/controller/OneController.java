package ee.net.nurmoja.multidimension.controller;

import ee.net.nurmoja.multidimension.model.*;
import ee.net.nurmoja.multidimension.repository.*;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

//import org.apache.openjpa.persistence.meta.Types.Entity;
//import javax.ws.rs.client.Entity;

@RestController
@RequestMapping("/data/api")
class OneController {


    private final OneRepository oneRepository;
    private final TwoRepository twoRepository;
    private final ThreeRepository threeRepository;
    private final FourRepository fourRepository;
    private final FiveRepository fiveRepository;

    OneController(
            OneRepository oneRepository,
            TwoRepository twoRepository,
            ThreeRepository threeRepository,
            FourRepository fourRepository,
            FiveRepository fiveRepository) {
        this.oneRepository = oneRepository;
        this.twoRepository = twoRepository;
        this.threeRepository = threeRepository;
        this.fourRepository = fourRepository;
        this.fiveRepository = fiveRepository;
    }


    @PostMapping("/ones/add")
    String saveOne(@RequestBody One one) {
        One saved = oneRepository.save(one);
        List<String> result = new ArrayList<>();

        if (one.getTwos() != null) {
            one.getTwos().forEach(two -> {
                two.setOne(saved);
                result.add(saveTwo(two));
            });
        }
        return saved.getTitle() + ": " + String.join("*", result);

    }

    @PostMapping("/twos/add")
    String newTwo(@RequestBody Two newTwo) {
        if (newTwo.getOne() != null) {
            One one = oneRepository.save(newTwo.getOne());
            newTwo.setOne(one);
        }
        return saveTwo(newTwo);
    }

    String saveTwo(@RequestBody Two two) {

        Two saved = twoRepository.save(two);
        List<String> result = new ArrayList<>();

        if (two.getThrees() != null) {
            result.add("* " + saved.getTitle() + "\n");
            two.getThrees().forEach(three -> {
                three.setTwo(two);
                result.add(saveThree(three));
            });
        }

        return saved.getTitle() + ": " + String.join("*", result);

    }

    @PostMapping("/threes/add")
    String newThree(@RequestBody Three newThree) {
        if (newThree.getTwo() != null) {
            Two two = twoRepository.save(newThree.getTwo());
            newThree.setTwo(two);
        }
        return saveThree(newThree);
    }

    String saveThree(@RequestBody Three three) {
        if (three.getTwo() != null) {
            Two two = twoRepository.save(three.getTwo());
            three.setTwo(two);
        }
        Three saved = threeRepository.save(three);
        List<String> result = new ArrayList<>();
        result.add("* " + saved.getTitle() + "\n");


        if (saved.getFours() != null) {
            three.getFours().forEach(four -> {
                four.setThree(saved);
                result.add(saveFour(four));
            });
        }

        return saved.getTitle() + ": " + String.join("*", result);
    }

    @PostMapping("/fours/add")
    String newFour(@RequestBody Four newFour) {
        if (newFour.getThree() != null) {
            Three three = threeRepository.save(newFour.getThree());
            newFour.setThree(three);
        }
        // return saveFour(newFour);
        return saveFour(newFour);
    }

    String saveFour(@RequestBody Four four) {
        // TODO Auto-generated method stub
        Four saved = fourRepository.save(four);
        List<String> result = new ArrayList<>();
        result.add("* " + saved.getTitle() + "\n");

        if (four.getFives() != null) {
            four.getFives().forEach(five -> {
                five.setFour(saved);
                five.setTitle(five.getTitle());
                result.add(saveFive(five));
            });
        }

        return saved.getTitle() + ": " + String.join("*", result);

    }

    @PostMapping("/fives/add")
    String newFive(@RequestBody Five newFive) {
        if (newFive.getFour() != null) {
            Four four = fourRepository.save(newFive.getFour());
            newFive.setFour(four);
        }
        return saveFive(newFive);
    }

    String saveFive(@RequestBody Five five) {
        // TODO Auto-generated method stub
        Five saved = fiveRepository.save(five);

        return saved.getTitle();
    }


    /*
     * @PostMapping("/test/{first}/new") <T> String newT(@PathVariable("first")
     * String first, @RequestBody T t) throws IllegalArgumentException,
     * IllegalAccessException { Annotation annotation; annotation =
     * t.getClass().getAnnotation(Table.class); if (annotation instanceof Table &&
     * ((Table) annotation).name() == first) { return saveT(t.getClass()); } return
     * first; }
     *
     * <T, S> String saveT(@RequestBody T t) throws IllegalArgumentException,
     * IllegalAccessException { // TODO Auto-generated method stub Class<?> savedT =
     * tRep.save((S) t); List<String> result = new ArrayList<>();
     *
     * Annotation annotation; Field[] f = savedT.getClass().getDeclaredFields(); for
     * (Field field : f) { Class<?> targetType = field.getType(); annotation =
     * field.getAnnotation(JoinColumn.class); if (annotation instanceof JoinColumn)
     * { JoinColumn mto = (JoinColumn) annotation; Class<?> target = mto.getClass();
     *
     * if (field.get(target) != null) { Object savedParent =
     * tRep.save(field.get(target)); field.set(savedParent, target); } }
     *
     * annotation = field.getAnnotation(Column.class); if (annotation instanceof
     * Column) { Column col = (Column) annotation; Class<?> colCls = col.getClass();
     * Object colValue = field.get(colCls); result.add(colValue.toString()); }
     * List<?> list = new ArrayList<>(); list.forEach(entity -> { Object e =
     * field.getDeclaredAnnotation(OneToMany.class).targetEntity(); if (e instanceof
     * OneToMany) { OneToMany otm = (OneToMany) e;
     *
     * if (otm.targetEntity() != null) { Field[] childFields =
     * otm.targetEntity().getFields(); for (Field childField : childFields) { try {
     * childField.set(savedT, otm.targetEntity()); } catch (IllegalArgumentException
     * | IllegalAccessException e1) { // TODO Auto-generated catch block
     * e1.printStackTrace(); }
     *
     * } } } });
     *
     * }
     *
     * return String.join("", result); }
     *
     */

    @PatchMapping("/one/{id}")
    public One replaceOne(@RequestBody One newOne, @PathVariable Integer id) {

        return oneRepository.findById(id).map(oneWork -> {
            return oneRepository.save(newOne);
        }).orElseGet(() -> {
            newOne.setId(id);
            return oneRepository.save(newOne);
        });
    }

    @PatchMapping("/four/{id}")
    public Four replaceFour(@RequestBody Four newFour, @PathVariable Integer id) {

        return fourRepository.findById(id).map(fourWork -> {
            return fourRepository.save(newFour);
        }).orElseGet(() -> {
            newFour.setId(id);
            return fourRepository.save(newFour);
        });
    }

}
