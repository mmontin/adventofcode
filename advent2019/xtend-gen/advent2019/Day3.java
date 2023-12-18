package advent2019;

import adventutils.geometry.Coordinate;
import adventutils.geometry.Dir;
import adventutils.geometry.Direction;
import adventutils.input.InputLoader;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day3 {
  public static void main(final String[] args) {
    final List<String> inputs = new InputLoader(Integer.valueOf(2019), Integer.valueOf(3)).getInputs();
    final Function1<String, Pair<Direction, Integer>> _function = (String it) -> {
      Direction _directionFromString = Dir.directionFromString(it.substring(0, 1));
      int _parseInt = Integer.parseInt(it.substring(1));
      return Pair.<Direction, Integer>of(_directionFromString, Integer.valueOf(_parseInt));
    };
    final List<Pair<Direction, Integer>> path1 = ListExtensions.<String, Pair<Direction, Integer>>map(((List<String>)Conversions.doWrapArray(inputs.get(0).split(","))), _function);
    final Function1<String, Pair<Direction, Integer>> _function_1 = (String it) -> {
      Direction _directionFromString = Dir.directionFromString(it.substring(0, 1));
      int _parseInt = Integer.parseInt(it.substring(1));
      return Pair.<Direction, Integer>of(_directionFromString, Integer.valueOf(_parseInt));
    };
    final List<Pair<Direction, Integer>> path2 = ListExtensions.<String, Pair<Direction, Integer>>map(((List<String>)Conversions.doWrapArray(inputs.get(1).split(","))), _function_1);
    final HashMap<Coordinate, Integer> coords1 = Day3.navigate(path1);
    final HashMap<Coordinate, Integer> coords2 = Day3.navigate(path2);
    final Set<Coordinate> intersection = coords1.keySet();
    intersection.retainAll(coords2.keySet());
    final Function1<Coordinate, Integer> _function_2 = (Coordinate it) -> {
      return Integer.valueOf(it.manhattanDistanceToZero());
    };
    InputOutput.<Integer>println(Integer.valueOf(IterableExtensions.<Coordinate, Integer>minBy(intersection, _function_2).manhattanDistanceToZero()));
    final Function1<Coordinate, Integer> _function_3 = (Coordinate it) -> {
      Integer _get = coords1.get(it);
      Integer _get_1 = coords2.get(it);
      return Integer.valueOf(((_get).intValue() + (_get_1).intValue()));
    };
    final Coordinate better2 = IterableExtensions.<Coordinate, Integer>minBy(intersection, _function_3);
    Integer _get = coords1.get(better2);
    Integer _get_1 = coords2.get(better2);
    int _plus = ((_get).intValue() + (_get_1).intValue());
    InputOutput.<Integer>println(Integer.valueOf(_plus));
  }

  public static HashMap<Coordinate, Integer> navigate(final List<Pair<Direction, Integer>> path) {
    HashMap<Coordinate, Integer> _xblockexpression = null;
    {
      final HashMap<Coordinate, Integer> output = CollectionLiterals.<Coordinate, Integer>newHashMap();
      int duration = 0;
      Coordinate currentCoord = new Coordinate(0, 0);
      for (final Pair<Direction, Integer> line : path) {
        Integer _value = line.getValue();
        IntegerRange _upTo = new IntegerRange(1, (_value).intValue());
        for (final Integer i : _upTo) {
          {
            currentCoord = currentCoord.otherMove(line.getKey());
            duration++;
            boolean _containsKey = output.containsKey(currentCoord);
            boolean _not = (!_containsKey);
            if (_not) {
              output.put(currentCoord, Integer.valueOf(duration));
            }
          }
        }
      }
      _xblockexpression = output;
    }
    return _xblockexpression;
  }
}
