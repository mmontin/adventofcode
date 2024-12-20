package advent2024;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;
import adventutils.pathfinding.AStar;
import adventutils.pathfinding.State;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.BiFunction;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
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
    private Set<Coordinate> candidates;

    private Coordinate target;

    public MyCoordinate(final Coordinate c, final Set<Coordinate> candidates_, final Coordinate target_) {
      super(c);
      this.candidates = candidates_;
      this.target = target_;
    }

    @Override
    public boolean isGoal() {
      return this.equals(this.target);
    }

    @Override
    public int minToGoal() {
      return this.manhattanDistanceTo(this.target);
    }

    @Override
    public Iterable<Pair<? extends State, Integer>> neighbours() {
      final Function1<Coordinate, Boolean> _function = (Coordinate it) -> {
        return Boolean.valueOf(this.candidates.contains(it));
      };
      final Function1<Coordinate, Pair<? extends State, Integer>> _function_1 = (Coordinate it) -> {
        Day20.MyCoordinate _myCoordinate = new Day20.MyCoordinate(it, this.candidates, this.target);
        return Pair.<Day20.MyCoordinate, Integer>of(_myCoordinate, Integer.valueOf(1));
      };
      return IterableExtensions.<Coordinate, Pair<? extends State, Integer>>map(IterableExtensions.<Coordinate>filter(this.noDiagonalBoundedNeighbours(Day20.min_coordinate, Day20.max_coordinate), _function), _function_1);
    }
  }

  private static final Set<Coordinate> free_spots = CollectionLiterals.<Coordinate>newHashSet();

  private static final Set<Coordinate> walls = CollectionLiterals.<Coordinate>newHashSet();

  private static final Set<Coordinate> min_path = CollectionLiterals.<Coordinate>newHashSet();

  private static Coordinate start;

  private static Coordinate finish;

  private static Coordinate min_coordinate = new Coordinate(0, 0);

  private static Coordinate max_coordinate;

  public static void main(final String[] args) {
    final Function2<String, Coordinate, Boolean> _function = (String s, Coordinate c) -> {
      boolean _switchResult = false;
      if (s != null) {
        switch (s) {
          case ".":
            _switchResult = Day20.free_spots.add(c);
            break;
          case "S":
            boolean _xblockexpression = false;
            {
              Day20.start = c;
              _xblockexpression = Day20.free_spots.add(c);
            }
            _switchResult = _xblockexpression;
            break;
          case "E":
            boolean _xblockexpression_1 = false;
            {
              Day20.finish = c;
              _xblockexpression_1 = Day20.free_spots.add(c);
            }
            _switchResult = _xblockexpression_1;
            break;
          default:
            _switchResult = Day20.walls.add(c);
            break;
        }
      } else {
        _switchResult = Day20.walls.add(c);
      }
      return Boolean.valueOf(_switchResult);
    };
    Day20.max_coordinate = new InputLoader(Integer.valueOf(2024), Integer.valueOf(20)).<Boolean>applyOnGrid(_function);
    Day20.MyCoordinate _myCoordinate = new Day20.MyCoordinate(Day20.start, Day20.free_spots, Day20.finish);
    final AStar astar = new AStar(_myCoordinate);
    final Integer best_without_cheating = astar.run().getMinDistance();
    final Function1<State, Coordinate> _function_1 = (State it) -> {
      return ((Coordinate) it);
    };
    Day20.min_path.addAll(ListExtensions.<State, Coordinate>map(astar.getMinPath(), _function_1));
    InputOutput.<Integer>println(best_without_cheating);
    final HashMap<Integer, Integer> map1 = Day20.compute(2);
    final Function1<Map.Entry<Integer, Integer>, Pair<Integer, Integer>> _function_2 = (Map.Entry<Integer, Integer> it) -> {
      Integer _key = it.getKey();
      int _minus = ((best_without_cheating).intValue() - (_key).intValue());
      Integer _value = it.getValue();
      return Pair.<Integer, Integer>of(Integer.valueOf(_minus), _value);
    };
    final Function1<Pair<Integer, Integer>, Boolean> _function_3 = (Pair<Integer, Integer> it) -> {
      Integer _key = it.getKey();
      return Boolean.valueOf(((_key).intValue() >= 100));
    };
    final Function1<Pair<Integer, Integer>, Integer> _function_4 = (Pair<Integer, Integer> it) -> {
      return it.getValue();
    };
    final Function2<Integer, Integer, Integer> _function_5 = (Integer x, Integer y) -> {
      return Integer.valueOf(((x).intValue() + (y).intValue()));
    };
    InputOutput.<Integer>println(IterableExtensions.<Integer>reduce(IterableExtensions.<Pair<Integer, Integer>, Integer>map(IterableExtensions.<Pair<Integer, Integer>>filter(IterableExtensions.<Map.Entry<Integer, Integer>, Pair<Integer, Integer>>map(map1.entrySet(), _function_2), _function_3), _function_4), _function_5));
  }

  public static HashMap<Integer, Integer> compute(final int max_cheat_size) {
    HashMap<Integer, Integer> _xblockexpression = null;
    {
      final HashMap<Integer, Integer> cheats = CollectionLiterals.<Integer, Integer>newHashMap();
      int n_free_spots = Day20.min_path.size();
      InputOutput.<Integer>println(Integer.valueOf(n_free_spots));
      ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, n_free_spots, true);
      for (final Integer i : _doubleDotLessThan) {
        {
          InputOutput.<Integer>println(i);
          final Coordinate current_i = ((Coordinate[])Conversions.unwrapArray(Day20.min_path, Coordinate.class))[(i).intValue()];
          ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(((i).intValue() + 100), n_free_spots, true);
          for (final Integer j : _doubleDotLessThan_1) {
            {
              final Coordinate current_j = ((Coordinate[])Conversions.unwrapArray(Day20.min_path, Coordinate.class))[(j).intValue()];
              int _manhattanDistanceTo = current_i.manhattanDistanceTo(current_j);
              boolean _lessEqualsThan = (_manhattanDistanceTo <= max_cheat_size);
              if (_lessEqualsThan) {
                Day20.walls.add(current_j);
                Day20.MyCoordinate _myCoordinate = new Day20.MyCoordinate(current_i, Day20.walls, current_j);
                final AStar astar = new AStar(_myCoordinate);
                try {
                  astar.run();
                  final List<State> wall_path = astar.getMinPath();
                  int _size = wall_path.size();
                  boolean _greaterThan = (_size > 2);
                  if (_greaterThan) {
                    int _size_1 = wall_path.size();
                    int _minus = (_size_1 - 1);
                    final Function1<State, Day20.MyCoordinate> _function = (State it) -> {
                      return ((Day20.MyCoordinate) it);
                    };
                    final List<Day20.MyCoordinate> walls_to_remove = ListExtensions.<State, Day20.MyCoordinate>map(wall_path.subList(1, _minus), _function);
                    Day20.free_spots.addAll(walls_to_remove);
                    Day20.MyCoordinate _myCoordinate_1 = new Day20.MyCoordinate(Day20.start, Day20.free_spots, Day20.finish);
                    final AStar astar2 = new AStar(_myCoordinate_1).run();
                    final BiFunction<Integer, Integer, Integer> _function_1 = (Integer x, Integer y) -> {
                      return Integer.valueOf(((x).intValue() + (y).intValue()));
                    };
                    cheats.merge(astar2.getMinDistance(), Integer.valueOf(1), _function_1);
                    Day20.free_spots.removeAll(walls_to_remove);
                  }
                } finally {
                  Day20.walls.remove(current_j);
                }
              }
            }
          }
        }
      }
      _xblockexpression = cheats;
    }
    return _xblockexpression;
  }
}
