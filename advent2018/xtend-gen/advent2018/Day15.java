package advent2018;

import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
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

import com.google.common.collect.Iterables;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;
import adventutils.pathfinding.AStar;
import adventutils.pathfinding.DFS;
import adventutils.pathfinding.NotInitializedException;
import adventutils.pathfinding.Path;
import adventutils.pathfinding.State;

@SuppressWarnings("all")
public class Day15 {
  public static class MyCoordinate extends Coordinate implements State {
    private Collection<Coordinate> goals;

    public MyCoordinate(final Coordinate _other, final Collection<Coordinate> _goals) {
      this(_other.getX(), _other.getY(), _goals);
    }

    public MyCoordinate(final int _x, final int _y, final Collection<Coordinate> _goals) {
      super(_x, _y);
      this.goals = _goals;
    }

    @Override
    public boolean isGoal() {
      return this.goals.contains(this);
    }

    @Override
    public int minToGoal() {
      final Function1<Coordinate, Integer> _function = (Coordinate it) -> {
        return Integer.valueOf(it.manhattanDistanceTo(this));
      };
      return (int) IterableExtensions.<Integer>min(IterableExtensions.<Coordinate, Integer>map(this.goals, _function));
    }

    @Override
    public Iterable<Pair<? extends State, Integer>> neighbours() {
      final Function1<Coordinate, Boolean> _function = (Coordinate it) -> {
        return Boolean.valueOf(Day15.available.contains(it));
      };
      final Function1<Coordinate, Pair<? extends State, Integer>> _function_1 = (Coordinate it) -> {
        Day15.MyCoordinate _myCoordinate = new Day15.MyCoordinate(it, this.goals);
        return Pair.<State, Integer>of(((State) _myCoordinate), Integer.valueOf(1));
      };
      return IterableExtensions.<Coordinate, Pair<? extends State, Integer>>map(IterableExtensions.<Coordinate>filter(this.noDiagonalUnboundedNeighbours(), _function), _function_1);
    }
  }

  public static class Entity implements Comparable<Day15.Entity> {
    private Collection<Day15.Entity> others;

    private Coordinate position;

    private int attack_value;

    private int hit_points;

    public Entity(final Coordinate _position, final Collection<Day15.Entity> _others, final int _attack_value) {
      this.position = _position;
      this.hit_points = 200;
      this.others = _others;
      this.attack_value = _attack_value;
    }

    public Entity(final Coordinate _position, final Collection<Day15.Entity> _others) {
      this(_position, _others, 3);
    }

    public boolean getHit(final int dmg) {
      boolean _xblockexpression = false;
      {
        int _hit_points = this.hit_points;
        this.hit_points = (_hit_points - dmg);
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
        if (((target != null) && target.getHit(this.attack_value))) {
          boolean _xblockexpression_1 = false;
          {
            Day15.available.add(target.position);
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
            return Boolean.valueOf((Day15.available.contains(it) || it.equals(this.position)));
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
        try {
          Day15.MyCoordinate _myCoordinate = new Day15.MyCoordinate(this.position, currentCandidates);
          final AStar aStarEngine = new AStar(_myCoordinate);
          aStarEngine.run();
          final DFS DFSEngine = new DFS(aStarEngine);
          DFSEngine.run();
          final Collection<Path> min_paths = DFSEngine.all_min_paths();
          int _size_1 = min_paths.size();
          boolean _greaterThan = (_size_1 > 0);
          if (_greaterThan) {
            List<State> _xifexpression = null;
            int _size_2 = min_paths.size();
            boolean _equals = (_size_2 == 1);
            if (_equals) {
              _xifexpression = IterableExtensions.<Path>head(min_paths).getPath();
            } else {
              final Function1<Path, State> _function = (Path it) -> {
                return it.last();
              };
              final Function1<Map.Entry<State, List<Path>>, Day15.MyCoordinate> _function_1 = (Map.Entry<State, List<Path>> it) -> {
                State _key = it.getKey();
                return ((Day15.MyCoordinate) _key);
              };
              final Function1<Path, List<State>> _function_2 = (Path it) -> {
                return it.getPath();
              };
              final Function1<List<State>, Day15.MyCoordinate> _function_3 = (List<State> it) -> {
                State _get = it.get(1);
                return ((Day15.MyCoordinate) _get);
              };
              _xifexpression = IterableExtensions.<List<State>>head(IterableExtensions.<List<State>, Day15.MyCoordinate>sortBy(ListExtensions.<Path, List<State>>map(IterableExtensions.<Map.Entry<State, List<Path>>>head(IterableExtensions.<Map.Entry<State, List<Path>>, Day15.MyCoordinate>sortBy(IterableExtensions.<State, Path>groupBy(min_paths, _function).entrySet(), _function_1)).getValue(), _function_2), _function_3));
            }
            final List<State> min_path = _xifexpression;
            int _size_3 = min_path.size();
            boolean _greaterThan_1 = (_size_3 > 1);
            if (_greaterThan_1) {
              State _get = min_path.get(1);
              final Day15.MyCoordinate next_position = ((Day15.MyCoordinate) _get);
              Day15.available.add(this.position);
              Day15.available.remove(next_position);
              this.position = next_position;
            }
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
      int _xifexpression = (int) 0;
      if ((this.hit_points == other.hit_points)) {
        _xifexpression = this.position.compareTo(other.position);
      } else {
        _xifexpression = Integer.valueOf(this.hit_points).compareTo(Integer.valueOf(other.hit_points));
      }
      return _xifexpression;
    }

    @Override
    public String toString() {
      String _string = this.position.toString();
      String _plus = (_string + " ; ");
      String _plus_1 = (_plus + Integer.valueOf(this.hit_points));
      return (_plus_1 + "HP");
    }
  }

  private static final Set<Coordinate> available = CollectionLiterals.<Coordinate>newHashSet();

  private static final Set<Day15.Entity> elves = CollectionLiterals.<Day15.Entity>newHashSet();

  private static final Set<Day15.Entity> goblins = CollectionLiterals.<Day15.Entity>newHashSet();

  public static void init(final int elves_attack) {
    Day15.available.clear();
    Day15.elves.clear();
    Day15.goblins.clear();
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
              Day15.Entity _entity_1 = new Day15.Entity(_coordinate_2, Day15.goblins, elves_attack);
              Day15.elves.add(_entity_1);
              break;
          }
        }
      };
      new ExclusiveRange(0, _size_1, true).forEach(_function_2);
    };
    new ExclusiveRange(0, _size, true).forEach(_function_1);
  }

  public static void main(final String[] args) {
    Day15.init(3);
    int i = Day15.fight();
    Set<Day15.Entity> _xifexpression = null;
    int _size = Day15.elves.size();
    boolean _equals = (_size == 0);
    if (_equals) {
      _xifexpression = Day15.goblins;
    } else {
      _xifexpression = Day15.elves;
    }
    final Set<Day15.Entity> remaining = _xifexpression;
    final Function2<Integer, Day15.Entity, Integer> _function = (Integer acc, Day15.Entity v) -> {
      return Integer.valueOf(((acc).intValue() + v.hit_points));
    };
    Integer _fold = IterableExtensions.<Day15.Entity, Integer>fold(remaining, Integer.valueOf(0), _function);
    int _multiply = ((i - 1) * (_fold).intValue());
    InputOutput.<Integer>println(Integer.valueOf(_multiply));
    int min_attack = 4;
    int max_attack = 100;
    while ((max_attack != min_attack)) {
      {
        int current_attack = (min_attack + ((max_attack - min_attack) / 2));
        Day15.init(current_attack);
        final int elves_number = Day15.elves.size();
        i = Day15.fight();
        int _size_1 = Day15.elves.size();
        boolean _greaterThan = (elves_number > _size_1);
        if (_greaterThan) {
          min_attack = (current_attack + 1);
        } else {
          max_attack = current_attack;
        }
      }
    }
    Day15.init(max_attack);
    i = Day15.fight();
    final Function2<Integer, Day15.Entity, Integer> _function_1 = (Integer acc, Day15.Entity v) -> {
      return Integer.valueOf(((acc).intValue() + v.hit_points));
    };
    Integer _fold_1 = IterableExtensions.<Day15.Entity, Integer>fold(Day15.elves, Integer.valueOf(0), _function_1);
    int _multiply_1 = ((i - 1) * (_fold_1).intValue());
    InputOutput.<Integer>println(Integer.valueOf(_multiply_1));
  }

  public static int fight() {
    int _xblockexpression = (int) 0;
    {
      int i = 0;
      while (((Day15.elves.size() > 0) && (Day15.goblins.size() > 0))) {
        {
          final HashSet<Day15.Entity> allUnits = new HashSet<Day15.Entity>(Day15.elves);
          allUnits.addAll(Day15.goblins);
          final Function1<Day15.Entity, Coordinate> _function = (Day15.Entity it) -> {
            return it.position;
          };
          final Consumer<Day15.Entity> _function_1 = (Day15.Entity it) -> {
            if ((Day15.goblins.contains(it) || Day15.elves.contains(it))) {
              it.playTurn();
            }
          };
          IterableExtensions.<Day15.Entity, Coordinate>sortBy(allUnits, _function).forEach(_function_1);
          i++;
        }
      }
      _xblockexpression = i;
    }
    return _xblockexpression;
  }

  public static String print() {
    String _xblockexpression = null;
    {
      final HashSet<Coordinate> all_coords = new HashSet<Coordinate>(Day15.available);
      final Function1<Day15.Entity, Coordinate> _function = (Day15.Entity it) -> {
        return it.position;
      };
      Iterables.<Coordinate>addAll(all_coords, IterableExtensions.<Day15.Entity, Coordinate>map(Day15.elves, _function));
      final Function1<Day15.Entity, Coordinate> _function_1 = (Day15.Entity it) -> {
        return it.position;
      };
      Iterables.<Coordinate>addAll(all_coords, IterableExtensions.<Day15.Entity, Coordinate>map(Day15.goblins, _function_1));
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
            boolean _exists = IterableExtensions.<Day15.Entity>exists(Day15.elves, _function_8);
            if (_exists) {
              _xifexpression = "E";
            } else {
              String _xifexpression_1 = null;
              final Function1<Day15.Entity, Boolean> _function_9 = (Day15.Entity it) -> {
                return Boolean.valueOf(it.position.equals(current));
              };
              boolean _exists_1 = IterableExtensions.<Day15.Entity>exists(Day15.goblins, _function_9);
              if (_exists_1) {
                _xifexpression_1 = "G";
              } else {
                String _xifexpression_2 = null;
                boolean _contains = Day15.available.contains(current);
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
      _xblockexpression = InputOutput.<String>println(IterableExtensions.<Integer, String>fold(new IntegerRange((min_x - 1), (max_x + 1)), "", _function_6));
    }
    return _xblockexpression;
  }
}
