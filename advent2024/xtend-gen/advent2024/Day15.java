package advent2024;

import adventutils.geometry.Coordinate;
import adventutils.geometry.Dir;
import adventutils.geometry.Direction;
import adventutils.input.InputLoader;
import com.google.common.collect.Iterables;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Day15 {
  public static class Obstacle {
    private Coordinate left;

    private Coordinate right;

    public Obstacle(final Coordinate left_) {
      this.left = left_;
      this.right = this.left.addY(1);
    }

    public Set<Coordinate> allCoords() {
      return Collections.<Coordinate>unmodifiableSet(CollectionLiterals.<Coordinate>newHashSet(this.left, this.right));
    }

    public Set<Coordinate> nextCoords(final Direction d) {
      Set<Coordinate> _switchResult = null;
      if (d != null) {
        switch (d) {
          case LEFT:
            Coordinate _addY = this.left.addY((-1));
            _switchResult = Collections.<Coordinate>unmodifiableSet(CollectionLiterals.<Coordinate>newHashSet(_addY));
            break;
          case RIGHT:
            Coordinate _addY_1 = this.right.addY(1);
            _switchResult = Collections.<Coordinate>unmodifiableSet(CollectionLiterals.<Coordinate>newHashSet(_addY_1));
            break;
          case UP:
            final Function1<Coordinate, Coordinate> _function = (Coordinate it) -> {
              return it.addX((-1));
            };
            _switchResult = IterableExtensions.<Coordinate>toSet(IterableExtensions.<Coordinate, Coordinate>map(this.allCoords(), _function));
            break;
          case DOWN:
            final Function1<Coordinate, Coordinate> _function_1 = (Coordinate it) -> {
              return it.addX(1);
            };
            _switchResult = IterableExtensions.<Coordinate>toSet(IterableExtensions.<Coordinate, Coordinate>map(this.allCoords(), _function_1));
            break;
          default:
            break;
        }
      }
      return _switchResult;
    }

    public Coordinate move(final Direction d) {
      Coordinate _switchResult = null;
      if (d != null) {
        switch (d) {
          case LEFT:
            Coordinate _xblockexpression = null;
            {
              this.left = this.left.addY((-1));
              _xblockexpression = this.right = this.right.addY((-1));
            }
            _switchResult = _xblockexpression;
            break;
          case RIGHT:
            Coordinate _xblockexpression_1 = null;
            {
              this.right = this.right.addY(1);
              _xblockexpression_1 = this.left = this.left.addY(1);
            }
            _switchResult = _xblockexpression_1;
            break;
          case UP:
            Coordinate _xblockexpression_2 = null;
            {
              this.left = this.left.addX((-1));
              _xblockexpression_2 = this.right = this.right.addX((-1));
            }
            _switchResult = _xblockexpression_2;
            break;
          case DOWN:
            Coordinate _xblockexpression_3 = null;
            {
              this.left = this.left.addX(1);
              _xblockexpression_3 = this.right = this.right.addX(1);
            }
            _switchResult = _xblockexpression_3;
            break;
          default:
            break;
        }
      }
      return _switchResult;
    }

    @Override
    public String toString() {
      String _plus = (this.left + " ; ");
      return (_plus + this.right);
    }
  }

  public static void main(final String[] args) {
    final List<String> input = new InputLoader(Integer.valueOf(2024), Integer.valueOf(15)).getInputs();
    final int blank = input.indexOf("");
    final int max_i = (blank - 1);
    int _length = input.get(0).length();
    final int max_j = (_length - 1);
    Coordinate robot = null;
    final HashSet<Coordinate> walls = CollectionLiterals.<Coordinate>newHashSet();
    HashSet<Coordinate> boxes = CollectionLiterals.<Coordinate>newHashSet();
    IntegerRange _upTo = new IntegerRange(0, max_i);
    for (final Integer i : _upTo) {
      {
        final Function1<Character, String> _function = (Character it) -> {
          return (it + "");
        };
        final List<String> current_line = ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray(input.get((i).intValue()).toCharArray())), _function);
        IntegerRange _upTo_1 = new IntegerRange(0, max_j);
        for (final Integer j : _upTo_1) {
          {
            final Coordinate current = new Coordinate((i).intValue(), (j).intValue());
            String _get = current_line.get((j).intValue());
            if (_get != null) {
              switch (_get) {
                case "@":
                  robot = current;
                  break;
                case "#":
                  walls.add(current);
                  break;
                case "O":
                  boxes.add(current);
                  break;
              }
            }
          }
        }
      }
    }
    final Function1<Character, Direction> _function = (Character it) -> {
      String _plus = (it + "");
      return Dir.directionFromStringArrows(_plus);
    };
    final List<Direction> directions = ListExtensions.<Character, Direction>map(((List<Character>)Conversions.doWrapArray(IterableExtensions.join(IterableExtensions.<String>drop(input, (blank + 1))).toCharArray())), _function);
    for (final Direction d : directions) {
      robot = Day15.move1(robot, d, walls, boxes);
    }
    final Function2<Integer, Coordinate, Integer> _function_1 = (Integer acc, Coordinate el) -> {
      int _x = el.getX();
      int _multiply = (100 * _x);
      int _plus = ((acc).intValue() + _multiply);
      int _y = el.getY();
      return Integer.valueOf((_plus + _y));
    };
    InputOutput.<Integer>println(IterableExtensions.<Coordinate, Integer>fold(boxes, Integer.valueOf(0), _function_1));
    final HashSet<Day15.Obstacle> obstacles = CollectionLiterals.<Day15.Obstacle>newHashSet();
    walls.clear();
    IntegerRange _upTo_1 = new IntegerRange(0, max_i);
    for (final Integer i_1 : _upTo_1) {
      {
        final Function1<Character, String> _function_2 = (Character it) -> {
          return (it + "");
        };
        final List<String> current_line = ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray(input.get((i_1).intValue()).toCharArray())), _function_2);
        IntegerRange _upTo_2 = new IntegerRange(0, max_j);
        for (final Integer j : _upTo_2) {
          {
            final Coordinate current_left = new Coordinate((i_1).intValue(), ((j).intValue() * 2));
            final Coordinate current_right = new Coordinate((i_1).intValue(), (((j).intValue() * 2) + 1));
            String _get = current_line.get((j).intValue());
            if (_get != null) {
              switch (_get) {
                case "@":
                  robot = current_left;
                  break;
                case "#":
                  walls.addAll(Collections.<Coordinate>unmodifiableSet(CollectionLiterals.<Coordinate>newHashSet(current_left, current_right)));
                  break;
                case "O":
                  Day15.Obstacle _obstacle = new Day15.Obstacle(current_left);
                  obstacles.add(_obstacle);
                  break;
              }
            }
          }
        }
      }
    }
    for (final Direction d_1 : directions) {
      robot = Day15.move2(robot, d_1, walls, obstacles);
    }
    final Function2<Integer, Day15.Obstacle, Integer> _function_2 = (Integer acc, Day15.Obstacle el) -> {
      int _x = el.left.getX();
      int _multiply = (100 * _x);
      int _plus = ((acc).intValue() + _multiply);
      int _y = el.left.getY();
      return Integer.valueOf((_plus + _y));
    };
    InputOutput.<Integer>println(IterableExtensions.<Day15.Obstacle, Integer>fold(obstacles, Integer.valueOf(0), _function_2));
  }

  public static Coordinate move2(final Coordinate robot, final Direction dir, final Set<Coordinate> walls, final Set<Day15.Obstacle> obstacles) {
    Coordinate _xblockexpression = null;
    {
      final Coordinate next_coord = robot.otherMove(dir);
      Set<Coordinate> next_coords = Collections.<Coordinate>unmodifiableSet(CollectionLiterals.<Coordinate>newHashSet(next_coord));
      final List<Day15.Obstacle> all_obstacles = CollectionLiterals.<Day15.Obstacle>newArrayList();
      while (((!IterableExtensions.<Coordinate>exists(next_coords, ((Function1<Coordinate, Boolean>) (Coordinate it) -> {
        return Boolean.valueOf(walls.contains(it));
      }))) && IterableExtensions.<Coordinate>exists(next_coords, ((Function1<Coordinate, Boolean>) (Coordinate c) -> {
        final Function1<Day15.Obstacle, Boolean> _function = (Day15.Obstacle it) -> {
          return Boolean.valueOf(it.allCoords().contains(c));
        };
        return Boolean.valueOf(IterableExtensions.<Day15.Obstacle>exists(obstacles, _function));
      })))) {
        {
          final Set<Coordinate> next_coords_bis = next_coords;
          final Function1<Day15.Obstacle, Boolean> _function = (Day15.Obstacle o) -> {
            final Function1<Coordinate, Boolean> _function_1 = (Coordinate it) -> {
              return Boolean.valueOf(o.allCoords().contains(it));
            };
            return Boolean.valueOf(IterableExtensions.<Coordinate>exists(next_coords_bis, _function_1));
          };
          final Iterable<Day15.Obstacle> next_obstacles = IterableExtensions.<Day15.Obstacle>filter(obstacles, _function);
          Iterables.<Day15.Obstacle>addAll(all_obstacles, next_obstacles);
          final Function2<HashSet<Coordinate>, Day15.Obstacle, HashSet<Coordinate>> _function_1 = (HashSet<Coordinate> acc, Day15.Obstacle o) -> {
            HashSet<Coordinate> _xblockexpression_1 = null;
            {
              acc.addAll(o.nextCoords(dir));
              _xblockexpression_1 = acc;
            }
            return _xblockexpression_1;
          };
          next_coords = IterableExtensions.<Day15.Obstacle, HashSet<Coordinate>>fold(next_obstacles, CollectionLiterals.<Coordinate>newHashSet(), _function_1);
        }
      }
      Coordinate _xifexpression = null;
      final Function1<Coordinate, Boolean> _function = (Coordinate it) -> {
        return Boolean.valueOf(walls.contains(it));
      };
      boolean _exists = IterableExtensions.<Coordinate>exists(next_coords, _function);
      if (_exists) {
        _xifexpression = robot;
      } else {
        Coordinate _xblockexpression_1 = null;
        {
          final Consumer<Day15.Obstacle> _function_1 = (Day15.Obstacle it) -> {
            it.move(dir);
          };
          all_obstacles.forEach(_function_1);
          _xblockexpression_1 = next_coord;
        }
        _xifexpression = _xblockexpression_1;
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }

  public static Coordinate move1(final Coordinate robot, final Direction dir, final Set<Coordinate> walls, final Set<Coordinate> boxes) {
    Coordinate _switchResult = null;
    Coordinate _otherMove = robot.otherMove(dir);
    final Coordinate next_coord = _otherMove;
    boolean _matched = false;
    boolean _contains = walls.contains(next_coord);
    if (_contains) {
      _matched=true;
      _switchResult = robot;
    }
    if (!_matched) {
      boolean _contains_1 = boxes.contains(next_coord);
      if (_contains_1) {
        _matched=true;
        Coordinate _xblockexpression = null;
        {
          final HashSet<Coordinate> box_line = CollectionLiterals.<Coordinate>newHashSet(next_coord);
          Coordinate next_box = next_coord.otherMove(dir);
          while (boxes.contains(next_box)) {
            {
              box_line.add(next_box);
              next_box = next_box.otherMove(dir);
            }
          }
          Coordinate _xifexpression = null;
          boolean _contains_2 = walls.contains(next_box);
          if (_contains_2) {
            _xifexpression = robot;
          } else {
            Coordinate _xblockexpression_1 = null;
            {
              boxes.remove(next_coord);
              boxes.add(next_box);
              _xblockexpression_1 = next_coord;
            }
            _xifexpression = _xblockexpression_1;
          }
          _xblockexpression = _xifexpression;
        }
        _switchResult = _xblockexpression;
      }
    }
    if (!_matched) {
      _switchResult = next_coord;
    }
    return _switchResult;
  }
}
