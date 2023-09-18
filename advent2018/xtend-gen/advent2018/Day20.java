package advent2018;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;
import adventutils.pathfinding.State;
import java.util.List;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day20 {
  public static class MyCoordinate extends Coordinate implements State {
    private Set<Day20.MyCoordinate> friends;

    public MyCoordinate(final int x, final int y) {
      super(x, y);
      this.friends = CollectionLiterals.<Day20.MyCoordinate>newHashSet();
    }

    @Override
    public boolean isGoal() {
      return false;
    }

    @Override
    public int minToGoal() {
      return 1;
    }

    public boolean addFriend(final Day20.MyCoordinate other) {
      boolean _xifexpression = false;
      boolean _add = this.friends.add(other);
      if (_add) {
        _xifexpression = other.friends.add(this);
      }
      return _xifexpression;
    }

    @Override
    public Iterable<Pair<State, Integer>> neighbours() {
      final Function1<Day20.MyCoordinate, Pair<State, Integer>> _function = (Day20.MyCoordinate x) -> {
        return Pair.<State, Integer>of(((State) x), Integer.valueOf(1));
      };
      return IterableExtensions.<Day20.MyCoordinate, Pair<State, Integer>>map(this.friends, _function);
    }
  }

  private static List<Day20.MyCoordinate> discovered = CollectionLiterals.<Day20.MyCoordinate>newArrayList();

  private static String input = new InputLoader(Integer.valueOf(2018), Integer.valueOf(20)).getInputs().get(0);

  public static void main(final String[] args) {
    final Day20.MyCoordinate start = new Day20.MyCoordinate(0, 0);
    Day20.discovered.add(start);
    Pair<Day20.MyCoordinate, Integer> _mappedTo = Pair.<Day20.MyCoordinate, Integer>of(start, Integer.valueOf(0));
    Day20.populate(_mappedTo);
    InputOutput.<Integer>println(Integer.valueOf(Day20.discovered.size()));
  }

  public static Pair<Day20.MyCoordinate, Integer> populate(final Pair<Day20.MyCoordinate, Integer> pair) {
    Pair<Day20.MyCoordinate, Integer> _xifexpression = null;
    Integer _value = pair.getValue();
    int _length = Day20.input.length();
    boolean _greaterEqualsThan = ((_value).intValue() >= _length);
    if (_greaterEqualsThan) {
      _xifexpression = pair;
    } else {
      Pair<Day20.MyCoordinate, Integer> _switchResult = null;
      char _charAt = Day20.input.charAt((pair.getValue()).intValue());
      String _plus = (Character.valueOf(_charAt) + "");
      final String s = _plus;
      if (s != null) {
        switch (s) {
          case "(":
            Day20.MyCoordinate _key = pair.getKey();
            Integer _value_1 = pair.getValue();
            int _plus_1 = ((_value_1).intValue() + 1);
            Pair<Day20.MyCoordinate, Integer> _mappedTo = Pair.<Day20.MyCoordinate, Integer>of(_key, Integer.valueOf(_plus_1));
            _switchResult = Day20.populate(Day20.populate(_mappedTo));
            break;
          case "|":
            Day20.MyCoordinate _key_1 = pair.getKey();
            Integer _value_2 = pair.getValue();
            int _plus_2 = ((_value_2).intValue() + 1);
            Pair<Day20.MyCoordinate, Integer> _mappedTo_1 = Pair.<Day20.MyCoordinate, Integer>of(_key_1, Integer.valueOf(_plus_2));
            _switchResult = Day20.populate(Day20.populate(_mappedTo_1));
            break;
          case ")":
            Day20.MyCoordinate _key_2 = pair.getKey();
            Integer _value_3 = pair.getValue();
            int _plus_3 = ((_value_3).intValue() + 1);
            _switchResult = Pair.<Day20.MyCoordinate, Integer>of(_key_2, Integer.valueOf(_plus_3));
            break;
          default:
            Pair<Day20.MyCoordinate, Integer> _xblockexpression = null;
            {
              final Coordinate.Direction direction = Coordinate.directionFromPole(s);
              final Coordinate next_coord = pair.getKey().otherMove(direction);
              final int index = Day20.discovered.indexOf(next_coord);
              Day20.MyCoordinate _xifexpression_1 = null;
              if ((index == (-1))) {
                Day20.MyCoordinate _xblockexpression_1 = null;
                {
                  int _x = next_coord.getX();
                  int _y = next_coord.getY();
                  final Day20.MyCoordinate tmp = new Day20.MyCoordinate(_x, _y);
                  Day20.discovered.add(tmp);
                  _xblockexpression_1 = tmp;
                }
                _xifexpression_1 = _xblockexpression_1;
              } else {
                _xifexpression_1 = Day20.discovered.get(index);
              }
              final Day20.MyCoordinate my_next_coord = _xifexpression_1;
              my_next_coord.addFriend(pair.getKey());
              Integer _value_4 = pair.getValue();
              int _plus_4 = ((_value_4).intValue() + 1);
              Pair<Day20.MyCoordinate, Integer> _mappedTo_2 = Pair.<Day20.MyCoordinate, Integer>of(my_next_coord, Integer.valueOf(_plus_4));
              _xblockexpression = Day20.populate(_mappedTo_2);
            }
            _switchResult = _xblockexpression;
            break;
        }
      } else {
        Pair<Day20.MyCoordinate, Integer> _xblockexpression = null;
        {
          final Coordinate.Direction direction = Coordinate.directionFromPole(s);
          final Coordinate next_coord = pair.getKey().otherMove(direction);
          final int index = Day20.discovered.indexOf(next_coord);
          Day20.MyCoordinate _xifexpression_1 = null;
          if ((index == (-1))) {
            Day20.MyCoordinate _xblockexpression_1 = null;
            {
              int _x = next_coord.getX();
              int _y = next_coord.getY();
              final Day20.MyCoordinate tmp = new Day20.MyCoordinate(_x, _y);
              Day20.discovered.add(tmp);
              _xblockexpression_1 = tmp;
            }
            _xifexpression_1 = _xblockexpression_1;
          } else {
            _xifexpression_1 = Day20.discovered.get(index);
          }
          final Day20.MyCoordinate my_next_coord = _xifexpression_1;
          my_next_coord.addFriend(pair.getKey());
          Integer _value_4 = pair.getValue();
          int _plus_4 = ((_value_4).intValue() + 1);
          Pair<Day20.MyCoordinate, Integer> _mappedTo_2 = Pair.<Day20.MyCoordinate, Integer>of(my_next_coord, Integer.valueOf(_plus_4));
          _xblockexpression = Day20.populate(_mappedTo_2);
        }
        _switchResult = _xblockexpression;
      }
      _xifexpression = _switchResult;
    }
    return _xifexpression;
  }
}
