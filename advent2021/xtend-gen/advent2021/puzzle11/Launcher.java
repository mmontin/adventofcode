package advent2021.puzzle11;

import advent2021.Utils;
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
  private static HashMap<Coordinates, Integer> data = CollectionLiterals.<Coordinates, Integer>newHashMap();
  
  private static int number_of_occurrences = 0;
  
  private static int number_of_flashes = 0;
  
  public static void main(final String[] args) {
    final List<String> input = Utils.getInputs(11);
    final Consumer<Integer> _function = new Consumer<Integer>() {
      public void accept(final Integer i) {
        final String line = input.get((i).intValue());
        final Consumer<Integer> _function = new Consumer<Integer>() {
          public void accept(final Integer j) {
            Coordinates _coordinates = new Coordinates((i).intValue(), (j).intValue());
            char _charAt = line.charAt((j).intValue());
            String _plus = (Character.valueOf(_charAt) + "");
            Launcher.data.put(_coordinates, Integer.valueOf(Integer.parseInt(_plus)));
          }
        };
        new ExclusiveRange(0, 10, true).forEach(_function);
      }
    };
    new ExclusiveRange(0, 10, true).forEach(_function);
    while ((!IterableExtensions.<Integer>toSet(Launcher.data.values()).equals(CollectionLiterals.<Integer>newHashSet(Integer.valueOf(0))))) {
      {
        final Consumer<Map.Entry<Coordinates, Integer>> _function_1 = new Consumer<Map.Entry<Coordinates, Integer>>() {
          public void accept(final Map.Entry<Coordinates, Integer> it) {
            Coordinates _key = it.getKey();
            Integer _value = it.getValue();
            int _plus = ((_value).intValue() + 1);
            Launcher.data.replace(_key, Integer.valueOf(_plus));
          }
        };
        Launcher.data.entrySet().forEach(_function_1);
        Coordinates c = null;
        while (((c = IterableExtensions.<Coordinates>findFirst(Launcher.data.keySet(), new Function1<Coordinates, Boolean>() {
          public Boolean apply(final Coordinates it) {
            Integer _get = Launcher.data.get(it);
            return Boolean.valueOf(((_get).intValue() >= 10));
          }
        })) != null)) {
          {
            if ((Launcher.number_of_occurrences < 100)) {
              Launcher.number_of_flashes++;
            }
            Launcher.data.replace(c, Integer.valueOf(0));
            final Function1<Coordinates, Boolean> _function_2 = new Function1<Coordinates, Boolean>() {
              public Boolean apply(final Coordinates it) {
                return Boolean.valueOf((Launcher.data.containsKey(it) && ((Launcher.data.get(it)).intValue() != 0)));
              }
            };
            final Consumer<Coordinates> _function_3 = new Consumer<Coordinates>() {
              public void accept(final Coordinates it) {
                Integer _get = Launcher.data.get(it);
                int _plus = ((_get).intValue() + 1);
                Launcher.data.replace(it, Integer.valueOf(_plus));
              }
            };
            IterableExtensions.<Coordinates>filter(c.neighbours(), _function_2).forEach(_function_3);
          }
        }
        Launcher.number_of_occurrences++;
      }
    }
    InputOutput.<String>println(("Exercice 1: " + Integer.valueOf(Launcher.number_of_flashes)));
    InputOutput.<String>println(("Exercice 2: " + Integer.valueOf(Launcher.number_of_occurrences)));
  }
}
