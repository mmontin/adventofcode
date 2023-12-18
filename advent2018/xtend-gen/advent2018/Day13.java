package advent2018;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;
import com.google.common.base.Objects;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Day13 {
  public static class Robot {
    public Coordinate position;

    private Coordinate.Direction facing;

    private Coordinate.Direction next_direction;

    public Robot(final Coordinate _position, final Coordinate.Direction _facing) {
      this.position = _position;
      this.facing = _facing;
      this.next_direction = Coordinate.Direction.LEFT;
    }

    public Coordinate.Direction turn() {
      Coordinate.Direction _switchResult = null;
      final Coordinate.Direction next_direction = this.next_direction;
      if (next_direction != null) {
        switch (next_direction) {
          case LEFT:
            Coordinate.Direction _xblockexpression = null;
            {
              this.facing = Coordinate.counterClockWise(this.facing);
              _xblockexpression = this.next_direction = Coordinate.Direction.UP;
            }
            _switchResult = _xblockexpression;
            break;
          case RIGHT:
            Coordinate.Direction _xblockexpression_1 = null;
            {
              this.facing = Coordinate.clockWise(this.facing);
              _xblockexpression_1 = this.next_direction = Coordinate.Direction.LEFT;
            }
            _switchResult = _xblockexpression_1;
            break;
          default:
            _switchResult = this.next_direction = Coordinate.Direction.RIGHT;
            break;
        }
      } else {
        _switchResult = this.next_direction = Coordinate.Direction.RIGHT;
      }
      return _switchResult;
    }

    public Coordinate.Direction move() {
      Coordinate.Direction _xblockexpression = null;
      {
        this.position = this.position.otherMove(this.facing);
        Coordinate.Direction _switchResult = null;
        String _get = Day13.terrain.get(this.position);
        if (_get != null) {
          switch (_get) {
            case "+":
              _switchResult = this.turn();
              break;
            case "/":
              Coordinate.Direction _switchResult_1 = null;
              final Coordinate.Direction facing = this.facing;
              if (facing != null) {
                switch (facing) {
                  case UP:
                    _switchResult_1 = Coordinate.Direction.RIGHT;
                    break;
                  case RIGHT:
                    _switchResult_1 = Coordinate.Direction.UP;
                    break;
                  case LEFT:
                    _switchResult_1 = Coordinate.Direction.DOWN;
                    break;
                  case DOWN:
                    _switchResult_1 = Coordinate.Direction.LEFT;
                    break;
                  default:
                    break;
                }
              }
              _switchResult = this.facing = _switchResult_1;
              break;
            case "\\":
              Coordinate.Direction _switchResult_2 = null;
              final Coordinate.Direction facing_1 = this.facing;
              if (facing_1 != null) {
                switch (facing_1) {
                  case UP:
                    _switchResult_2 = Coordinate.Direction.LEFT;
                    break;
                  case LEFT:
                    _switchResult_2 = Coordinate.Direction.UP;
                    break;
                  case RIGHT:
                    _switchResult_2 = Coordinate.Direction.DOWN;
                    break;
                  case DOWN:
                    _switchResult_2 = Coordinate.Direction.RIGHT;
                    break;
                  default:
                    break;
                }
              }
              _switchResult = this.facing = _switchResult_2;
              break;
            default:
              _switchResult = null;
              break;
          }
        } else {
          _switchResult = null;
        }
        _xblockexpression = _switchResult;
      }
      return _xblockexpression;
    }

    @Override
    public String toString() {
      String _string = this.position.toString();
      String _plus = (_string + " ; facing ");
      String _plus_1 = (_plus + this.facing);
      String _plus_2 = (_plus_1 + " ; next_turn : ");
      return (_plus_2 + this.next_direction);
    }
  }

  private static final Map<Coordinate, String> terrain = CollectionLiterals.<Coordinate, String>newHashMap();

  private static final Set<Day13.Robot> robots = CollectionLiterals.<Day13.Robot>newHashSet();

  public static Day13.Robot tick() {
    final Function1<Day13.Robot, String> _function = (Day13.Robot it) -> {
      return it.position.toString();
    };
    final Function1<Day13.Robot, Boolean> _function_1 = (Day13.Robot it) -> {
      boolean _xblockexpression = false;
      {
        it.move();
        final Function1<Day13.Robot, Boolean> _function_2 = (Day13.Robot other) -> {
          return Boolean.valueOf(((!Objects.equal(other, it)) && other.position.equals(it.position)));
        };
        _xblockexpression = IterableExtensions.<Day13.Robot>exists(Day13.robots, _function_2);
      }
      return Boolean.valueOf(_xblockexpression);
    };
    return IterableExtensions.<Day13.Robot>findFirst(IterableExtensions.<Day13.Robot, String>sortBy(Day13.robots, _function), _function_1);
  }

  public static void wholeTick() {
    final Function1<Day13.Robot, String> _function = (Day13.Robot it) -> {
      return it.position.toString();
    };
    final Consumer<Day13.Robot> _function_1 = (Day13.Robot it) -> {
      boolean _contains = Day13.robots.contains(it);
      if (_contains) {
        it.move();
        final Function1<Day13.Robot, Boolean> _function_2 = (Day13.Robot other) -> {
          return Boolean.valueOf(((!Objects.equal(other, it)) && other.position.equals(it.position)));
        };
        final Day13.Robot other = IterableExtensions.<Day13.Robot>findFirst(Day13.robots, _function_2);
        if ((other != null)) {
          Day13.robots.remove(it);
          Day13.robots.remove(other);
        }
      }
    };
    IterableExtensions.<Day13.Robot, String>sortBy(Day13.robots, _function).forEach(_function_1);
  }

  public static void init() {
    Day13.robots.clear();
    Day13.terrain.clear();
    final Function1<String, List<String>> _function = (String it) -> {
      final Function1<Character, String> _function_1 = (Character it_1) -> {
        return it_1.toString();
      };
      return ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray(it.toCharArray())), _function_1);
    };
    final List<List<String>> input = ListExtensions.<String, List<String>>map(new InputLoader(Integer.valueOf(2018), Integer.valueOf(13)).getInputs(), _function);
    int _size = input.size();
    final int max_x = (_size - 1);
    int _size_1 = input.get(0).size();
    final int max_y = (_size_1 - 1);
    final Consumer<Integer> _function_1 = (Integer i) -> {
      final Consumer<Integer> _function_2 = (Integer j) -> {
        final Coordinate current = new Coordinate((i).intValue(), (j).intValue());
        String _get = input.get((i).intValue()).get((j).intValue());
        final String x = _get;
        if (x != null) {
          switch (x) {
            case " ":
              break;
            case "<":
              Day13.Robot _robot = new Day13.Robot(current, Coordinate.Direction.LEFT);
              Day13.robots.add(_robot);
              Day13.terrain.put(current, "-");
              break;
            case ">":
              Day13.Robot _robot_1 = new Day13.Robot(current, Coordinate.Direction.RIGHT);
              Day13.robots.add(_robot_1);
              Day13.terrain.put(current, "-");
              break;
            case "v":
              Day13.Robot _robot_2 = new Day13.Robot(current, Coordinate.Direction.DOWN);
              Day13.robots.add(_robot_2);
              Day13.terrain.put(current, "|");
              break;
            case "^":
              Day13.Robot _robot_3 = new Day13.Robot(current, Coordinate.Direction.UP);
              Day13.robots.add(_robot_3);
              Day13.terrain.put(current, "|");
              break;
            default:
              Day13.terrain.put(current, x);
              break;
          }
        } else {
          Day13.terrain.put(current, x);
        }
      };
      new IntegerRange(0, max_y).forEach(_function_2);
    };
    new IntegerRange(0, max_x).forEach(_function_1);
  }

  public static void main(final String[] args) {
    Day13.init();
    Day13.Robot first_collision = null;
    while ((first_collision == null)) {
      first_collision = Day13.tick();
    }
    int _y = first_collision.position.getY();
    String _plus = (Integer.valueOf(_y) + ",");
    int _x = first_collision.position.getX();
    String _plus_1 = (_plus + Integer.valueOf(_x));
    InputOutput.<String>println(_plus_1);
    Day13.init();
    while ((Day13.robots.size() != 1)) {
      Day13.wholeTick();
    }
    int _y_1 = IterableExtensions.<Day13.Robot>head(Day13.robots).position.getY();
    String _plus_2 = (Integer.valueOf(_y_1) + ",");
    int _x_1 = IterableExtensions.<Day13.Robot>head(Day13.robots).position.getX();
    String _plus_3 = (_plus_2 + Integer.valueOf(_x_1));
    InputOutput.<String>println(_plus_3);
  }
}
