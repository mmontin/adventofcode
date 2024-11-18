package advent2021.puzzle11;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Launcher {
  private static HashMap<Coordinate, Integer> data = CollectionLiterals.<Coordinate, Integer>newHashMap();

  private static int number_of_occurrences = 0;

  private static int number_of_flashes = 0;

  public static void main(final String[] args) {
    final List<String> input = new InputLoader(Integer.valueOf(2021), Integer.valueOf(11)).getInputs();
    final Consumer<Integer> _function = (Integer i) -> {
      final String line = input.get((i).intValue());
      final Consumer<Integer> _function_1 = (Integer j) -> {
        Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
        char _charAt = line.charAt((j).intValue());
        String _plus = (Character.valueOf(_charAt) + "");
        Launcher.data.put(_coordinate, Integer.valueOf(Integer.parseInt(_plus)));
      };
      new ExclusiveRange(0, 10, true).forEach(_function_1);
    };
    new ExclusiveRange(0, 10, true).forEach(_function);
    while ((!IterableExtensions.<Integer>toSet(Launcher.data.values()).equals(CollectionLiterals.<Integer>newHashSet(Integer.valueOf(0))))) {
      {
        final Consumer<Map.Entry<Coordinate, Integer>> _function_1 = (Map.Entry<Coordinate, Integer> it) -> {
          Coordinate _key = it.getKey();
          Integer _value = it.getValue();
          int _plus = ((_value).intValue() + 1);
          Launcher.data.replace(_key, Integer.valueOf(_plus));
        };
        Launcher.data.entrySet().forEach(_function_1);
        Coordinate c = null;
        while (((c = IterableExtensions.<Coordinate>findFirst(Launcher.data.keySet(), ((Function1<Coordinate, Boolean>) (Coordinate it) -> {
          Integer _get = Launcher.data.get(it);
          return Boolean.valueOf(((_get).intValue() >= 10));
        }))) != null)) {
          {
            if ((Launcher.number_of_occurrences < 100)) {
              Launcher.number_of_flashes++;
            }
            Launcher.data.replace(c, Integer.valueOf(0));
            final Function1<Coordinate, Boolean> _function_2 = (Coordinate it) -> {
              return Boolean.valueOf((Launcher.data.containsKey(it) && ((Launcher.data.get(it)).intValue() != 0)));
            };
            final Consumer<Coordinate> _function_3 = (Coordinate it) -> {
              Integer _get = Launcher.data.get(it);
              int _plus = ((_get).intValue() + 1);
              Launcher.data.replace(it, Integer.valueOf(_plus));
            };
            IterableExtensions.<Coordinate>filter(c.allAroundUnboundedNeighbours(), _function_2).forEach(_function_3);
          }
        }
        Launcher.number_of_occurrences++;
      }
    }
    InputOutput.<String>println(("Exercise 1: " + Integer.valueOf(Launcher.number_of_flashes)));
    InputOutput.<String>println(("Exercise 2: " + Integer.valueOf(Launcher.number_of_occurrences)));
  }
}
