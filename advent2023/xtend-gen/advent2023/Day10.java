package advent2023;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
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
              final Function1<Coordinate.Direction, Coordinate> _function_3 = (Coordinate.Direction it) -> {
                return current.otherMove(it);
              };
              coordinates.put(current, IterableExtensions.<Coordinate.Direction, Coordinate>map(CollectionLiterals.<Coordinate.Direction>newHashSet(Coordinate.Direction.UP, Coordinate.Direction.DOWN), _function_3));
              break;
            case "-":
              final Function1<Coordinate.Direction, Coordinate> _function_4 = (Coordinate.Direction it) -> {
                return current.otherMove(it);
              };
              coordinates.put(current, IterableExtensions.<Coordinate.Direction, Coordinate>map(CollectionLiterals.<Coordinate.Direction>newHashSet(Coordinate.Direction.LEFT, Coordinate.Direction.RIGHT), _function_4));
              break;
            case "7":
              final Function1<Coordinate.Direction, Coordinate> _function_5 = (Coordinate.Direction it) -> {
                return current.otherMove(it);
              };
              coordinates.put(current, IterableExtensions.<Coordinate.Direction, Coordinate>map(CollectionLiterals.<Coordinate.Direction>newHashSet(Coordinate.Direction.LEFT, Coordinate.Direction.DOWN), _function_5));
              break;
            case "J":
              final Function1<Coordinate.Direction, Coordinate> _function_6 = (Coordinate.Direction it) -> {
                return current.otherMove(it);
              };
              coordinates.put(current, IterableExtensions.<Coordinate.Direction, Coordinate>map(CollectionLiterals.<Coordinate.Direction>newHashSet(Coordinate.Direction.LEFT, Coordinate.Direction.UP), _function_6));
              break;
            case "F":
              final Function1<Coordinate.Direction, Coordinate> _function_7 = (Coordinate.Direction it) -> {
                return current.otherMove(it);
              };
              coordinates.put(current, IterableExtensions.<Coordinate.Direction, Coordinate>map(CollectionLiterals.<Coordinate.Direction>newHashSet(Coordinate.Direction.RIGHT, Coordinate.Direction.DOWN), _function_7));
              break;
            case "L":
              final Function1<Coordinate.Direction, Coordinate> _function_8 = (Coordinate.Direction it) -> {
                return current.otherMove(it);
              };
              coordinates.put(current, IterableExtensions.<Coordinate.Direction, Coordinate>map(CollectionLiterals.<Coordinate.Direction>newHashSet(Coordinate.Direction.UP, Coordinate.Direction.RIGHT), _function_8));
              break;
            case "S":
              starting.add(current);
              break;
          }
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
    int length = 1;
    Coordinate prev = start;
    Coordinate current = IterableExtensions.<Coordinate>head(coordinates.get(start));
    while ((!current.equals(start))) {
      {
        final Coordinate nprev = prev;
        prev = current;
        final Function1<Coordinate, Boolean> _function_3 = (Coordinate it) -> {
          boolean _equals = it.equals(nprev);
          return Boolean.valueOf((!_equals));
        };
        current = IterableExtensions.<Coordinate>findFirst(coordinates.get(current), _function_3);
        length++;
      }
    }
    InputOutput.<Integer>println(Integer.valueOf((length / 2)));
  }
}
