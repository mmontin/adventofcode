package advent2017;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.function.BiFunction;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Day22 {
  public static void main(final String[] args) {
    final Function1<String, char[]> _function = new Function1<String, char[]>() {
      public char[] apply(final String it) {
        return it.toCharArray();
      }
    };
    final List<char[]> input = ListExtensions.<String, char[]>map(new InputLoader(Integer.valueOf(2017), Integer.valueOf(22)).getInputs(), _function);
    final HashSet<Coordinate> infected = CollectionLiterals.<Coordinate>newHashSet();
    final int size_x = input.size();
    final int size_y = ((List<Character>)Conversions.doWrapArray(input.get(0))).size();
    IntegerRange _upTo = new IntegerRange(0, (size_x - 1));
    for (final Integer i : _upTo) {
      IntegerRange _upTo_1 = new IntegerRange(0, (size_y - 1));
      for (final Integer j : _upTo_1) {
        boolean _equals = Character.valueOf((input.get((i).intValue())[(j).intValue()])).toString().equals("#");
        if (_equals) {
          Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
          infected.add(_coordinate);
        }
      }
    }
    Coordinate current_position = new Coordinate((size_x / 2), (size_y / 2));
    Coordinate.Direction current_direction = Coordinate.Direction.UP;
    int infections = 0;
    IntegerRange _upTo_2 = new IntegerRange(0, 9999);
    for (final Integer i_1 : _upTo_2) {
      {
        boolean _contains = infected.contains(current_position);
        if (_contains) {
          current_direction = Coordinate.clockWise(current_direction);
          infected.remove(current_position);
        } else {
          current_direction = Coordinate.counterClockWise(current_direction);
          infected.add(current_position);
          infections++;
        }
        current_position = current_position.otherMove(current_direction);
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(infections));
    final Map<Coordinate, Integer> nodes = CollectionLiterals.<Coordinate, Integer>newHashMap();
    IntegerRange _upTo_3 = new IntegerRange(0, (size_x - 1));
    for (final Integer i_2 : _upTo_3) {
      IntegerRange _upTo_4 = new IntegerRange(0, (size_y - 1));
      for (final Integer j_1 : _upTo_4) {
        boolean _equals_1 = Character.valueOf((input.get((i_2).intValue())[(j_1).intValue()])).toString().equals("#");
        if (_equals_1) {
          Coordinate _coordinate_1 = new Coordinate((i_2).intValue(), (j_1).intValue());
          nodes.put(_coordinate_1, Integer.valueOf(2));
        } else {
          Coordinate _coordinate_2 = new Coordinate((i_2).intValue(), (j_1).intValue());
          nodes.put(_coordinate_2, Integer.valueOf(0));
        }
      }
    }
    Coordinate _coordinate_3 = new Coordinate((size_x / 2), (size_y / 2));
    current_position = _coordinate_3;
    current_direction = Coordinate.Direction.UP;
    infections = 0;
    IntegerRange _upTo_5 = new IntegerRange(0, 9999999);
    for (final Integer i_3 : _upTo_5) {
      {
        final Integer current_state = nodes.getOrDefault(current_position, Integer.valueOf(0));
        Coordinate.Direction _switchResult = null;
        if (current_state != null) {
          switch (current_state) {
            case 0:
              _switchResult = Coordinate.counterClockWise(current_direction);
              break;
            case 1:
              _switchResult = current_direction;
              break;
            case 2:
              _switchResult = Coordinate.clockWise(current_direction);
              break;
            case 3:
              _switchResult = Coordinate.clockWise(Coordinate.clockWise(current_direction));
              break;
          }
        }
        current_direction = _switchResult;
        final BiFunction<Integer, Integer, Integer> _function_1 = new BiFunction<Integer, Integer, Integer>() {
          public Integer apply(final Integer x, final Integer y) {
            return Integer.valueOf((((x).intValue() + (y).intValue()) % 4));
          }
        };
        Integer _merge = nodes.merge(current_position, Integer.valueOf(1), _function_1);
        boolean _equals_2 = ((_merge).intValue() == 2);
        if (_equals_2) {
          infections++;
        }
        current_position = current_position.otherMove(current_direction);
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(infections));
  }
}
