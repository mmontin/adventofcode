package advent2023;

import adventutils.collection.Collection;
import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;
import com.google.common.base.Objects;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionExtensions;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day16 {
  private static final List<List<String>> chars = new InputLoader(Integer.valueOf(2023), Integer.valueOf(16)).getChars();

  private static final int max_x = (Day16.chars.size() - 1);

  private static final int max_y = (Day16.chars.get(0).size() - 1);

  private static final Map<Coordinate, String> walls = Collection.<Coordinate, String, Integer, Integer>aggregateToMap(new IntegerRange(0, Day16.max_x), ((Function2<Integer, Map<Coordinate, String>, Integer>) (Integer i, Map<Coordinate, String> walls_1) -> {
    int _xblockexpression = (int) 0;
    {
      final List<String> current_line = Day16.chars.get((i).intValue());
      final Consumer<Integer> _function = (Integer j) -> {
        boolean _equals = current_line.get((j).intValue()).equals(".");
        boolean _not = (!_equals);
        if (_not) {
          Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
          walls_1.put(_coordinate, current_line.get((j).intValue()));
        }
      };
      new IntegerRange(0, Day16.max_y).forEach(_function);
      _xblockexpression = 0;
    }
    return Integer.valueOf(_xblockexpression);
  }));

  private static final Set<Pair<Coordinate, Coordinate.Direction>> visited = CollectionLiterals.<Pair<Coordinate, Coordinate.Direction>>newHashSet();

  public static void main(final String[] args) {
    Coordinate _coordinate = new Coordinate(0, (-1));
    Pair<Coordinate, Coordinate.Direction> _mappedTo = Pair.<Coordinate, Coordinate.Direction>of(_coordinate, Coordinate.Direction.RIGHT);
    Day16.process(CollectionLiterals.<Pair<Coordinate, Coordinate.Direction>>newHashSet(_mappedTo));
    final Function1<Pair<Coordinate, Coordinate.Direction>, Coordinate> _function = (Pair<Coordinate, Coordinate.Direction> it) -> {
      return it.getKey();
    };
    InputOutput.<Integer>println(Integer.valueOf(IterableExtensions.<Coordinate>toSet(IterableExtensions.<Pair<Coordinate, Coordinate.Direction>, Coordinate>map(Day16.visited, _function)).size()));
    final HashSet<Pair<Coordinate, Coordinate.Direction>> initials = CollectionLiterals.<Pair<Coordinate, Coordinate.Direction>>newHashSet();
    final Consumer<Integer> _function_1 = (Integer it) -> {
      Coordinate _coordinate_1 = new Coordinate((it).intValue(), (-1));
      Pair<Coordinate, Coordinate.Direction> _mappedTo_1 = Pair.<Coordinate, Coordinate.Direction>of(_coordinate_1, Coordinate.Direction.RIGHT);
      initials.add(_mappedTo_1);
      Coordinate _coordinate_2 = new Coordinate((it).intValue(), (Day16.max_y + 1));
      Pair<Coordinate, Coordinate.Direction> _mappedTo_2 = Pair.<Coordinate, Coordinate.Direction>of(_coordinate_2, Coordinate.Direction.LEFT);
      initials.add(_mappedTo_2);
    };
    new IntegerRange(0, Day16.max_x).forEach(_function_1);
    final Consumer<Integer> _function_2 = (Integer it) -> {
      Coordinate _coordinate_1 = new Coordinate((-1), (it).intValue());
      Pair<Coordinate, Coordinate.Direction> _mappedTo_1 = Pair.<Coordinate, Coordinate.Direction>of(_coordinate_1, Coordinate.Direction.DOWN);
      initials.add(_mappedTo_1);
      Coordinate _coordinate_2 = new Coordinate((Day16.max_x + 1), (it).intValue());
      Pair<Coordinate, Coordinate.Direction> _mappedTo_2 = Pair.<Coordinate, Coordinate.Direction>of(_coordinate_2, Coordinate.Direction.UP);
      initials.add(_mappedTo_2);
    };
    new IntegerRange(0, Day16.max_y).forEach(_function_2);
    final Function1<Pair<Coordinate, Coordinate.Direction>, Integer> _function_3 = (Pair<Coordinate, Coordinate.Direction> it) -> {
      int _xblockexpression = (int) 0;
      {
        Day16.process(CollectionLiterals.<Pair<Coordinate, Coordinate.Direction>>newHashSet(it));
        final Function1<Pair<Coordinate, Coordinate.Direction>, Coordinate> _function_4 = (Pair<Coordinate, Coordinate.Direction> it_1) -> {
          return it_1.getKey();
        };
        final int ret = IterableExtensions.<Coordinate>toSet(IterableExtensions.<Pair<Coordinate, Coordinate.Direction>, Coordinate>map(Day16.visited, _function_4)).size();
        Day16.visited.clear();
        _xblockexpression = ret;
      }
      return Integer.valueOf(_xblockexpression);
    };
    InputOutput.<Integer>println(IterableExtensions.<Integer>max(IterableExtensions.<Pair<Coordinate, Coordinate.Direction>, Integer>map(initials, _function_3)));
  }

  public static void process(final Set<Pair<Coordinate, Coordinate.Direction>> current) {
    final Consumer<Pair<Coordinate, Coordinate.Direction>> _function = (Pair<Coordinate, Coordinate.Direction> it) -> {
      Day16.process(Day16.nextCoords(it));
    };
    current.forEach(_function);
  }

  public static HashSet<Pair<Coordinate, Coordinate.Direction>> nextCoords(final Pair<Coordinate, Coordinate.Direction> current) {
    HashSet<Pair<Coordinate, Coordinate.Direction>> _xblockexpression = null;
    {
      final HashSet<Pair<Coordinate, Coordinate.Direction>> output = CollectionLiterals.<Pair<Coordinate, Coordinate.Direction>>newHashSet();
      final Coordinate next = current.getKey().otherMove(current.getValue());
      if (((((next.getX() >= 0) && (next.getX() <= Day16.max_x)) && (next.getY() >= 0)) && (next.getY() <= Day16.max_y))) {
        String _get = Day16.walls.get(next);
        boolean _matched = false;
        if (Objects.equal(_get, null)) {
          _matched=true;
          Coordinate.Direction _value = current.getValue();
          Pair<Coordinate, Coordinate.Direction> _mappedTo = Pair.<Coordinate, Coordinate.Direction>of(next, _value);
          output.add(_mappedTo);
        }
        if (!_matched) {
          if (Objects.equal(_get, "/")) {
            _matched=true;
            Coordinate.Direction _switchResult_1 = null;
            Coordinate.Direction _value_1 = current.getValue();
            if (_value_1 != null) {
              switch (_value_1) {
                case UP:
                  _switchResult_1 = Coordinate.Direction.RIGHT;
                  break;
                case DOWN:
                  _switchResult_1 = Coordinate.Direction.LEFT;
                  break;
                case RIGHT:
                  _switchResult_1 = Coordinate.Direction.UP;
                  break;
                case LEFT:
                  _switchResult_1 = Coordinate.Direction.DOWN;
                  break;
                default:
                  break;
              }
            }
            Pair<Coordinate, Coordinate.Direction> _mappedTo_1 = Pair.<Coordinate, Coordinate.Direction>of(next, _switchResult_1);
            output.add(_mappedTo_1);
          }
        }
        if (!_matched) {
          if (Objects.equal(_get, "-")) {
            _matched=true;
            if ((Objects.equal(current.getValue(), Coordinate.Direction.LEFT) || Objects.equal(current.getValue(), Coordinate.Direction.RIGHT))) {
              Coordinate.Direction _value_2 = current.getValue();
              Pair<Coordinate, Coordinate.Direction> _mappedTo_2 = Pair.<Coordinate, Coordinate.Direction>of(next, _value_2);
              output.add(_mappedTo_2);
            } else {
              Pair<Coordinate, Coordinate.Direction> _mappedTo_3 = Pair.<Coordinate, Coordinate.Direction>of(next, Coordinate.Direction.LEFT);
              Pair<Coordinate, Coordinate.Direction> _mappedTo_4 = Pair.<Coordinate, Coordinate.Direction>of(next, Coordinate.Direction.RIGHT);
              CollectionExtensions.<Pair<Coordinate, Coordinate.Direction>>addAll(output, _mappedTo_3, _mappedTo_4);
            }
          }
        }
        if (!_matched) {
          if (Objects.equal(_get, "|")) {
            _matched=true;
            if ((Objects.equal(current.getValue(), Coordinate.Direction.UP) || Objects.equal(current.getValue(), Coordinate.Direction.DOWN))) {
              Coordinate.Direction _value_3 = current.getValue();
              Pair<Coordinate, Coordinate.Direction> _mappedTo_5 = Pair.<Coordinate, Coordinate.Direction>of(next, _value_3);
              output.add(_mappedTo_5);
            } else {
              Pair<Coordinate, Coordinate.Direction> _mappedTo_6 = Pair.<Coordinate, Coordinate.Direction>of(next, Coordinate.Direction.UP);
              Pair<Coordinate, Coordinate.Direction> _mappedTo_7 = Pair.<Coordinate, Coordinate.Direction>of(next, Coordinate.Direction.DOWN);
              CollectionExtensions.<Pair<Coordinate, Coordinate.Direction>>addAll(output, _mappedTo_6, _mappedTo_7);
            }
          }
        }
        if (!_matched) {
          if (Objects.equal(_get, "\\")) {
            _matched=true;
            Coordinate.Direction _switchResult_2 = null;
            Coordinate.Direction _value_4 = current.getValue();
            if (_value_4 != null) {
              switch (_value_4) {
                case UP:
                  _switchResult_2 = Coordinate.Direction.LEFT;
                  break;
                case DOWN:
                  _switchResult_2 = Coordinate.Direction.RIGHT;
                  break;
                case RIGHT:
                  _switchResult_2 = Coordinate.Direction.DOWN;
                  break;
                case LEFT:
                  _switchResult_2 = Coordinate.Direction.UP;
                  break;
                default:
                  break;
              }
            }
            Pair<Coordinate, Coordinate.Direction> _mappedTo_8 = Pair.<Coordinate, Coordinate.Direction>of(next, _switchResult_2);
            output.add(_mappedTo_8);
          }
        }
      }
      output.removeAll(Day16.visited);
      Day16.visited.addAll(output);
      _xblockexpression = output;
    }
    return _xblockexpression;
  }
}
