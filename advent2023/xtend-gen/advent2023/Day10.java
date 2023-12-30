package advent2023;

import adventutils.geometry.Coordinate;
import adventutils.geometry.Direction;
import adventutils.input.InputLoader;
import com.google.common.collect.Iterables;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Day10 {
  public static void main(final String[] args) {
    final HashMap<Coordinate, Iterable<Coordinate>> coordinates = CollectionLiterals.<Coordinate, Iterable<Coordinate>>newHashMap();
    final ArrayList<Coordinate> starting = CollectionLiterals.<Coordinate>newArrayList();
    final Function1<String, List<String>> _function = (String it) -> {
      final Function1<Character, String> _function_1 = (Character it_1) -> {
        return (it_1 + "");
      };
      return ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray(it.toCharArray())), _function_1);
    };
    final List<List<String>> lines = ListExtensions.<String, List<String>>map(new InputLoader(Integer.valueOf(2023), Integer.valueOf(10)).getInputs(), _function);
    int _size = lines.size();
    int _minus = (_size - 1);
    final Consumer<Integer> _function_1 = (Integer i) -> {
      int _size_1 = lines.get(0).size();
      int _minus_1 = (_size_1 - 1);
      final Consumer<Integer> _function_2 = (Integer j) -> {
        final Coordinate current = new Coordinate((i).intValue(), (j).intValue());
        String _get = lines.get((i).intValue()).get((j).intValue());
        if (_get != null) {
          switch (_get) {
            case "|":
              final Function1<Direction, Coordinate> _function_3 = (Direction it) -> {
                return current.otherMove(it);
              };
              coordinates.put(current, IterableExtensions.<Direction, Coordinate>map(CollectionLiterals.<Direction>newHashSet(Direction.UP, Direction.DOWN), _function_3));
              break;
            case "-":
              final Function1<Direction, Coordinate> _function_4 = (Direction it) -> {
                return current.otherMove(it);
              };
              coordinates.put(current, IterableExtensions.<Direction, Coordinate>map(CollectionLiterals.<Direction>newHashSet(Direction.LEFT, Direction.RIGHT), _function_4));
              break;
            case "7":
              final Function1<Direction, Coordinate> _function_5 = (Direction it) -> {
                return current.otherMove(it);
              };
              coordinates.put(current, IterableExtensions.<Direction, Coordinate>map(CollectionLiterals.<Direction>newHashSet(Direction.LEFT, Direction.DOWN), _function_5));
              break;
            case "J":
              final Function1<Direction, Coordinate> _function_6 = (Direction it) -> {
                return current.otherMove(it);
              };
              coordinates.put(current, IterableExtensions.<Direction, Coordinate>map(CollectionLiterals.<Direction>newHashSet(Direction.LEFT, Direction.UP), _function_6));
              break;
            case "F":
              final Function1<Direction, Coordinate> _function_7 = (Direction it) -> {
                return current.otherMove(it);
              };
              coordinates.put(current, IterableExtensions.<Direction, Coordinate>map(CollectionLiterals.<Direction>newHashSet(Direction.RIGHT, Direction.DOWN), _function_7));
              break;
            case "L":
              final Function1<Direction, Coordinate> _function_8 = (Direction it) -> {
                return current.otherMove(it);
              };
              coordinates.put(current, IterableExtensions.<Direction, Coordinate>map(CollectionLiterals.<Direction>newHashSet(Direction.UP, Direction.RIGHT), _function_8));
              break;
            case "S":
              starting.add(current);
              break;
            default:
              coordinates.put(current, CollectionLiterals.<Coordinate>newHashSet());
              break;
          }
        } else {
          coordinates.put(current, CollectionLiterals.<Coordinate>newHashSet());
        }
      };
      new IntegerRange(0, _minus_1).forEach(_function_2);
    };
    new IntegerRange(0, _minus).forEach(_function_1);
    final Coordinate start = starting.get(0);
    final Function1<Coordinate, Boolean> _function_2 = (Coordinate it) -> {
      return Boolean.valueOf(IterableExtensions.contains(coordinates.get(it), start));
    };
    coordinates.put(start, IterableExtensions.<Coordinate>filter(start.noDiagonalUnboundedNeighbours(), _function_2));
    Coordinate prev = start;
    Coordinate current = IterableExtensions.<Coordinate>head(coordinates.get(start));
    final ArrayList<Coordinate> path = CollectionLiterals.<Coordinate>newArrayList(prev);
    while ((!current.equals(start))) {
      {
        path.add(current);
        final Coordinate nprev = prev;
        prev = current;
        final Function1<Coordinate, Boolean> _function_3 = (Coordinate it) -> {
          boolean _equals = it.equals(nprev);
          return Boolean.valueOf((!_equals));
        };
        current = IterableExtensions.<Coordinate>findFirst(coordinates.get(current), _function_3);
      }
    }
    path.add(current);
    int _size_1 = path.size();
    int _divide = (_size_1 / 2);
    InputOutput.<Integer>println(Integer.valueOf(_divide));
    final Function1<Coordinate, Integer> _function_3 = (Coordinate it) -> {
      return Integer.valueOf(it.getX());
    };
    int _x = IterableExtensions.<Coordinate, Integer>maxBy(coordinates.keySet(), _function_3).getX();
    final int max = (_x * 2);
    int _size_2 = path.size();
    int _minus_1 = (_size_2 - 2);
    final Function2<HashSet<Coordinate>, Integer, HashSet<Coordinate>> _function_4 = (HashSet<Coordinate> acc, Integer el) -> {
      HashSet<Coordinate> _xblockexpression = null;
      {
        final Coordinate left = path.get((el).intValue()).scale(2);
        final Coordinate right = path.get(((el).intValue() + 1)).scale(2);
        int _x_1 = left.getX();
        int _x_2 = right.getX();
        int _plus = (_x_1 + _x_2);
        int _divide_1 = (_plus / 2);
        int _y = right.getY();
        int _y_1 = left.getY();
        int _plus_1 = (_y + _y_1);
        int _divide_2 = (_plus_1 / 2);
        final Coordinate middle = new Coordinate(_divide_1, _divide_2);
        acc.add(left);
        acc.add(middle);
        _xblockexpression = acc;
      }
      return _xblockexpression;
    };
    final HashSet<Coordinate> reached = IterableExtensions.<Integer, HashSet<Coordinate>>fold(new IntegerRange(0, _minus_1), CollectionLiterals.<Coordinate>newHashSet(), _function_4);
    Coordinate _coordinate = new Coordinate((-1), (-1));
    final HashSet<Coordinate> frontier = CollectionLiterals.<Coordinate>newHashSet(_coordinate);
    while ((!frontier.isEmpty())) {
      {
        final HashSet<Coordinate> tmp = new HashSet<Coordinate>(frontier);
        reached.addAll(frontier);
        frontier.clear();
        final Consumer<Coordinate> _function_5 = (Coordinate it) -> {
          final Function1<Coordinate, Boolean> _function_6 = (Coordinate it_1) -> {
            boolean _contains = reached.contains(it_1);
            return Boolean.valueOf((!_contains));
          };
          Iterables.<Coordinate>addAll(frontier, IterableExtensions.<Coordinate>filter(it.noDiagonalBoundedNeighbours((-2), (max + 2)), _function_6));
        };
        tmp.forEach(_function_5);
      }
    }
    final Function1<Coordinate, Coordinate> _function_5 = (Coordinate it) -> {
      return it.scale(2);
    };
    final Function1<Coordinate, Boolean> _function_6 = (Coordinate it) -> {
      boolean _contains = reached.contains(it);
      return Boolean.valueOf((!_contains));
    };
    InputOutput.<Integer>println(Integer.valueOf(IterableExtensions.size(IterableExtensions.<Coordinate>filter(IterableExtensions.<Coordinate, Coordinate>map(coordinates.keySet(), _function_5), _function_6))));
  }
}
