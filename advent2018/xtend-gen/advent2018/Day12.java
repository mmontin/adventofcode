package advent2018;

import adventutils.input.InputLoader;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day12 {
  private static final List<String> input = new InputLoader(Integer.valueOf(2018), Integer.valueOf(12)).getInputs();

  private static Set<Integer> current_state = IterableExtensions.<String, Pair<HashSet<Integer>, Integer>>fold(ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray((Day12.input.get(0).split("initial state: ")[1]).toCharArray())), ((Function1<Character, String>) (Character it) -> {
    return it.toString();
  })), Pair.<HashSet<Integer>, Integer>of(CollectionLiterals.<Integer>newHashSet(), Integer.valueOf(0)), ((Function2<Pair<HashSet<Integer>, Integer>, String, Pair<HashSet<Integer>, Integer>>) (Pair<HashSet<Integer>, Integer> acc, String v) -> {
    Pair<HashSet<Integer>, Integer> _xblockexpression = null;
    {
      boolean _equals = v.equals("#");
      if (_equals) {
        acc.getKey().add(acc.getValue());
      }
      HashSet<Integer> _key = acc.getKey();
      Integer _value = acc.getValue();
      int _plus = ((_value).intValue() + 1);
      _xblockexpression = Pair.<HashSet<Integer>, Integer>of(_key, Integer.valueOf(_plus));
    }
    return _xblockexpression;
  })).getKey();

  private static final Set<String> transformations = IterableExtensions.<String, HashSet<String>>fold(Day12.input.subList(2, Day12.input.size()), CollectionLiterals.<String>newHashSet(), ((Function2<HashSet<String>, String, HashSet<String>>) (HashSet<String> acc, String v) -> {
    HashSet<String> _xblockexpression = null;
    {
      final String[] split = v.split(" => ");
      boolean _equals = (split[1]).equals("#");
      if (_equals) {
        acc.add(split[0]);
      }
      _xblockexpression = acc;
    }
    return _xblockexpression;
  }));

  public static void main(final String[] args) {
    final Consumer<Integer> _function = (Integer it) -> {
      Day12.step();
    };
    new IntegerRange(0, 19).forEach(_function);
    final Function2<Integer, Integer, Integer> _function_1 = (Integer x, Integer y) -> {
      return Integer.valueOf(((x).intValue() + (y).intValue()));
    };
    InputOutput.<Integer>println(IterableExtensions.<Integer>reduce(Day12.current_state, _function_1));
    String previous_value = Day12.stringValue();
    Day12.step();
    String current_value = Day12.stringValue();
    int i = 21;
    while ((!current_value.equals(previous_value))) {
      {
        Day12.step();
        previous_value = current_value;
        current_value = Day12.stringValue();
        i++;
      }
    }
    Integer i_min = IterableExtensions.<Integer>min(Day12.current_state);
    Day12.step();
    Integer next_min = IterableExtensions.<Integer>min(Day12.current_state);
    int diff = ((next_min).intValue() - (i_min).intValue());
    final Function2<Integer, Integer, Integer> _function_2 = (Integer x, Integer y) -> {
      return Integer.valueOf(((x).intValue() + (y).intValue()));
    };
    Integer current_sum = IterableExtensions.<Integer>reduce(Day12.current_state, _function_2);
    int _size = Day12.current_state.size();
    long _multiply = ((diff * (50000000000L - (i + 1))) * _size);
    long _plus = (((long) (current_sum).intValue()) + _multiply);
    InputOutput.<Long>println(Long.valueOf(_plus));
  }

  public static Set<Integer> step() {
    Integer _min = IterableExtensions.<Integer>min(Day12.current_state);
    int _minus = ((_min).intValue() - 2);
    Integer _max = IterableExtensions.<Integer>max(Day12.current_state);
    int _plus = ((_max).intValue() + 2);
    final Function2<HashSet<Integer>, Integer, HashSet<Integer>> _function = (HashSet<Integer> acc, Integer v) -> {
      HashSet<Integer> _xblockexpression = null;
      {
        boolean _contains = Day12.transformations.contains(Day12.reconstruct((v).intValue()));
        if (_contains) {
          acc.add(v);
        }
        _xblockexpression = acc;
      }
      return _xblockexpression;
    };
    return Day12.current_state = IterableExtensions.<Integer, HashSet<Integer>>fold(new IntegerRange(_minus, _plus), CollectionLiterals.<Integer>newHashSet(), _function);
  }

  public static String reconstruct(final int i) {
    final Function2<String, Integer, String> _function = (String acc, Integer k) -> {
      String _xifexpression = null;
      boolean _contains = Day12.current_state.contains(k);
      if (_contains) {
        _xifexpression = "#";
      } else {
        _xifexpression = ".";
      }
      return (acc + _xifexpression);
    };
    return IterableExtensions.<Integer, String>fold(new IntegerRange((i - 2), (i + 2)), "", _function);
  }

  public static String stringValue() {
    Integer _min = IterableExtensions.<Integer>min(Day12.current_state);
    Integer _max = IterableExtensions.<Integer>max(Day12.current_state);
    final Function2<String, Integer, String> _function = (String acc, Integer v) -> {
      String _xifexpression = null;
      boolean _contains = Day12.current_state.contains(v);
      if (_contains) {
        _xifexpression = "#";
      } else {
        _xifexpression = ".";
      }
      return (acc + _xifexpression);
    };
    return IterableExtensions.<Integer, String>fold(new IntegerRange((_min).intValue(), (_max).intValue()), "", _function);
  }
}
