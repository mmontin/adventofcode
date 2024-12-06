package advent2024;

import adventutils.geometry.Coordinate;
import adventutils.geometry.Dir;
import adventutils.geometry.Direction;
import adventutils.input.InputLoader;
import java.util.HashSet;
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
public class Day6 {
  public static void main(final String[] args) {
    final Function1<String, List<String>> _function = (String it) -> {
      final Function1<Character, String> _function_1 = (Character it_1) -> {
        return (it_1 + "");
      };
      return ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray(it.toCharArray())), _function_1);
    };
    final List<List<String>> inputs = ListExtensions.<String, List<String>>map(new InputLoader(Integer.valueOf(2024), Integer.valueOf(6)).getInputs(), _function);
    int _size = inputs.size();
    final int max_i = (_size - 1);
    int _size_1 = inputs.get(0).size();
    final int max_j = (_size_1 - 1);
    final HashSet<Coordinate> obstacles = CollectionLiterals.<Coordinate>newHashSet();
    Coordinate guard_position = null;
    IntegerRange _upTo = new IntegerRange(0, max_i);
    for (final Integer i : _upTo) {
      {
        final List<String> current_line = inputs.get((i).intValue());
        IntegerRange _upTo_1 = new IntegerRange(0, max_j);
        for (final Integer j : _upTo_1) {
          String _get = current_line.get((j).intValue());
          if (_get != null) {
            switch (_get) {
              case "^":
                Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
                guard_position = _coordinate;
                break;
              case "#":
                Coordinate _coordinate_1 = new Coordinate((i).intValue(), (j).intValue());
                obstacles.add(_coordinate_1);
                break;
            }
          }
        }
      }
    }
    InputOutput.<Integer>println(Day6.simulate(obstacles, max_i, max_j, guard_position).getKey());
    int loops = 0;
    IntegerRange _upTo_1 = new IntegerRange(0, max_i);
    for (final Integer i_1 : _upTo_1) {
      IntegerRange _upTo_2 = new IntegerRange(0, max_j);
      for (final Integer j : _upTo_2) {
        {
          final Coordinate current_coord = new Coordinate((i_1).intValue(), (j).intValue());
          if (((!guard_position.equals(current_coord)) && (!obstacles.contains(current_coord)))) {
            obstacles.add(current_coord);
            Boolean _value = Day6.simulate(obstacles, max_i, max_j, guard_position).getValue();
            if ((_value).booleanValue()) {
              loops++;
            }
            obstacles.remove(current_coord);
          }
        }
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(loops));
  }

  public static Pair<Integer, Boolean> simulate(final Set<Coordinate> obstacles, final int max_i, final int max_j, final Coordinate starting_point) {
    Pair<Integer, Boolean> _xblockexpression = null;
    {
      final HashSet<Pair<Coordinate, Direction>> visited = CollectionLiterals.<Pair<Coordinate, Direction>>newHashSet();
      Coordinate current_position = starting_point;
      Direction current_direction = Direction.UP;
      while ((current_position.includedIn(0, max_i, 0, max_j) && 
        (!visited.contains(Pair.<Coordinate, Direction>of(current_position, current_direction))))) {
        {
          Pair<Coordinate, Direction> _mappedTo = Pair.<Coordinate, Direction>of(current_position, current_direction);
          visited.add(_mappedTo);
          final Coordinate next_position = current_position.otherMove(current_direction);
          boolean _contains = obstacles.contains(next_position);
          if (_contains) {
            current_direction = Dir.clockWise(current_direction);
          } else {
            current_position = next_position;
          }
        }
      }
      final Function1<Pair<Coordinate, Direction>, Coordinate> _function = (Pair<Coordinate, Direction> it) -> {
        return it.getKey();
      };
      int _size = IterableExtensions.<Coordinate>toSet(IterableExtensions.<Pair<Coordinate, Direction>, Coordinate>map(visited, _function)).size();
      Pair<Coordinate, Direction> _mappedTo = Pair.<Coordinate, Direction>of(current_position, current_direction);
      boolean _contains = visited.contains(_mappedTo);
      _xblockexpression = Pair.<Integer, Boolean>of(Integer.valueOf(_size), Boolean.valueOf(_contains));
    }
    return _xblockexpression;
  }
}
