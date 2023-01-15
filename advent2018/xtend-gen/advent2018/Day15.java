package advent2018;

import adventutils.astar.AStar;
import adventutils.astar.NotInitializedException;
import adventutils.astar.State;
import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;
import com.google.common.collect.Iterables;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.PriorityQueue;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day15 {
  public static class MyCoordinate extends Coordinate implements State {
    private List<Coordinate> goals;

    public MyCoordinate(final int _x, final int _y, final Collection<Coordinate> _goals) {
      super(_x, _y);
      this.goals = IterableExtensions.<Coordinate>toList(IterableExtensions.<Coordinate>sort(_goals));
    }

    @Override
    public boolean isGoal() {
      return this.goals.contains(this);
    }

    @Override
    public int minToGoal() {
      int _size = this.goals.size();
      final Function1<Integer, Integer> _function = (Integer it) -> {
        int _manhattanDistanceTo = this.manhattanDistanceTo(this.goals.get((it).intValue()));
        int _multiply = (_manhattanDistanceTo * 100);
        return Integer.valueOf((_multiply + (it).intValue()));
      };
      return (int) IterableExtensions.<Integer>min(IterableExtensions.<Integer, Integer>map(new ExclusiveRange(0, _size, true), _function));
    }

    @Override
    public Iterable<Pair<State, Integer>> neighbours() {
      final Function1<Coordinate, Boolean> _function = (Coordinate it) -> {
        return Boolean.valueOf(Day15.available.contains(it));
      };
      final Function1<Coordinate, Pair<State, Integer>> _function_1 = (Coordinate it) -> {
        int _x = it.getX();
        int _y = it.getY();
        Day15.MyCoordinate _myCoordinate = new Day15.MyCoordinate(_x, _y, this.goals);
        int _xifexpression = (int) 0;
        boolean _contains = this.goals.contains(it);
        if (_contains) {
          _xifexpression = this.goals.indexOf(it);
        } else {
          _xifexpression = 0;
        }
        int _plus = (100 + _xifexpression);
        return Pair.<State, Integer>of(((State) _myCoordinate), Integer.valueOf(_plus));
      };
      return IterableExtensions.<Pair<State, Integer>>toList(IterableExtensions.<Coordinate, Pair<State, Integer>>map(IterableExtensions.<Coordinate>filter(this.noDiagonalUnboundedNeighbours(), _function), _function_1));
    }
  }

  public static class Entity implements Comparable<Day15.Entity> {
    private Set<Day15.Entity> others;

    private Coordinate position;

    private int hit_points;

    public Entity(final Coordinate _position, final Set<Day15.Entity> _others) {
      this.position = _position;
      this.hit_points = 200;
      this.others = _others;
    }

    public boolean hit(final Day15.Entity other) {
      boolean _xblockexpression = false;
      {
        int _hit_points = other.hit_points;
        other.hit_points = (_hit_points - 3);
        _xblockexpression = (other.hit_points <= 0);
      }
      return _xblockexpression;
    }

    public boolean playTurn() {
      boolean _xtrycatchfinallyexpression = false;
      try {
        boolean _xblockexpression = false;
        {
          final Function2<HashSet<Coordinate>, Day15.Entity, HashSet<Coordinate>> _function = (HashSet<Coordinate> acc, Day15.Entity v) -> {
            HashSet<Coordinate> _xblockexpression_1 = null;
            {
              final Function1<Coordinate, Boolean> _function_1 = (Coordinate it) -> {
                return Boolean.valueOf((Day15.available.contains(it) || it.equals(this.position)));
              };
              Iterables.<Coordinate>addAll(acc, IterableExtensions.<Coordinate>filter(v.position.noDiagonalUnboundedNeighbours(), _function_1));
              _xblockexpression_1 = acc;
            }
            return _xblockexpression_1;
          };
          final HashSet<Coordinate> candidates = IterableExtensions.<Day15.Entity, HashSet<Coordinate>>fold(this.others, CollectionLiterals.<Coordinate>newHashSet(), _function);
          int _x = this.position.getX();
          int _y = this.position.getY();
          Day15.MyCoordinate _myCoordinate = new Day15.MyCoordinate(_x, _y, candidates);
          final AStar engine = new AStar(_myCoordinate);
          engine.run();
          Day15.available.add(this.position);
          State _xifexpression = null;
          Integer _minDistance = engine.getMinDistance();
          boolean _equals = ((_minDistance).intValue() == 0);
          if (_equals) {
            _xifexpression = IterableExtensions.<State>head(engine.minPath());
          } else {
            _xifexpression = engine.minPath().get(1);
          }
          final Coordinate next_position = ((Coordinate) _xifexpression);
          this.position = next_position;
          Day15.available.remove(next_position);
          final Function1<Day15.Entity, Boolean> _function_1 = (Day15.Entity it) -> {
            return Boolean.valueOf(it.position.noDiagonalUnboundedNeighbours().contains(it.position));
          };
          final Function1<Day15.Entity, Coordinate> _function_2 = (Day15.Entity it) -> {
            return it.position;
          };
          final Day15.Entity target = IterableExtensions.<Day15.Entity>head(IterableExtensions.<Day15.Entity, Coordinate>sortBy(IterableExtensions.<Day15.Entity>filter(this.others, _function_1), _function_2));
          if (((target != null) && this.hit(target))) {
            this.others.remove(target);
            Day15.available.add(target.position);
          }
          _xblockexpression = true;
        }
        _xtrycatchfinallyexpression = _xblockexpression;
      } catch (final Throwable _t) {
        if (_t instanceof NotInitializedException) {
          _xtrycatchfinallyexpression = false;
        } else {
          throw Exceptions.sneakyThrow(_t);
        }
      }
      return _xtrycatchfinallyexpression;
    }

    @Override
    public int compareTo(final Day15.Entity other) {
      return this.position.compareTo(other.position);
    }

    @Override
    public String toString() {
      return this.position.toString();
    }
  }

  private static final Set<Coordinate> available = CollectionLiterals.<Coordinate>newHashSet();

  private static final Set<Day15.Entity> elves = CollectionLiterals.<Day15.Entity>newHashSet();

  private static final Set<Day15.Entity> goblins = CollectionLiterals.<Day15.Entity>newHashSet();

  public static void main(final String[] args) {
    final Function1<String, List<String>> _function = (String it) -> {
      final Function1<Character, String> _function_1 = (Character it_1) -> {
        return it_1.toString();
      };
      return ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray(it.toCharArray())), _function_1);
    };
    final List<List<String>> input = ListExtensions.<String, List<String>>map(new InputLoader(Integer.valueOf(2018), Integer.valueOf(15)).getInputs(), _function);
    int _size = input.size();
    final Consumer<Integer> _function_1 = (Integer i) -> {
      int _size_1 = input.get(0).size();
      final Consumer<Integer> _function_2 = (Integer j) -> {
        String _get = input.get((i).intValue()).get((j).intValue());
        if (_get != null) {
          switch (_get) {
            case ".":
              Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
              Day15.available.add(_coordinate);
              break;
            case "G":
              Coordinate _coordinate_1 = new Coordinate((i).intValue(), (j).intValue());
              Day15.Entity _entity = new Day15.Entity(_coordinate_1, Day15.elves);
              Day15.goblins.add(_entity);
              break;
            case "E":
              Coordinate _coordinate_2 = new Coordinate((i).intValue(), (j).intValue());
              Day15.Entity _entity_1 = new Day15.Entity(_coordinate_2, Day15.goblins);
              Day15.elves.add(_entity_1);
              break;
          }
        }
      };
      new ExclusiveRange(0, _size_1, true).forEach(_function_2);
    };
    new ExclusiveRange(0, _size, true).forEach(_function_1);
    int rounds = 0;
    boolean hasEvolved = true;
    while (((!Day15.elves.isEmpty()) && hasEvolved)) {
      {
        if (((rounds % 1000) == 0)) {
          InputOutput.<Integer>println(Integer.valueOf(Day15.elves.size()));
          InputOutput.<Integer>println(Integer.valueOf(Day15.goblins.size()));
          InputOutput.<Integer>println(Integer.valueOf(rounds));
          InputOutput.<String>println("-------------------------------");
        }
        final PriorityQueue<Day15.Entity> creatures = new PriorityQueue<Day15.Entity>(Day15.elves);
        creatures.addAll(Day15.goblins);
        Day15.Entity current = creatures.poll();
        hasEvolved = false;
        do {
          {
            hasEvolved = (current.playTurn() || hasEvolved);
            current = creatures.poll();
          }
        } while((current != null));
        if (hasEvolved) {
          rounds++;
        }
      }
    }
    final Function2<Integer, Day15.Entity, Integer> _function_2 = (Integer acc, Day15.Entity v) -> {
      return Integer.valueOf(((acc).intValue() + v.hit_points));
    };
    Integer _fold = IterableExtensions.<Day15.Entity, Integer>fold(Day15.elves, Integer.valueOf(0), _function_2);
    final Function2<Integer, Day15.Entity, Integer> _function_3 = (Integer acc, Day15.Entity v) -> {
      return Integer.valueOf(((acc).intValue() + v.hit_points));
    };
    Integer _fold_1 = IterableExtensions.<Day15.Entity, Integer>fold(Day15.goblins, Integer.valueOf(0), _function_3);
    int _plus = ((_fold).intValue() + (_fold_1).intValue());
    int _multiply = (rounds * _plus);
    InputOutput.<Integer>println(Integer.valueOf(_multiply));
  }
}
