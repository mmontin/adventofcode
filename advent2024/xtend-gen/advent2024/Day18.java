package advent2024;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;
import adventutils.pathfinding.AStar;
import adventutils.pathfinding.NotInitializedException;
import adventutils.pathfinding.State;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day18 {
  public static class MyCoordinate extends Coordinate implements State {
    public MyCoordinate(final Coordinate c) {
      super(c);
    }

    @Override
    public boolean isGoal() {
      return this.equals(Day18.target);
    }

    @Override
    public int minToGoal() {
      return this.manhattanDistanceTo(Day18.target);
    }

    @Override
    public Iterable<Pair<? extends State, Integer>> neighbours() {
      final Function1<Coordinate, Boolean> _function = (Coordinate it) -> {
        boolean _contains = IterableExtensions.contains(IterableExtensions.<Coordinate>take(Day18.falling, Day18.index), it);
        return Boolean.valueOf((!_contains));
      };
      final Function1<Coordinate, Pair<? extends State, Integer>> _function_1 = (Coordinate it) -> {
        Day18.MyCoordinate _myCoordinate = new Day18.MyCoordinate(it);
        return Pair.<Day18.MyCoordinate, Integer>of(_myCoordinate, Integer.valueOf(1));
      };
      return IterableExtensions.<Coordinate, Pair<? extends State, Integer>>map(IterableExtensions.<Coordinate>filter(this.noDiagonalBoundedNeighbours(0, 70, 0, 70), _function), _function_1);
    }
  }

  private static final Coordinate source = new Coordinate(0, 0);

  private static final Coordinate target = new Coordinate(70, 70);

  private static final List<Coordinate> falling = IterableExtensions.<Coordinate>toList(ListExtensions.<String, Coordinate>map(new InputLoader(Integer.valueOf(2024), Integer.valueOf(18)).getInputs(), ((Function1<String, Coordinate>) (String it) -> {
    return new Coordinate(it);
  })));

  private static int index = 1024;

  public static void main(final String[] args) {
    Day18.MyCoordinate _myCoordinate = new Day18.MyCoordinate(Day18.source);
    InputOutput.<Integer>println(new AStar(_myCoordinate).run().getMinDistance());
    int left = Day18.index;
    int _size = Day18.falling.size();
    int right = (_size - 1);
    while ((left != right)) {
      {
        Day18.index = (((right - left) / 2) + left);
        try {
          Day18.MyCoordinate _myCoordinate_1 = new Day18.MyCoordinate(Day18.source);
          new AStar(_myCoordinate_1).run();
          left = (Day18.index + 1);
        } catch (final Throwable _t) {
          if (_t instanceof NotInitializedException) {
            right = Day18.index;
          } else {
            throw Exceptions.sneakyThrow(_t);
          }
        }
      }
    }
    InputOutput.<Coordinate>println(Day18.falling.get(Day18.index));
  }
}
