package advent2022;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;
import adventutils.pathfinding.AStar;
import adventutils.pathfinding.NotInitializedException;
import adventutils.pathfinding.State;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day12 {
  public static class CoordinateElevated extends Coordinate implements State {
    public CoordinateElevated(final int i, final int j) {
      super(i, j);
    }

    @Override
    public boolean isGoal() {
      return this.equals(Day12.target);
    }

    @Override
    public int minToGoal() {
      return this.manhattanDistanceTo(Day12.target);
    }

    @Override
    public Iterable<Pair<? extends State, Integer>> neighbours() {
      final Function1<Coordinate, Day12.CoordinateElevated> _function = (Coordinate it) -> {
        int _x = it.getX();
        int _y = it.getY();
        return new Day12.CoordinateElevated(_x, _y);
      };
      final Function1<Day12.CoordinateElevated, Boolean> _function_1 = (Day12.CoordinateElevated it) -> {
        Integer _get = Day12.elevations.get(this);
        int _plus = ((_get).intValue() + 1);
        Integer _orDefault = Day12.elevations.getOrDefault(it, Integer.valueOf(30));
        return Boolean.valueOf((_plus >= (_orDefault).intValue()));
      };
      final Function1<Day12.CoordinateElevated, Pair<? extends State, Integer>> _function_2 = (Day12.CoordinateElevated it) -> {
        return Pair.<Day12.CoordinateElevated, Integer>of(it, Integer.valueOf(1));
      };
      return IterableExtensions.<Day12.CoordinateElevated, Pair<? extends State, Integer>>map(IterableExtensions.<Day12.CoordinateElevated>filter(IterableExtensions.<Coordinate, Day12.CoordinateElevated>map(this.noDiagonalUnboundedNeighbours(), _function), _function_1), _function_2);
    }
  }

  private static Day12.CoordinateElevated entrance;

  private static Day12.CoordinateElevated target;

  private static final Map<Day12.CoordinateElevated, Integer> elevations = new Function0<Map<Day12.CoordinateElevated, Integer>>() {
    @Override
    public Map<Day12.CoordinateElevated, Integer> apply() {
      HashMap<Day12.CoordinateElevated, Integer> _xblockexpression = null;
      {
        final HashMap<Day12.CoordinateElevated, Integer> output = CollectionLiterals.<Day12.CoordinateElevated, Integer>newHashMap();
        final List<String> input = new InputLoader(Integer.valueOf(2022), Integer.valueOf(12)).getInputs();
        final int max_i = input.size();
        final int max_j = input.get(0).length();
        final Consumer<Integer> _function = (Integer i) -> {
          final char[] line = input.get((i).intValue()).toCharArray();
          final Consumer<Integer> _function_1 = (Integer j) -> {
            char _get = line[(j).intValue()];
            String _plus = (Character.valueOf(_get) + "");
            if (_plus != null) {
              switch (_plus) {
                case "S":
                  Day12.CoordinateElevated _coordinateElevated = new Day12.CoordinateElevated((i).intValue(), (j).intValue());
                  Day12.entrance = _coordinateElevated;
                  output.put(Day12.entrance, Integer.valueOf(0));
                  break;
                case "E":
                  Day12.CoordinateElevated _coordinateElevated_1 = new Day12.CoordinateElevated((i).intValue(), (j).intValue());
                  Day12.target = _coordinateElevated_1;
                  output.put(Day12.target, Integer.valueOf(25));
                  break;
                default:
                  Day12.CoordinateElevated _coordinateElevated_2 = new Day12.CoordinateElevated((i).intValue(), (j).intValue());
                  Integer _valueOf = Integer.valueOf(line[(j).intValue()]);
                  int _minus = ((_valueOf).intValue() - 97);
                  output.put(_coordinateElevated_2, Integer.valueOf(_minus));
                  break;
              }
            } else {
              Day12.CoordinateElevated _coordinateElevated_2 = new Day12.CoordinateElevated((i).intValue(), (j).intValue());
              Integer _valueOf = Integer.valueOf(line[(j).intValue()]);
              int _minus = ((_valueOf).intValue() - 97);
              output.put(_coordinateElevated_2, Integer.valueOf(_minus));
            }
          };
          new ExclusiveRange(0, max_j, true).forEach(_function_1);
        };
        new ExclusiveRange(0, max_i, true).forEach(_function);
        _xblockexpression = output;
      }
      return _xblockexpression;
    }
  }.apply();

  public static void main(final String[] args) {
    InputOutput.<Integer>println(new AStar(Day12.entrance).run().getMinDistance());
    Set<Day12.CoordinateElevated> _keySet = Day12.elevations.keySet();
    final Function1<Day12.CoordinateElevated, Boolean> _function = (Day12.CoordinateElevated it) -> {
      Integer _get = Day12.elevations.get(it);
      return Boolean.valueOf(((_get).intValue() == 0));
    };
    final Function1<Day12.CoordinateElevated, Integer> _function_1 = (Day12.CoordinateElevated it) -> {
      Integer _xtrycatchfinallyexpression = null;
      try {
        _xtrycatchfinallyexpression = new AStar(it).run().getMinDistance();
      } catch (final Throwable _t) {
        if (_t instanceof NotInitializedException) {
          _xtrycatchfinallyexpression = Integer.valueOf(Integer.MAX_VALUE);
        } else {
          throw Exceptions.sneakyThrow(_t);
        }
      }
      return _xtrycatchfinallyexpression;
    };
    InputOutput.<Integer>println(IterableExtensions.<Integer>head(IterableExtensions.<Integer>sort(IterableExtensions.<Day12.CoordinateElevated, Integer>map(IterableExtensions.<Day12.CoordinateElevated>filter(new ArrayList<Day12.CoordinateElevated>(_keySet), _function), _function_1))));
  }
}
