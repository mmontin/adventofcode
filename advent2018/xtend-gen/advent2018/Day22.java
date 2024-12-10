package advent2018;

import adventutils.MemoryRunner;
import adventutils.geometry.Coordinate;
import adventutils.pathfinding.AStar;
import adventutils.pathfinding.State;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.function.Function;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day22 {
  public static class Position implements State {
    private Coordinate position;

    private int currentTool;

    public Position(final Coordinate c, final int tool) {
      this.position = c;
      this.currentTool = tool;
    }

    @Override
    public boolean equals(final Object other) {
      boolean _switchResult = false;
      boolean _matched = false;
      if (other instanceof Day22.Position) {
        _matched=true;
        _switchResult = (((Day22.Position)other).position.equals(this.position) && (((Day22.Position)other).currentTool == this.currentTool));
      }
      if (!_matched) {
        _switchResult = false;
      }
      return _switchResult;
    }

    @Override
    public int hashCode() {
      int _hashCode = this.position.hashCode();
      return (_hashCode * this.currentTool);
    }

    @Override
    public boolean isGoal() {
      return (this.position.equals(Day22.target) && (this.currentTool == 1));
    }

    @Override
    public int minToGoal() {
      int _manhattanDistanceTo = this.position.manhattanDistanceTo(Day22.target);
      int _xifexpression = (int) 0;
      if ((this.currentTool == 1)) {
        _xifexpression = 0;
      } else {
        _xifexpression = 7;
      }
      return (_manhattanDistanceTo + _xifexpression);
    }

    @Override
    public String toString() {
      return (((("{" + this.position) + " ; ") + Integer.valueOf(this.currentTool)) + "}");
    }

    @Override
    public Iterable<Pair<? extends State, Integer>> neighbours() {
      Iterable<Pair<? extends State, Integer>> _xifexpression = null;
      boolean _equals = this.position.equals(Day22.target);
      if (_equals) {
        Day22.Position _position = new Day22.Position(this.position, 1);
        Pair<Day22.Position, Integer> _mappedTo = Pair.<Day22.Position, Integer>of(_position, Integer.valueOf(7));
        _xifexpression = Collections.<Pair<? extends State, Integer>>unmodifiableSet(CollectionLiterals.<Pair<? extends State, Integer>>newHashSet(_mappedTo));
      } else {
        Iterable<Pair<? extends State, Integer>> _xblockexpression = null;
        {
          final Integer current_value = Day22.runner.call(this.position).get(2);
          final Function1<Coordinate, Boolean> _function = (Coordinate it) -> {
            return Boolean.valueOf(((it.getX() >= 0) && (it.getY() >= 0)));
          };
          final Function1<Coordinate, Pair<? extends State, Integer>> _function_1 = (Coordinate it) -> {
            Pair<Day22.Position, Integer> _xblockexpression_1 = null;
            {
              final Integer next_value = Day22.runner.call(it).get(2);
              Pair<Day22.Position, Integer> _xifexpression_1 = null;
              if ((this.currentTool != (next_value).intValue())) {
                Day22.Position _position_1 = new Day22.Position(it, this.currentTool);
                _xifexpression_1 = Pair.<Day22.Position, Integer>of(_position_1, Integer.valueOf(1));
              } else {
                Pair<Day22.Position, Integer> _xblockexpression_2 = null;
                {
                  final Function1<Integer, Boolean> _function_2 = (Integer it_1) -> {
                    boolean _contains = Collections.<Integer>unmodifiableSet(CollectionLiterals.<Integer>newHashSet(current_value, next_value)).contains(it_1);
                    return Boolean.valueOf((!_contains));
                  };
                  final Integer nextTool = IterableExtensions.<Integer>head(IterableExtensions.<Integer>filter(Day22.surfaces, _function_2));
                  Day22.Position _position_2 = new Day22.Position(it, (nextTool).intValue());
                  _xblockexpression_2 = Pair.<Day22.Position, Integer>of(_position_2, Integer.valueOf(8));
                }
                _xifexpression_1 = _xblockexpression_2;
              }
              _xblockexpression_1 = _xifexpression_1;
            }
            return _xblockexpression_1;
          };
          _xblockexpression = IterableExtensions.<Coordinate, Pair<? extends State, Integer>>map(IterableExtensions.<Coordinate>filter(this.position.noDiagonalUnboundedNeighbours(), _function), _function_1);
        }
        _xifexpression = _xblockexpression;
      }
      return _xifexpression;
    }
  }

  private static final int rocky = 0;

  private static final int wet = 1;

  private static final int narrow = 2;

  private static final Set<Integer> surfaces = Collections.<Integer>unmodifiableSet(CollectionLiterals.<Integer>newHashSet(Integer.valueOf(Day22.rocky), Integer.valueOf(Day22.wet), Integer.valueOf(Day22.narrow)));

  private static final int depth = 11109;

  private static final Coordinate source = new Coordinate(0, 0);

  private static final Coordinate target = new Coordinate(9, 731);

  private static final int modulo = 20183;

  public static void main(final String[] args) {
    int _x = Day22.target.getX();
    final Function2<Integer, Integer, Integer> _function = (Integer acc, Integer i) -> {
      int _y = Day22.target.getY();
      final Function2<Integer, Integer, Integer> _function_1 = (Integer acc1, Integer j) -> {
        Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
        Integer _get = Day22.runner.call(_coordinate).get(2);
        return Integer.valueOf(((acc1).intValue() + (_get).intValue()));
      };
      return IterableExtensions.<Integer, Integer>fold(new IntegerRange(0, _y), acc, _function_1);
    };
    InputOutput.<Integer>println(IterableExtensions.<Integer, Integer>fold(new IntegerRange(0, _x), Integer.valueOf(0), _function));
    Day22.Position _position = new Day22.Position(Day22.source, 1);
    InputOutput.<Integer>println(new AStar(_position).run().getMinDistance());
  }

  private static final MemoryRunner<Coordinate, List<Integer>> runner = new MemoryRunner<Coordinate, List<Integer>>(((Function<Coordinate, List<Integer>>) (Coordinate it) -> {
    return Day22.populate(it);
  }));

  public static List<Integer> populate(final Coordinate c) {
    ArrayList<Integer> _xblockexpression = null;
    {
      int _xifexpression = (int) 0;
      if ((c.equals(Day22.source) || c.equals(Day22.target))) {
        _xifexpression = 0;
      } else {
        int _xifexpression_1 = (int) 0;
        int _y = c.getY();
        boolean _equals = (_y == 0);
        if (_equals) {
          int _x = c.getX();
          _xifexpression_1 = (_x * 16807);
        } else {
          int _xifexpression_2 = (int) 0;
          int _x_1 = c.getX();
          boolean _equals_1 = (_x_1 == 0);
          if (_equals_1) {
            int _y_1 = c.getY();
            _xifexpression_2 = (_y_1 * 48271);
          } else {
            Integer _get = Day22.runner.call(c.addX((-1))).get(1);
            Integer _get_1 = Day22.runner.call(c.addY((-1))).get(1);
            _xifexpression_2 = ((_get).intValue() * (_get_1).intValue());
          }
          _xifexpression_1 = _xifexpression_2;
        }
        _xifexpression = _xifexpression_1;
      }
      final int geo = _xifexpression;
      final int ero = ((geo + Day22.depth) % Day22.modulo);
      _xblockexpression = CollectionLiterals.<Integer>newArrayList(Integer.valueOf(geo), Integer.valueOf(ero), Integer.valueOf((ero % 3)));
    }
    return _xblockexpression;
  }
}
