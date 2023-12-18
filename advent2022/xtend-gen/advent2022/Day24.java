package advent2022;

import adventutils.geometry.Coordinate;
import adventutils.geometry.Direction;
import adventutils.input.InputLoader;
import adventutils.pathfinding.AStar;
import adventutils.pathfinding.State;
import com.google.common.base.Objects;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day24 {
  public static class PositionTimed implements State {
    private static Coordinate current_arrival;

    private Coordinate position;

    private int time;

    public PositionTimed(final Coordinate _position, final int _time) {
      this.position = _position;
      this.time = _time;
    }

    public boolean isGoal() {
      return this.position.equals(Day24.PositionTimed.current_arrival);
    }

    public int minToGoal() {
      return this.position.manhattanDistanceTo(Day24.PositionTimed.current_arrival);
    }

    public Iterable<Pair<? extends State, Integer>> neighbours() {
      Iterable<Pair<? extends State, Integer>> _xblockexpression = null;
      {
        final Set<Coordinate> squares = this.position.noDiagonalUnboundedNeighbours();
        squares.add(this.position);
        final Function1<Coordinate, Boolean> _function = new Function1<Coordinate, Boolean>() {
          public Boolean apply(final Coordinate it) {
            return Boolean.valueOf(((it.equals(Day24.departure) || 
              it.equals(Day24.arrival)) || (((((it.getX() >= 0) && (it.getX() < Day24.WALL_DOWN)) && (it.getY() >= 0)) && (it.getY() < Day24.WALL_RIGHT)) && (!Day24.getBlizzardsAtTime((PositionTimed.this.time + 1)).contains(it)))));
          }
        };
        final Function1<Coordinate, Pair<? extends State, Integer>> _function_1 = new Function1<Coordinate, Pair<? extends State, Integer>>() {
          public Pair<? extends State, Integer> apply(final Coordinate it) {
            Day24.PositionTimed _positionTimed = new Day24.PositionTimed(it, (PositionTimed.this.time + 1));
            return Pair.<Day24.PositionTimed, Integer>of(_positionTimed, Integer.valueOf(1));
          }
        };
        _xblockexpression = IterableExtensions.<Coordinate, Pair<? extends State, Integer>>map(IterableExtensions.<Coordinate>filter(squares, _function), _function_1);
      }
      return _xblockexpression;
    }

    public String toString() {
      return this.position.toString();
    }

    public int hashCode() {
      int _hashCode = this.position.hashCode();
      return (_hashCode * this.time);
    }

    public boolean equals(final Object other) {
      boolean _switchResult = false;
      boolean _matched = false;
      if (other instanceof Day24.PositionTimed) {
        _matched=true;
        _switchResult = (((Day24.PositionTimed)other).position.equals(this.position) && Integer.valueOf(((Day24.PositionTimed)other).time).equals(Integer.valueOf(this.time)));
      }
      if (!_matched) {
        _switchResult = false;
      }
      return _switchResult;
    }
  }

  public static class Blizzard {
    private Coordinate initial;

    private Direction direction;

    public Blizzard(final Coordinate _initial, final Direction _direction) {
      this.initial = _initial;
      this.direction = _direction;
    }

    public Coordinate getCurrentPosition(final int t) {
      Coordinate _switchResult = null;
      final Direction direction = this.direction;
      if (direction != null) {
        switch (direction) {
          case UP:
            int _x = this.initial.getX();
            int _plus = (_x + Day24.WALL_DOWN);
            int _minus = (_plus - (t % Day24.WALL_DOWN));
            int _modulo = (_minus % Day24.WALL_DOWN);
            int _y = this.initial.getY();
            _switchResult = new Coordinate(_modulo, _y);
            break;
          case DOWN:
            int _x_1 = this.initial.getX();
            int _plus_1 = (_x_1 + (t % Day24.WALL_DOWN));
            int _modulo_1 = (_plus_1 % Day24.WALL_DOWN);
            int _y_1 = this.initial.getY();
            _switchResult = new Coordinate(_modulo_1, _y_1);
            break;
          case RIGHT:
            int _x_2 = this.initial.getX();
            int _y_2 = this.initial.getY();
            int _plus_2 = (_y_2 + (t % Day24.WALL_RIGHT));
            int _modulo_2 = (_plus_2 % Day24.WALL_RIGHT);
            _switchResult = new Coordinate(_x_2, _modulo_2);
            break;
          case LEFT:
            int _x_3 = this.initial.getX();
            int _y_3 = this.initial.getY();
            int _plus_3 = (_y_3 + Day24.WALL_RIGHT);
            int _minus_1 = (_plus_3 - (t % Day24.WALL_RIGHT));
            int _modulo_3 = (_minus_1 % Day24.WALL_RIGHT);
            _switchResult = new Coordinate(_x_3, _modulo_3);
            break;
          default:
            break;
        }
      }
      return _switchResult;
    }

    public String toString() {
      return this.initial.toString();
    }
  }

  private static final List<char[]> inputs = ListExtensions.<String, char[]>map(new InputLoader(Integer.valueOf(2022), Integer.valueOf(24)).getInputs(), new Function1<String, char[]>() {
    public char[] apply(final String it) {
      return it.toCharArray();
    }
  });

  private static final int WALL_DOWN = (Day24.inputs.size() - 2);

  private static final int WALL_RIGHT = (((List<Character>)Conversions.doWrapArray(Day24.inputs.get(0))).size() - 2);

  private static final Coordinate departure = new Coordinate((-1), 0);

  private static final Coordinate arrival = new Coordinate(Day24.WALL_DOWN, (Day24.WALL_RIGHT - 1));

  private static final List<Day24.Blizzard> blizzards = new Function0<List<Day24.Blizzard>>() {
    public List<Day24.Blizzard> apply() {
      ArrayList<Day24.Blizzard> _xblockexpression = null;
      {
        final ArrayList<Day24.Blizzard> output = CollectionLiterals.<Day24.Blizzard>newArrayList();
        final Consumer<Integer> _function = new Consumer<Integer>() {
          public void accept(final Integer i) {
            final Consumer<Integer> _function = new Consumer<Integer>() {
              public void accept(final Integer j) {
                String _string = Character.valueOf((Day24.inputs.get((i).intValue())[(j).intValue()])).toString();
                boolean _matched = false;
                if (Objects.equal(_string, ">")) {
                  _matched=true;
                  Coordinate _coordinate = new Coordinate(((i).intValue() - 1), ((j).intValue() - 1));
                  Day24.Blizzard _blizzard = new Day24.Blizzard(_coordinate, Direction.RIGHT);
                  output.add(_blizzard);
                }
                if (!_matched) {
                  if (Objects.equal(_string, "<")) {
                    _matched=true;
                    Coordinate _coordinate_1 = new Coordinate(((i).intValue() - 1), ((j).intValue() - 1));
                    Day24.Blizzard _blizzard_1 = new Day24.Blizzard(_coordinate_1, Direction.LEFT);
                    output.add(_blizzard_1);
                  }
                }
                if (!_matched) {
                  if (Objects.equal(_string, "v")) {
                    _matched=true;
                    Coordinate _coordinate_2 = new Coordinate(((i).intValue() - 1), ((j).intValue() - 1));
                    Day24.Blizzard _blizzard_2 = new Day24.Blizzard(_coordinate_2, Direction.DOWN);
                    output.add(_blizzard_2);
                  }
                }
                if (!_matched) {
                  if (Objects.equal(_string, "^")) {
                    _matched=true;
                    Coordinate _coordinate_3 = new Coordinate(((i).intValue() - 1), ((j).intValue() - 1));
                    Day24.Blizzard _blizzard_3 = new Day24.Blizzard(_coordinate_3, Direction.UP);
                    output.add(_blizzard_3);
                  }
                }
              }
            };
            new IntegerRange(1, Day24.WALL_RIGHT).forEach(_function);
          }
        };
        new IntegerRange(1, Day24.WALL_DOWN).forEach(_function);
        _xblockexpression = output;
      }
      return _xblockexpression;
    }
  }.apply();

  private static final Map<Integer, Set<Coordinate>> current_blizzards = CollectionLiterals.<Integer, Set<Coordinate>>newHashMap();

  public static void main(final String[] args) {
    Day24.PositionTimed.current_arrival = Day24.arrival;
    Day24.PositionTimed _positionTimed = new Day24.PositionTimed(Day24.departure, 0);
    AStar computation = new AStar(_positionTimed).run();
    Integer current_time = computation.getMinDistance();
    InputOutput.<Integer>println(current_time);
    Day24.PositionTimed.current_arrival = Day24.departure;
    Day24.PositionTimed _positionTimed_1 = new Day24.PositionTimed(Day24.arrival, (current_time).intValue());
    computation = new AStar(_positionTimed_1).run();
    Integer _minDistance = computation.run().getMinDistance();
    int _plus = ((current_time).intValue() + (_minDistance).intValue());
    current_time = Integer.valueOf(_plus);
    Day24.PositionTimed.current_arrival = Day24.arrival;
    Day24.PositionTimed _positionTimed_2 = new Day24.PositionTimed(Day24.departure, (current_time).intValue());
    computation = new AStar(_positionTimed_2).run();
    Integer _minDistance_1 = computation.run().getMinDistance();
    int _plus_1 = ((current_time).intValue() + (_minDistance_1).intValue());
    current_time = Integer.valueOf(_plus_1);
    InputOutput.<Integer>println(current_time);
  }

  public static Set<Coordinate> getBlizzardsAtTime(final int t) {
    Set<Coordinate> _xblockexpression = null;
    {
      boolean _containsKey = Day24.current_blizzards.containsKey(Integer.valueOf(t));
      boolean _not = (!_containsKey);
      if (_not) {
        final Function1<Day24.Blizzard, Coordinate> _function = new Function1<Day24.Blizzard, Coordinate>() {
          public Coordinate apply(final Day24.Blizzard it) {
            return it.getCurrentPosition(t);
          }
        };
        Day24.current_blizzards.put(Integer.valueOf(t), IterableExtensions.<Coordinate>toSet(ListExtensions.<Day24.Blizzard, Coordinate>map(Day24.blizzards, _function)));
      }
      _xblockexpression = Day24.current_blizzards.get(Integer.valueOf(t));
    }
    return _xblockexpression;
  }
}
