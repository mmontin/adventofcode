package advent2023;

import adventutils.collection.Collection;
import adventutils.geometry.Coordinate;
import adventutils.geometry.Dir;
import adventutils.geometry.Direction;
import adventutils.input.InputLoader;
import adventutils.pathfinding.AStar;
import adventutils.pathfinding.State;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day17 {
  public static class DirectedCoordinate extends Coordinate implements State {
    private final int hashCode;

    private Direction direction;

    public DirectedCoordinate(final int i, final int j, final Direction d) {
      super(i, j);
      this.direction = d;
      int _hashCode = super.hashCode();
      int _hashCode_1 = d.hashCode();
      int _multiply = (_hashCode * _hashCode_1);
      this.hashCode = _multiply;
    }

    @Override
    public boolean isGoal() {
      return super.equals(Day17.target);
    }

    @Override
    public int minToGoal() {
      return this.manhattanDistanceTo(Day17.target);
    }

    @Override
    public Iterable<Pair<? extends State, Integer>> neighbours() {
      HashSet<Pair<? extends State, Integer>> _xblockexpression = null;
      {
        final Set<Direction> directions = Dir.allDirections();
        directions.remove(this.direction);
        directions.remove(Dir.opposite(this.direction));
        final Function2<HashSet<Pair<? extends State, Integer>>, Direction, HashSet<Pair<? extends State, Integer>>> _function = (HashSet<Pair<? extends State, Integer>> output, Direction d) -> {
          HashSet<Pair<? extends State, Integer>> _xblockexpression_1 = null;
          {
            final Function2<Integer, Integer, Integer> _function_1 = (Integer acc, Integer i) -> {
              Integer _xblockexpression_2 = null;
              {
                Pair<Coordinate, Day17.DirectedCoordinate> _switchResult = null;
                if (d != null) {
                  switch (d) {
                    case UP:
                      int _x = this.getX();
                      int _minus = (_x - (i).intValue());
                      int _y = this.getY();
                      Coordinate _coordinate = new Coordinate(_minus, _y);
                      int _x_1 = this.getX();
                      int _minus_1 = (_x_1 - (i).intValue());
                      int _y_1 = this.getY();
                      Day17.DirectedCoordinate _directedCoordinate = new Day17.DirectedCoordinate(_minus_1, _y_1, d);
                      _switchResult = Pair.<Coordinate, Day17.DirectedCoordinate>of(_coordinate, _directedCoordinate);
                      break;
                    case DOWN:
                      int _x_2 = this.getX();
                      int _plus = (_x_2 + (i).intValue());
                      int _y_2 = this.getY();
                      Coordinate _coordinate_1 = new Coordinate(_plus, _y_2);
                      int _x_3 = this.getX();
                      int _plus_1 = (_x_3 + (i).intValue());
                      int _y_3 = this.getY();
                      Day17.DirectedCoordinate _directedCoordinate_1 = new Day17.DirectedCoordinate(_plus_1, _y_3, d);
                      _switchResult = Pair.<Coordinate, Day17.DirectedCoordinate>of(_coordinate_1, _directedCoordinate_1);
                      break;
                    case LEFT:
                      int _x_4 = this.getX();
                      int _y_4 = this.getY();
                      int _minus_2 = (_y_4 - (i).intValue());
                      Coordinate _coordinate_2 = new Coordinate(_x_4, _minus_2);
                      int _x_5 = this.getX();
                      int _y_5 = this.getY();
                      int _minus_3 = (_y_5 - (i).intValue());
                      Day17.DirectedCoordinate _directedCoordinate_2 = new Day17.DirectedCoordinate(_x_5, _minus_3, d);
                      _switchResult = Pair.<Coordinate, Day17.DirectedCoordinate>of(_coordinate_2, _directedCoordinate_2);
                      break;
                    case RIGHT:
                      int _x_6 = this.getX();
                      int _y_6 = this.getY();
                      int _plus_2 = (_y_6 + (i).intValue());
                      Coordinate _coordinate_3 = new Coordinate(_x_6, _plus_2);
                      int _x_7 = this.getX();
                      int _y_7 = this.getY();
                      int _plus_3 = (_y_7 + (i).intValue());
                      Day17.DirectedCoordinate _directedCoordinate_3 = new Day17.DirectedCoordinate(_x_7, _plus_3, d);
                      _switchResult = Pair.<Coordinate, Day17.DirectedCoordinate>of(_coordinate_3, _directedCoordinate_3);
                      break;
                    default:
                      break;
                  }
                }
                final Pair<Coordinate, Day17.DirectedCoordinate> newCoords = _switchResult;
                final Integer h = Day17.heat.get(newCoords.getKey());
                Integer ans = acc;
                if ((h != null)) {
                  ans = Integer.valueOf(((acc).intValue() + (h).intValue()));
                  if (((i).intValue() >= Day17.min_offset)) {
                    Day17.DirectedCoordinate _value = newCoords.getValue();
                    Pair<Day17.DirectedCoordinate, Integer> _mappedTo = Pair.<Day17.DirectedCoordinate, Integer>of(_value, ans);
                    output.add(_mappedTo);
                  }
                }
                _xblockexpression_2 = ans;
              }
              return _xblockexpression_2;
            };
            IterableExtensions.<Integer, Integer>fold(new ExclusiveRange(1, (Day17.max_offset + 1), true), Integer.valueOf(0), _function_1);
            _xblockexpression_1 = output;
          }
          return _xblockexpression_1;
        };
        _xblockexpression = IterableExtensions.<Direction, HashSet<Pair<? extends State, Integer>>>fold(directions, CollectionLiterals.<Pair<? extends State, Integer>>newHashSet(), _function);
      }
      return _xblockexpression;
    }

    @Override
    public String toString() {
      return super.toString();
    }

    @Override
    public int hashCode() {
      return this.hashCode;
    }

    @Override
    public boolean equals(final Object other) {
      boolean _xblockexpression = false;
      {
        final Day17.DirectedCoordinate c = ((Day17.DirectedCoordinate) other);
        _xblockexpression = (super.equals(other) && c.direction.equals(this.direction));
      }
      return _xblockexpression;
    }
  }

  private static final List<List<String>> chars = new InputLoader(Integer.valueOf(2023), Integer.valueOf(17)).getChars();

  private static final int max_x = (Day17.chars.size() - 1);

  private static final int max_y = (Day17.chars.get(0).size() - 1);

  private static final Map<Coordinate, Integer> heat = Collection.<Coordinate, Integer, Integer, Integer>aggregateToMap(new IntegerRange(0, Day17.max_x), ((Function2<Integer, Map<Coordinate, Integer>, Integer>) (Integer i, Map<Coordinate, Integer> heat_1) -> {
    int _xblockexpression = (int) 0;
    {
      final List<String> current_line = Day17.chars.get((i).intValue());
      final Consumer<Integer> _function = (Integer j) -> {
        Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
        heat_1.put(_coordinate, Integer.valueOf(Integer.parseInt(current_line.get((j).intValue()))));
      };
      new IntegerRange(0, Day17.max_y).forEach(_function);
      _xblockexpression = 0;
    }
    return Integer.valueOf(_xblockexpression);
  }));

  private static final Coordinate target = new Coordinate(Day17.max_x, Day17.max_y);

  private static final Day17.DirectedCoordinate source = new Day17.DirectedCoordinate(0, 0, Direction.UP);

  private static int min_offset;

  private static int max_offset;

  public static void main(final String[] args) {
    Day17.min_offset = 1;
    Day17.max_offset = 3;
    final AStar aStar = new AStar(Day17.source);
    InputOutput.<Integer>println(aStar.run().getMinDistance());
    Day17.min_offset = 4;
    Day17.max_offset = 10;
    aStar.initialize(Day17.source);
    InputOutput.<Integer>println(aStar.run().getMinDistance());
  }
}
