package advent2024;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;
import adventutils.pathfinding.AStar;
import adventutils.pathfinding.State;
import java.util.List;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day20 {
  public static class MyCoordinate extends Coordinate implements State {
    public MyCoordinate(final Coordinate c) {
      super(c);
    }

    @Override
    public boolean isGoal() {
      return this.equals(Day20.finish);
    }

    @Override
    public int minToGoal() {
      return this.manhattanDistanceTo(Day20.finish);
    }

    @Override
    public Iterable<Pair<? extends State, Integer>> neighbours() {
      final Function1<Coordinate, Boolean> _function = (Coordinate it) -> {
        return Boolean.valueOf(Day20.free_spots.contains(it));
      };
      final Function1<Coordinate, Pair<? extends State, Integer>> _function_1 = (Coordinate it) -> {
        Day20.MyCoordinate _myCoordinate = new Day20.MyCoordinate(it);
        return Pair.<Day20.MyCoordinate, Integer>of(_myCoordinate, Integer.valueOf(1));
      };
      return IterableExtensions.<Coordinate, Pair<? extends State, Integer>>map(IterableExtensions.<Coordinate>filter(this.noDiagonalBoundedNeighbours(Day20.min_coordinate, Day20.max_coordinate), _function), _function_1);
    }
  }

  private static final Set<Coordinate> free_spots = CollectionLiterals.<Coordinate>newHashSet();

  private static Coordinate start;

  private static Coordinate finish;

  private static Coordinate min_coordinate = new Coordinate(0, 0);

  private static Coordinate max_coordinate = new InputLoader(Integer.valueOf(2024), Integer.valueOf(20)).<Boolean>applyOnGrid(((Function2<String, Coordinate, Boolean>) (String s, Coordinate c) -> {
    boolean _switchResult = false;
    if (s != null) {
      switch (s) {
        case ".":
          _switchResult = Day20.free_spots.add(c);
          break;
        case "S":
          _switchResult = Day20.free_spots.add(Day20.start = c);
          break;
        case "E":
          _switchResult = Day20.free_spots.add(Day20.finish = c);
          break;
        default:
          _switchResult = false;
          break;
      }
    } else {
      _switchResult = false;
    }
    return Boolean.valueOf(_switchResult);
  }));

  private static List<Coordinate> min_path = ListExtensions.<State, Coordinate>map(new AStar(new Day20.MyCoordinate(Day20.start)).run().getMinPath(), ((Function1<State, Coordinate>) (State it) -> {
    return ((Coordinate) it);
  }));

  public static void main(final String[] args) {
    InputOutput.<Integer>println(Integer.valueOf(Day20.compute(2)));
    InputOutput.<Integer>println(Integer.valueOf(Day20.compute(20)));
  }

  public static int compute(final int max_cheat_size) {
    int _xblockexpression = (int) 0;
    {
      int nb = 0;
      int _size = Day20.min_path.size();
      ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, _size, true);
      for (final Integer i : _doubleDotLessThan) {
        {
          final Coordinate current_i = Day20.min_path.get((i).intValue());
          int _size_1 = Day20.min_path.size();
          ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(((i).intValue() + 100), _size_1, true);
          for (final Integer j : _doubleDotLessThan_1) {
            {
              final int distance = current_i.manhattanDistanceTo(Day20.min_path.get((j).intValue()));
              if (((distance <= max_cheat_size) && ((((j).intValue() - (i).intValue()) - distance) >= 100))) {
                nb++;
              }
            }
          }
        }
      }
      _xblockexpression = nb;
    }
    return _xblockexpression;
  }
}
