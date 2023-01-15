package advent2018;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;
import adventutils.pathfinding.AStar;
import adventutils.pathfinding.NotInitializedException;
import adventutils.pathfinding.State;
import com.google.common.collect.Iterables;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day15 {
  public static class MyCoordinate extends Coordinate implements State {
    private List<Coordinate> goals;

    private Collection<Coordinate> available;

    public MyCoordinate(final Coordinate _other, final Collection<Coordinate> _goals, final Collection<Coordinate> _available) {
      this(_other.getX(), _other.getY(), _goals, _available);
    }

    public MyCoordinate(final int _x, final int _y, final Collection<Coordinate> _goals, final Collection<Coordinate> _available) {
      super(_x, _y);
      this.goals = IterableExtensions.<Coordinate>toList(IterableExtensions.<Coordinate>sort(_goals));
      this.available = _available;
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
        int _multiply = (_manhattanDistanceTo * 1000);
        return Integer.valueOf((_multiply + (it).intValue()));
      };
      return (int) IterableExtensions.<Integer>min(IterableExtensions.<Integer, Integer>map(new ExclusiveRange(0, _size, true), _function));
    }

    @Override
    public Iterable<Pair<State, Integer>> neighbours() {
      final Function1<Coordinate, Boolean> _function = (Coordinate it) -> {
        return Boolean.valueOf(this.available.contains(it));
      };
      final Function1<Coordinate, Pair<State, Integer>> _function_1 = (Coordinate it) -> {
        Day15.MyCoordinate _myCoordinate = new Day15.MyCoordinate(it, this.goals, this.available);
        int _xifexpression = (int) 0;
        boolean _contains = this.goals.contains(it);
        if (_contains) {
          _xifexpression = this.goals.indexOf(it);
        } else {
          _xifexpression = 0;
        }
        int _plus = (1000 + _xifexpression);
        return Pair.<State, Integer>of(((State) _myCoordinate), Integer.valueOf(_plus));
      };
      return IterableExtensions.<Coordinate, Pair<State, Integer>>map(IterableExtensions.<Coordinate>filter(this.noDiagonalUnboundedNeighbours(), _function), _function_1);
    }
  }

  public static class Entity implements Comparable<Day15.Entity> {
    private Collection<Day15.Entity> others;

    private Collection<Coordinate> available;

    private Coordinate position;

    private int hit_points;

    public Entity(final Coordinate _position, final Collection<Day15.Entity> _others, final Collection<Coordinate> _available) {
      this.position = _position;
      this.available = _available;
      this.hit_points = 200;
      this.others = _others;
    }

    public boolean getHit() {
      boolean _xblockexpression = false;
      {
        int _hit_points = this.hit_points;
        this.hit_points = (_hit_points - 3);
        _xblockexpression = (this.hit_points <= 0);
      }
      return _xblockexpression;
    }

    public boolean attack() {
      boolean _xblockexpression = false;
      {
        final Set<Coordinate> neighbours = this.position.noDiagonalUnboundedNeighbours();
        final Function1<Day15.Entity, Boolean> _function = (Day15.Entity it) -> {
          return Boolean.valueOf(neighbours.contains(it.position));
        };
        final Day15.Entity target = IterableExtensions.<Day15.Entity>head(IterableExtensions.<Day15.Entity>sort(IterableExtensions.<Day15.Entity>filter(this.others, _function)));
        boolean _xifexpression = false;
        if (((target != null) && target.getHit())) {
          boolean _xblockexpression_1 = false;
          {
            InputOutput.<String>println(((("is a kill from " + this.position) + " to ") + target.position));
            this.available.add(target.position);
            _xblockexpression_1 = this.others.remove(target);
          }
          _xifexpression = _xblockexpression_1;
        }
        _xblockexpression = _xifexpression;
      }
      return _xblockexpression;
    }

    public HashSet<Coordinate> candidates() {
      final Function2<HashSet<Coordinate>, Day15.Entity, HashSet<Coordinate>> _function = (HashSet<Coordinate> acc, Day15.Entity v) -> {
        HashSet<Coordinate> _xblockexpression = null;
        {
          final Set<Coordinate> current_neighbours = v.position.noDiagonalUnboundedNeighbours();
          final Function1<Coordinate, Boolean> _function_1 = (Coordinate it) -> {
            return Boolean.valueOf((this.available.contains(it) || it.equals(this.position)));
          };
          Iterables.<Coordinate>addAll(acc, IterableExtensions.<Coordinate>filter(current_neighbours, _function_1));
          _xblockexpression = acc;
        }
        return _xblockexpression;
      };
      return IterableExtensions.<Day15.Entity, HashSet<Coordinate>>fold(this.others, CollectionLiterals.<Coordinate>newHashSet(), _function);
    }

    public void move() {
      final HashSet<Coordinate> currentCandidates = this.candidates();
      int _size = currentCandidates.size();
      boolean _notEquals = (_size != 0);
      if (_notEquals) {
        Day15.MyCoordinate _myCoordinate = new Day15.MyCoordinate(this.position, currentCandidates, this.available);
        final AStar engine = new AStar(_myCoordinate);
        try {
          final List<State> min_path = engine.run().minPath();
          int _size_1 = min_path.size();
          boolean _greaterThan = (_size_1 > 1);
          if (_greaterThan) {
            State _get = min_path.get(1);
            final Day15.MyCoordinate next_position = ((Day15.MyCoordinate) _get);
            this.available.add(this.position);
            this.available.remove(next_position);
            this.position = next_position;
          }
        } catch (final Throwable _t) {
          if (_t instanceof NotInitializedException) {
          } else {
            throw Exceptions.sneakyThrow(_t);
          }
        }
      }
    }

    public boolean playTurn() {
      boolean _xblockexpression = false;
      {
        this.move();
        _xblockexpression = this.attack();
      }
      return _xblockexpression;
    }

    @Override
    public int compareTo(final Day15.Entity other) {
      return this.position.compareTo(other.position);
    }

    @Override
    public String toString() {
      String _string = this.position.toString();
      String _plus = (_string + " ; ");
      String _plus_1 = (_plus + Integer.valueOf(this.hit_points));
      return (_plus_1 + "HP");
    }
  }

  public static void main(final String[] args) {
    final Set<Coordinate> available = CollectionLiterals.<Coordinate>newHashSet();
    final Set<Day15.Entity> elves = CollectionLiterals.<Day15.Entity>newHashSet();
    final Set<Day15.Entity> goblins = CollectionLiterals.<Day15.Entity>newHashSet();
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
              available.add(_coordinate);
              break;
            case "G":
              Coordinate _coordinate_1 = new Coordinate((i).intValue(), (j).intValue());
              Day15.Entity _entity = new Day15.Entity(_coordinate_1, elves, available);
              goblins.add(_entity);
              break;
            case "E":
              Coordinate _coordinate_2 = new Coordinate((i).intValue(), (j).intValue());
              Day15.Entity _entity_1 = new Day15.Entity(_coordinate_2, goblins, available);
              elves.add(_entity_1);
              break;
          }
        }
      };
      new ExclusiveRange(0, _size_1, true).forEach(_function_2);
    };
    new ExclusiveRange(0, _size, true).forEach(_function_1);
    int i = 0;
    while (((elves.size() > 0) && (goblins.size() > 0))) {
      {
        InputOutput.<Integer>println(Integer.valueOf(i));
        Day15.print(available, elves, goblins);
        final HashSet<Day15.Entity> allUnits = new HashSet<Day15.Entity>(elves);
        allUnits.addAll(goblins);
        final Consumer<Day15.Entity> _function_2 = (Day15.Entity it) -> {
          it.playTurn();
        };
        IterableExtensions.<Day15.Entity>sort(allUnits).forEach(_function_2);
        i++;
      }
    }
    Set<Day15.Entity> _xifexpression = null;
    int _size_1 = elves.size();
    boolean _equals = (_size_1 == 0);
    if (_equals) {
      _xifexpression = goblins;
    } else {
      _xifexpression = elves;
    }
    final Set<Day15.Entity> remaining = _xifexpression;
    InputOutput.<Set<Day15.Entity>>println(remaining);
    final Function2<Integer, Day15.Entity, Integer> _function_2 = (Integer acc, Day15.Entity v) -> {
      return Integer.valueOf(((acc).intValue() + v.hit_points));
    };
    Integer _fold = IterableExtensions.<Day15.Entity, Integer>fold(remaining, Integer.valueOf(0), _function_2);
    int _multiply = ((i - 1) * (_fold).intValue());
    InputOutput.<Integer>println(Integer.valueOf(_multiply));
  }

  public static String print(final Set<Coordinate> available, final Set<Day15.Entity> elves, final Set<Day15.Entity> goblins) {
    String _xblockexpression = null;
    {
      final HashSet<Coordinate> all_coords = new HashSet<Coordinate>(available);
      final Function1<Day15.Entity, Coordinate> _function = (Day15.Entity it) -> {
        return it.position;
      };
      Iterables.<Coordinate>addAll(all_coords, IterableExtensions.<Day15.Entity, Coordinate>map(elves, _function));
      final Function1<Day15.Entity, Coordinate> _function_1 = (Day15.Entity it) -> {
        return it.position;
      };
      Iterables.<Coordinate>addAll(all_coords, IterableExtensions.<Day15.Entity, Coordinate>map(goblins, _function_1));
      final Function1<Coordinate, Integer> _function_2 = (Coordinate it) -> {
        return Integer.valueOf(it.getX());
      };
      final int min_x = IterableExtensions.<Coordinate, Integer>minBy(all_coords, _function_2).getX();
      final Function1<Coordinate, Integer> _function_3 = (Coordinate it) -> {
        return Integer.valueOf(it.getX());
      };
      final int max_x = IterableExtensions.<Coordinate, Integer>maxBy(all_coords, _function_3).getX();
      final Function1<Coordinate, Integer> _function_4 = (Coordinate it) -> {
        return Integer.valueOf(it.getY());
      };
      final int min_y = IterableExtensions.<Coordinate, Integer>minBy(all_coords, _function_4).getY();
      final Function1<Coordinate, Integer> _function_5 = (Coordinate it) -> {
        return Integer.valueOf(it.getY());
      };
      final int max_y = IterableExtensions.<Coordinate, Integer>maxBy(all_coords, _function_5).getY();
      final Function2<String, Integer, String> _function_6 = (String acc1, Integer v1) -> {
        final Function2<String, Integer, String> _function_7 = (String acc2, Integer v2) -> {
          String _xblockexpression_1 = null;
          {
            final Coordinate current = new Coordinate((v1).intValue(), (v2).intValue());
            String _xifexpression = null;
            final Function1<Day15.Entity, Boolean> _function_8 = (Day15.Entity it) -> {
              return Boolean.valueOf(it.position.equals(current));
            };
            boolean _exists = IterableExtensions.<Day15.Entity>exists(elves, _function_8);
            if (_exists) {
              _xifexpression = "E";
            } else {
              String _xifexpression_1 = null;
              final Function1<Day15.Entity, Boolean> _function_9 = (Day15.Entity it) -> {
                return Boolean.valueOf(it.position.equals(current));
              };
              boolean _exists_1 = IterableExtensions.<Day15.Entity>exists(goblins, _function_9);
              if (_exists_1) {
                _xifexpression_1 = "G";
              } else {
                String _xifexpression_2 = null;
                boolean _contains = available.contains(current);
                if (_contains) {
                  _xifexpression_2 = ".";
                } else {
                  _xifexpression_2 = "#";
                }
                _xifexpression_1 = _xifexpression_2;
              }
              _xifexpression = _xifexpression_1;
            }
            _xblockexpression_1 = _xifexpression;
          }
          return (acc2 + _xblockexpression_1);
        };
        String _fold = IterableExtensions.<Integer, String>fold(new IntegerRange((min_y - 1), (max_y + 1)), "", _function_7);
        String _plus = (acc1 + _fold);
        return (_plus + "\n");
      };
      _xblockexpression = InputOutput.<String>println(
        IterableExtensions.<Integer, String>fold(new IntegerRange((min_x - 1), (max_x + 1)), "", _function_6));
    }
    return _xblockexpression;
  }
}
