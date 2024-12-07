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
import java.util.Map;
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
    public MyCoordinate(final Coordinate c) {
      super(c);
    }

    @Override
    public boolean isGoal() {
      return false;
    }

    @Override
    public int minToGoal() {
      return 1;
    }

    @Override
    public Iterable<Pair<? extends State, Integer>> neighbours() {
      final Function1<Coordinate, Pair<? extends State, Integer>> _function = (Coordinate x) -> {
        Day20.MyCoordinate _myCoordinate = new Day20.MyCoordinate(x);
        return Pair.<Day20.MyCoordinate, Integer>of(_myCoordinate, Integer.valueOf(1));
      };
      return IterableExtensions.<Coordinate, Pair<? extends State, Integer>>map(Day20.adjacency.get(this), _function);
    }
  }

  private static final Coordinate start = new Coordinate(0, 0);

  private static final Map<Coordinate, Set<Coordinate>> adjacency = CollectionLiterals.<Coordinate, Set<Coordinate>>newHashMap(Pair.<Coordinate, Set<Coordinate>>of(Day20.start, CollectionLiterals.<Coordinate>newHashSet()));

  public static void main(final String[] args) {
    final Stack<Set<Coordinate>> current_stack = new Stack<Set<Coordinate>>();
    current_stack.push(CollectionLiterals.<Coordinate>newHashSet(Day20.start));
    final Function1<Character, String> _function = (Character it) -> {
      return (it + "");
    };
    final Consumer<String> _function_1 = (String s) -> {
      if (s != null) {
        switch (s) {
          case "(":
            final Set<Coordinate> current = current_stack.peek();
            current_stack.push(CollectionLiterals.<Coordinate>newHashSet());
            HashSet<Coordinate> _hashSet = new HashSet<Coordinate>(current);
            current_stack.push(_hashSet);
            break;
          case "|":
            final Set<Coordinate> current_branch = current_stack.pop();
            final Set<Coordinate> already_treated = current_stack.pop();
            final Set<Coordinate> before_branching = current_stack.pop();
            current_stack.push(before_branching);
            already_treated.addAll(current_branch);
            current_stack.push(already_treated);
            HashSet<Coordinate> _hashSet_1 = new HashSet<Coordinate>(before_branching);
            current_stack.push(_hashSet_1);
            break;
          case ")":
            final Set<Coordinate> current_branch_1 = current_stack.pop();
            final Set<Coordinate> already_treated_1 = current_stack.pop();
            current_stack.pop();
            already_treated_1.addAll(current_branch_1);
            current_stack.push(already_treated_1);
            break;
          default:
            {
              final Direction direction = Dir.directionFromPole(s);
              final HashSet<Coordinate> next_coords = CollectionLiterals.<Coordinate>newHashSet();
              final Consumer<Coordinate> _function_2 = (Coordinate c) -> {
                final Coordinate next_coord = c.move(direction);
                boolean _containsKey = Day20.adjacency.containsKey(next_coord);
                boolean _not = (!_containsKey);
                if (_not) {
                  Day20.adjacency.put(next_coord, CollectionLiterals.<Coordinate>newHashSet());
                }
                Day20.adjacency.get(c).add(next_coord);
                Day20.adjacency.get(next_coord).add(c);
                next_coords.add(next_coord);
              };
              current_stack.pop().forEach(_function_2);
              current_stack.push(next_coords);
            }
            break;
        }
      } else {
        {
          final Direction direction = Dir.directionFromPole(s);
          final HashSet<Coordinate> next_coords = CollectionLiterals.<Coordinate>newHashSet();
          final Consumer<Coordinate> _function_2 = (Coordinate c) -> {
            final Coordinate next_coord = c.move(direction);
            boolean _containsKey = Day20.adjacency.containsKey(next_coord);
            boolean _not = (!_containsKey);
            if (_not) {
              Day20.adjacency.put(next_coord, CollectionLiterals.<Coordinate>newHashSet());
            }
            Day20.adjacency.get(c).add(next_coord);
            Day20.adjacency.get(next_coord).add(c);
            next_coords.add(next_coord);
          };
          current_stack.pop().forEach(_function_2);
          current_stack.push(next_coords);
        }
      }
    };
    ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray(new InputLoader(Integer.valueOf(2018), Integer.valueOf(20)).getInputs().get(0).toCharArray())), _function).forEach(_function_1);
    Day20.MyCoordinate _myCoordinate = new Day20.MyCoordinate(Day20.start);
    final AStar searcher = new AStar(_myCoordinate);
    try {
      searcher.run();
    } catch (final Throwable _t) {
      if (_t instanceof NotInitializedException) {
        InputOutput.<Integer>println(IterableExtensions.<Integer>max(searcher.gScore.values()));
        final Function1<Integer, Boolean> _function_2 = (Integer it) -> {
          return Boolean.valueOf(((it).intValue() >= 1000));
        };
        InputOutput.<Integer>println(Integer.valueOf(IterableExtensions.size(IterableExtensions.<Integer>filter(searcher.gScore.values(), _function_2))));
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
  }
}
