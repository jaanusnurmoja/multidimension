package ee.net.nurmoja.multidimension.service;

import java.util.Collection;

public class Helper {
    public static <E> Number multiply(Collection<E> numbers) {
        Integer total = 1;
        for (E x : numbers)
        {
            total *= (Integer) x;
        }
        return total;
    }

    public static <T> Integer multiply(T[] numbers) {
        int total = 1;
        for (T x : numbers)
        {
            total *= (int) x;
        }
        return total;
    }

}
