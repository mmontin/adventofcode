package advent2024;

import adventutils.geometry.Coordinate;
import adventutils.geometry.Dir;
import adventutils.geometry.Direction;
import adventutils.input.InputLoader;
import adventutils.pathfinding.AStar;
import adventutils.pathfinding.DFS;
import adventutils.pathfinding.Path;
import adventutils.pathfinding.State;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day16 {
  public static class MyCoordinate implements State {
    private Coordinate coord;

    private Direction dir;

    public MyCoordinate(final Coordinate c, final Direction d) {
      this.coord = c;
      this.dir = d;
    }

    @Override
    public boolean isGoal() {
      return this.coord.equals(Day16.finish);
    }

    @Override
    public int minToGoal() {
      return this.coord.manhattanDistanceTo(Day16.finish);
    }

    @Override
    public int hashCode() {
      int _hashCode = this.coord.hashCode();
      int _hashCode_1 = this.dir.hashCode();
      return (_hashCode * _hashCode_1);
    }

    @Override
    public boolean equals(final Object other) {
      boolean _switchResult = false;
      boolean _matched = false;
      if (other instanceof Day16.MyCoordinate) {
        _matched=true;
        _switchResult = (((Day16.MyCoordinate)other).coord.equals(this.coord) && ((Day16.MyCoordinate)other).dir.equals(this.dir));
      }
      if (!_matched) {
        _switchResult = false;
      }
      return _switchResult;
    }

    @Override
    public String toString() {
      String _plus = (this.coord + " : ");
      return (_plus + this.dir);
    }

    @Override
    public Iterable<Pair<? extends State, Integer>> neighbours() {
      HashSet<Pair<? extends State, Integer>> _xblockexpression = null;
      {
        Direction _nextDirection = Dir.nextDirection(this.dir);
        Direction _clockWise = Dir.clockWise(this.dir);
        final Function1<Direction, Pair<Day16.MyCoordinate, Integer>> _function = (Direction it) -> {
          Day16.MyCoordinate _myCoordinate = new Day16.MyCoordinate(this.coord, it);
          return Pair.<Day16.MyCoordinate, Integer>of(_myCoordinate, Integer.valueOf(1000));
        };
        final Set<Pair<Day16.MyCoordinate, Integer>> next_dirs = IterableExtensions.<Pair<Day16.MyCoordinate, Integer>>toSet(IterableExtensions.<Direction, Pair<Day16.MyCoordinate, Integer>>map(Collections.<Direction>unmodifiableSet(CollectionLiterals.<Direction>newHashSet(_nextDirection, _clockWise)), _function));
        final Coordinate next_coord = this.coord.otherMove(this.dir);
        boolean _contains = Day16.free_spots.contains(next_coord);
        if (_contains) {
          Day16.MyCoordinate _myCoordinate = new Day16.MyCoordinate(next_coord, this.dir);
          Pair<Day16.MyCoordinate, Integer> _mappedTo = Pair.<Day16.MyCoordinate, Integer>of(_myCoordinate, Integer.valueOf(1));
          next_dirs.add(_mappedTo);
        }
        _xblockexpression = new HashSet<Pair<? extends State, Integer>>(next_dirs);
      }
      return _xblockexpression;
    }
  }

  private static Coordinate start;

  private static Coordinate finish;

  private static Set<Coordinate> free_spots = CollectionLiterals.<Coordinate>newHashSet();

  public static void main(final String[] args) {
    final Function2<String, Coordinate, Comparable<?>> _function = (String s, Coordinate c) -> {
      Comparable<?> _switchResult = null;
      if (s != null) {
        switch (s) {
          case "S":
            _switchResult = Day16.start = c;
            break;
          case "E":
            _switchResult = Day16.finish = c;
            break;
          case ".":
            _switchResult = Boolean.valueOf(Day16.free_spots.add(c));
            break;
        }
      }
      return _switchResult;
    };
    new InputLoader(Integer.valueOf(2024), Integer.valueOf(16)).<Comparable<?>>applyOnGrid(_function);
    Day16.free_spots.addAll(Collections.<Coordinate>unmodifiableSet(CollectionLiterals.<Coordinate>newHashSet(Day16.start, Day16.finish)));
    Day16.MyCoordinate _myCoordinate = new Day16.MyCoordinate(Day16.start, Direction.RIGHT);
    final AStar aStar = new AStar(_myCoordinate).run();
    InputOutput.<Integer>println(aStar.getMinDistance());
    final Function2<HashSet<Coordinate>, Path, HashSet<Coordinate>> _function_1 = (HashSet<Coordinate> acc, Path el) -> {
      HashSet<Coordinate> _xblockexpression = null;
      {
        final Function1<State, Coordinate> _function_2 = (State it) -> {
          return ((Day16.MyCoordinate) it).coord;
        };
        acc.addAll(ListExtensions.<State, Coordinate>map(el.getPath(), _function_2));
        _xblockexpression = acc;
      }
      return _xblockexpression;
    };
    InputOutput.<Integer>println(Integer.valueOf(IterableExtensions.<Path, HashSet<Coordinate>>fold(new DFS(aStar).run().all_min_paths(), CollectionLiterals.<Coordinate>newHashSet(), _function_1).size()));
  }
}
