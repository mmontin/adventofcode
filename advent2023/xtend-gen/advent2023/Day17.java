package advent2023;

import adventutils.collection.Collection;
import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;
import adventutils.pathfinding.AStar;
import adventutils.pathfinding.State;
import com.google.common.base.Objects;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day17 {
  public static class MyCoordinate extends Coordinate implements State {
    private List<Coordinate.Direction> last_directions;

    private final int hashCode;

    public MyCoordinate(final int i, final int j, final List<Coordinate.Direction> directions) {
      super(i, j);
      this.last_directions = directions;
      int _hashCode = super.hashCode();
      int _hashCode_1 = this.last_directions.hashCode();
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
      ArrayList<Pair<? extends State, Integer>> _xblockexpression = null;
      {
        ArrayList<Coordinate.Direction> _switchResult = null;
        int _size = this.last_directions.size();
        final int x = _size;
        boolean _matched = false;
        if (Objects.equal(x, 0)) {
          _matched=true;
          _switchResult = CollectionLiterals.<Coordinate.Direction>newArrayList(Coordinate.Direction.DOWN, Coordinate.Direction.RIGHT);
        }
        if (!_matched) {
          if ((x < 3)) {
            _matched=true;
            ArrayList<Coordinate.Direction> _xblockexpression_1 = null;
            {
              final ArrayList<Coordinate.Direction> output = CollectionLiterals.<Coordinate.Direction>newArrayList(Coordinate.Direction.DOWN, Coordinate.Direction.UP, Coordinate.Direction.RIGHT, Coordinate.Direction.LEFT);
              output.remove(Coordinate.opposite(IterableExtensions.<Coordinate.Direction>last(this.last_directions)));
              _xblockexpression_1 = output;
            }
            _switchResult = _xblockexpression_1;
          }
        }
        if (!_matched) {
          ArrayList<Coordinate.Direction> _xblockexpression_2 = null;
          {
            final ArrayList<Coordinate.Direction> output = CollectionLiterals.<Coordinate.Direction>newArrayList(Coordinate.Direction.DOWN, Coordinate.Direction.UP, Coordinate.Direction.RIGHT, Coordinate.Direction.LEFT);
            output.remove(Coordinate.opposite(IterableExtensions.<Coordinate.Direction>last(this.last_directions)));
            int _size_1 = IterableExtensions.<Coordinate.Direction>toSet(this.last_directions).size();
            boolean _equals = (_size_1 == 1);
            if (_equals) {
              output.remove(IterableExtensions.<Coordinate.Direction>last(this.last_directions));
            }
            _xblockexpression_2 = output;
          }
          _switchResult = _xblockexpression_2;
        }
        final ArrayList<Coordinate.Direction> next_directions = _switchResult;
        final ArrayList<Pair<? extends State, Integer>> output = CollectionLiterals.<Pair<? extends State, Integer>>newArrayList();
        final Consumer<Coordinate.Direction> _function = (Coordinate.Direction it) -> {
          final Coordinate next_coordinate = this.otherMove(it);
          boolean _containsKey = Day17.heat.containsKey(next_coordinate);
          if (_containsKey) {
            ArrayList<Coordinate.Direction> _xifexpression = null;
            int _size_1 = this.last_directions.size();
            boolean _lessThan = (_size_1 < 3);
            if (_lessThan) {
              _xifexpression = new ArrayList<Coordinate.Direction>(this.last_directions);
            } else {
              List<Coordinate.Direction> _subList = this.last_directions.subList(1, 3);
              _xifexpression = new ArrayList<Coordinate.Direction>(_subList);
            }
            final ArrayList<Coordinate.Direction> next_list = _xifexpression;
            next_list.add(it);
            int _x = next_coordinate.getX();
            int _y = next_coordinate.getY();
            Day17.MyCoordinate _myCoordinate = new Day17.MyCoordinate(_x, _y, next_list);
            Integer _get = Day17.heat.get(next_coordinate);
            Pair<Day17.MyCoordinate, Integer> _mappedTo = Pair.<Day17.MyCoordinate, Integer>of(_myCoordinate, _get);
            output.add(_mappedTo);
          }
        };
        next_directions.forEach(_function);
        _xblockexpression = output;
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
        final Day17.MyCoordinate c = ((Day17.MyCoordinate) other);
        _xblockexpression = (super.equals(other) && c.last_directions.equals(this.last_directions));
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

  public static void main(final String[] args) {
    ArrayList<Coordinate.Direction> _newArrayList = CollectionLiterals.<Coordinate.Direction>newArrayList();
    Day17.MyCoordinate _myCoordinate = new Day17.MyCoordinate(0, 0, _newArrayList);
    final AStar aStar = new AStar(_myCoordinate);
    InputOutput.<Integer>println(aStar.run().getMinDistance());
  }
}
