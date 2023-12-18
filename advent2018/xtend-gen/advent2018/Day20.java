package advent2018;

import adventutils.geometry.Coordinate;
import adventutils.geometry.Dir;
import adventutils.geometry.Direction;
import adventutils.input.InputLoader;
import adventutils.pathfinding.AStar;
import adventutils.pathfinding.NotInitializedException;
import adventutils.pathfinding.State;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.Stack;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
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
    public Iterable<Pair<? extends State, Integer>> neighbours() {
      final Function1<Day20.MyCoordinate, Pair<? extends State, Integer>> _function = (Day20.MyCoordinate x) -> {
        return Pair.<State, Integer>of(((State) x), Integer.valueOf(1));
      };
      return IterableExtensions.<Day20.MyCoordinate, Pair<? extends State, Integer>>map(this.friends, _function);
    }

    @Override
    public String toString() {
      String _string = super.toString();
      String _plus = (_string + " : ");
      int _size = this.friends.size();
      return (_plus + Integer.valueOf(_size));
    }
  }

  public static void main(final String[] args) {
    final Day20.MyCoordinate start = new Day20.MyCoordinate(0, 0);
    final List<Day20.MyCoordinate> discovered = CollectionLiterals.<Day20.MyCoordinate>newArrayList(start);
    final Stack<Set<Day20.MyCoordinate>> current_stack = new Stack<Set<Day20.MyCoordinate>>();
    current_stack.push(CollectionLiterals.<Day20.MyCoordinate>newHashSet(start));
    final Function1<Character, String> _function = (Character it) -> {
      return (it + "");
    };
    final Consumer<String> _function_1 = (String s) -> {
      if (s != null) {
        switch (s) {
          case "(":
            final HashSet<Day20.MyCoordinate> new_last = CollectionLiterals.<Day20.MyCoordinate>newHashSet();
            new_last.addAll(current_stack.peek());
            current_stack.push(new_last);
            break;
          case "|":
            final Set<Day20.MyCoordinate> last = current_stack.pop();
            final Set<Day20.MyCoordinate> before_last = current_stack.pop();
            current_stack.push(last);
            current_stack.push(before_last);
            break;
          case ")":
            final Set<Day20.MyCoordinate> last_1 = current_stack.pop();
            current_stack.peek().addAll(last_1);
            break;
          default:
            {
              final Direction direction = Dir.directionFromPole(s);
              final HashSet<Day20.MyCoordinate> next_coords = CollectionLiterals.<Day20.MyCoordinate>newHashSet();
              final Consumer<Day20.MyCoordinate> _function_2 = (Day20.MyCoordinate c) -> {
                final Coordinate next_coord = c.otherMove(direction);
                final int index = discovered.indexOf(next_coord);
                Day20.MyCoordinate _xifexpression = null;
                if ((index == (-1))) {
                  Day20.MyCoordinate _xblockexpression = null;
                  {
                    int _x = next_coord.getX();
                    int _y = next_coord.getY();
                    final Day20.MyCoordinate tmp = new Day20.MyCoordinate(_x, _y);
                    discovered.add(tmp);
                    _xblockexpression = tmp;
                  }
                  _xifexpression = _xblockexpression;
                } else {
                  _xifexpression = discovered.get(index);
                }
                final Day20.MyCoordinate my_next_coord = _xifexpression;
                my_next_coord.addFriend(c);
                next_coords.add(my_next_coord);
              };
              current_stack.pop().forEach(_function_2);
              current_stack.push(next_coords);
            }
            break;
        }
      } else {
        {
          final Direction direction = Dir.directionFromPole(s);
          final HashSet<Day20.MyCoordinate> next_coords = CollectionLiterals.<Day20.MyCoordinate>newHashSet();
          final Consumer<Day20.MyCoordinate> _function_2 = (Day20.MyCoordinate c) -> {
            final Coordinate next_coord = c.otherMove(direction);
            final int index = discovered.indexOf(next_coord);
            Day20.MyCoordinate _xifexpression = null;
            if ((index == (-1))) {
              Day20.MyCoordinate _xblockexpression = null;
              {
                int _x = next_coord.getX();
                int _y = next_coord.getY();
                final Day20.MyCoordinate tmp = new Day20.MyCoordinate(_x, _y);
                discovered.add(tmp);
                _xblockexpression = tmp;
              }
              _xifexpression = _xblockexpression;
            } else {
              _xifexpression = discovered.get(index);
            }
            final Day20.MyCoordinate my_next_coord = _xifexpression;
            my_next_coord.addFriend(c);
            next_coords.add(my_next_coord);
          };
          current_stack.pop().forEach(_function_2);
          current_stack.push(next_coords);
        }
      }
    };
    ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray(new InputLoader(Integer.valueOf(2018), Integer.valueOf(20)).getInputs().get(0).toCharArray())), _function).forEach(_function_1);
    InputOutput.<Integer>println(Integer.valueOf(discovered.size()));
    final AStar searcher = new AStar(start);
    try {
      searcher.run();
    } catch (final Throwable _t) {
      if (_t instanceof NotInitializedException) {
        InputOutput.<Integer>println(IterableExtensions.<Integer>max(searcher.gScore.values()));
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
  }
}
