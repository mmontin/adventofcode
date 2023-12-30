package advent2023;

import adventutils.Arithmetics;
import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day8 {
  private static Map<String, Pair<String, String>> locations = CollectionLiterals.<String, Pair<String, String>>newHashMap();

  public static void main(final String[] args) {
    final List<String> inputs = new InputLoader(Integer.valueOf(2023), Integer.valueOf(8)).getInputs();
    final Function1<Character, String> _function = (Character it) -> {
      return (it + "");
    };
    final List<String> directions = ListExtensions.<Character, String>map(IterableExtensions.<Character>toList(((Iterable<Character>)Conversions.doWrapArray(inputs.remove(0).toCharArray()))), _function);
    inputs.remove(0);
    final Consumer<String> _function_1 = (String it) -> {
      final String[] split1 = it.split(" = ");
      final String[] split2 = (split1[1]).substring(1, 9).split(", ");
      String _get = split2[0];
      String _get_1 = split2[1];
      Pair<String, String> _mappedTo = Pair.<String, String>of(_get, _get_1);
      Day8.locations.put(split1[0], _mappedTo);
    };
    inputs.forEach(_function_1);
    int i = 0;
    String current = "AAA";
    while ((!current.equals("ZZZ"))) {
      {
        int _size = directions.size();
        int _modulo = (i % _size);
        final String next_direction = directions.get(_modulo);
        current = Day8.nextLocation(current, next_direction);
        i++;
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(i));
    final Function1<String, Boolean> _function_2 = (String it) -> {
      return Boolean.valueOf(it.endsWith("A"));
    };
    final Function1<String, Pair<ArrayList<Pair<String, Integer>>, Pair<String, Integer>>> _function_3 = (String it) -> {
      Pair<ArrayList<Pair<String, Integer>>, Pair<String, Integer>> _xblockexpression = null;
      {
        final ArrayList<Pair<String, Integer>> states = CollectionLiterals.<Pair<String, Integer>>newArrayList();
        Pair<String, Integer> current_state = Pair.<String, Integer>of(it, Integer.valueOf(0));
        while ((!states.contains(current_state))) {
          {
            states.add(current_state);
            Integer pos = current_state.getValue();
            String current_location = current_state.getKey();
            String _nextLocation = Day8.nextLocation(current_location, directions.get((pos).intValue()));
            int _size = directions.size();
            int _modulo = (((pos).intValue() + 1) % _size);
            Pair<String, Integer> _mappedTo = Pair.<String, Integer>of(_nextLocation, Integer.valueOf(_modulo));
            current_state = _mappedTo;
          }
        }
        _xblockexpression = Pair.<ArrayList<Pair<String, Integer>>, Pair<String, Integer>>of(states, current_state);
      }
      return _xblockexpression;
    };
    final Iterable<Pair<ArrayList<Pair<String, Integer>>, Pair<String, Integer>>> data = IterableExtensions.<String, Pair<ArrayList<Pair<String, Integer>>, Pair<String, Integer>>>map(IterableExtensions.<String>filter(Day8.locations.keySet(), _function_2), _function_3);
    final Function1<Pair<ArrayList<Pair<String, Integer>>, Pair<String, Integer>>, Integer> _function_4 = (Pair<ArrayList<Pair<String, Integer>>, Pair<String, Integer>> it) -> {
      int _size = it.getKey().size();
      Integer _value = it.getValue().getValue();
      return Integer.valueOf((_size - (_value).intValue()));
    };
    final Function2<Long, Integer, Long> _function_5 = (Long acc, Integer el) -> {
      return Long.valueOf(Arithmetics.lcm((acc).longValue(), (el).intValue()));
    };
    InputOutput.<Long>println(IterableExtensions.<Integer, Long>fold(IterableExtensions.<Pair<ArrayList<Pair<String, Integer>>, Pair<String, Integer>>, Integer>map(data, _function_4), Long.valueOf(1L), _function_5));
  }

  public static String nextLocation(final String current, final String direction) {
    String _xblockexpression = null;
    {
      final Pair<String, String> current_pair = Day8.locations.get(current);
      String _xifexpression = null;
      boolean _equals = direction.equals("R");
      if (_equals) {
        _xifexpression = current_pair.getValue();
      } else {
        _xifexpression = current_pair.getKey();
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }
}
