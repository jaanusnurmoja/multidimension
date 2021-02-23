package ee.net.nurmoja.multidimension.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class Helper {
    public static Long multiply(Iterable<Long> numbers) {
        Long total = 1L;
        for (Long x : numbers)
        {
            total *= x;
        }
        return total;
    }
    public static Integer multiply(Integer[] numbers) {
        int total = 1;
        for (int x : numbers)
        {
            total *= x;
        }
        return total;
    }
}
