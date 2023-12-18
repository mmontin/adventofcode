package advent2017;

import adventutils.geometry.Coordinate;
import adventutils.geometry.Direction;
import adventutils.input.InputLoader;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day19 {
  private static final Map<Coordinate, String> routes = CollectionLiterals.<Coordinate, String>newHashMap();

  private static final List<String> visited = CollectionLiterals.<String>newArrayList();

  private static Coordinate previous_location;

  private static Coordinate current_location;

  private static Direction current_direction;

  public static void main(final String[] args) {
    final Function1<String, List<String>> _function = new Function1<String, List<String>>() {
      public List<String> apply(final String it) {
        final Function1<Character, String> _function = new Function1<Character, String>() {
          public String apply(final Character it_1) {
            return it_1.toString();
          }
        };
        return ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray(it.toCharArray())), _function);
      }
    };
    final List<List<String>> input = ListExtensions.<String, List<String>>map(new InputLoader(Integer.valueOf(2017), Integer.valueOf(19)).getInputs(), _function);
    int _size = input.size();
    final Consumer<Integer> _function_1 = new Consumer<Integer>() {
      public void accept(final Integer i) {
        final List<String> current_line = input.get((i).intValue());
        int _size = current_line.size();
        final Consumer<Integer> _function = new Consumer<Integer>() {
          public void accept(final Integer j) {
            boolean _equals = current_line.get((j).intValue()).equals(" ");
            boolean _not = (!_equals);
            if (_not) {
              Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
              Day19.routes.put(_coordinate, current_line.get((j).intValue()));
            }
          }
        };
        new ExclusiveRange(0, _size, true).forEach(_function);
      }
    };
    new ExclusiveRange(0, _size, true).forEach(_function_1);
    Day19.previous_location = null;
    final Function1<Coordinate, Integer> _function_2 = new Function1<Coordinate, Integer>() {
      public Integer apply(final Coordinate it) {
        return Integer.valueOf(it.getX());
      }
    };
    Day19.current_location = IterableExtensions.<Coordinate, Integer>minBy(Day19.routes.keySet(), _function_2);
    Day19.current_direction = Direction.DOWN;
    while ((Day19.current_location != null)) {
      {
        Day19.visited.add(Day19.routes.get(Day19.current_location));
        final Coordinate next_step = Day19.current_location.otherMove(Day19.current_direction);
        boolean _contains = Day19.routes.keySet().contains(next_step);
        if (_contains) {
          Day19.previous_location = Day19.current_location;
          Day19.current_location = next_step;
        } else {
          final Function1<Pair<Coordinate, Direction>, Boolean> _function_3 = new Function1<Pair<Coordinate, Direction>, Boolean>() {
            public Boolean apply(final Pair<Coordinate, Direction> it) {
              return Boolean.valueOf((Day19.routes.keySet().contains(it.getKey()) && (!it.getKey().equals(Day19.previous_location))));
            }
          };
          final Pair<Coordinate, Direction> next = IterableExtensions.<Pair<Coordinate, Direction>>head(IterableExtensions.<Pair<Coordinate, Direction>>filter(Day19.current_location.noDiagonalUnboundedNeighboursWithDirection(), _function_3));
          Day19.previous_location = Day19.current_location;
          Coordinate _xifexpression = null;
          if ((next == null)) {
            _xifexpression = null;
          } else {
            _xifexpression = next.getKey();
          }
          Day19.current_location = _xifexpression;
          Direction _xifexpression_1 = null;
          if ((next == null)) {
            _xifexpression_1 = null;
          } else {
            _xifexpression_1 = next.getValue();
          }
          Day19.current_direction = _xifexpression_1;
        }
      }
    }
    final Function1<String, Boolean> _function_3 = new Function1<String, Boolean>() {
      public Boolean apply(final String it) {
        return Boolean.valueOf((((!it.equals("|")) && (!it.equals("+"))) && (!it.equals("-"))));
      }
    };
    InputOutput.<String>println(IterableExtensions.join(IterableExtensions.<String>filter(Day19.visited, _function_3), ""));
    InputOutput.<Integer>println(Integer.valueOf(Day19.visited.size()));
  }
}
