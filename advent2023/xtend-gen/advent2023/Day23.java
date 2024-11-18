package advent2023;

import adventutils.geometry.Coordinate;
import adventutils.geometry.Dir;
import adventutils.geometry.Direction;
import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.function.Consumer;
import java.util.function.Function;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day23 {
  private static final List<List<String>> chars = new InputLoader(Integer.valueOf(2023), Integer.valueOf(23)).getChars();

  private static final int maxx = (Day23.chars.size() - 1);

  private static final int maxy = (Day23.chars.get(0).size() - 1);

  private static final HashMap<Coordinate, HashMap<Coordinate, Integer>> neighbours1 = new Function0<HashMap<Coordinate, HashMap<Coordinate, Integer>>>() {
    @Override
    public HashMap<Coordinate, HashMap<Coordinate, Integer>> apply() {
      HashMap<Coordinate, HashMap<Coordinate, Integer>> _xblockexpression = null;
      {
        final HashMap<Coordinate, HashMap<Coordinate, Integer>> neighbours = CollectionLiterals.<Coordinate, HashMap<Coordinate, Integer>>newHashMap();
        final Consumer<Integer> _function = (Integer i) -> {
          final Consumer<Integer> _function_1 = (Integer j) -> {
            final Coordinate current = new Coordinate((i).intValue(), (j).intValue());
            String _get = Day23.chars.get((i).intValue()).get((j).intValue());
            if (_get != null) {
              switch (_get) {
                case ".":
                  final Function1<Direction, Pair<Coordinate, Integer>> _function_2 = (Direction it) -> {
                    Coordinate _otherMove = current.otherMove(it);
                    return Pair.<Coordinate, Integer>of(_otherMove, Integer.valueOf(1));
                  };
                  neighbours.put(current, CollectionLiterals.<Coordinate, Integer>newHashMap(((Pair<? extends Coordinate, ? extends Integer>[])Conversions.unwrapArray(IterableExtensions.<Direction, Pair<Coordinate, Integer>>map(Dir.allDirections(), _function_2), Pair.class))));
                  break;
                case "<":
                  Coordinate _otherMove = current.otherMove(Direction.LEFT);
                  Pair<Coordinate, Integer> _mappedTo = Pair.<Coordinate, Integer>of(_otherMove, Integer.valueOf(1));
                  neighbours.put(current, CollectionLiterals.<Coordinate, Integer>newHashMap(_mappedTo));
                  break;
                case ">":
                  Coordinate _otherMove_1 = current.otherMove(Direction.RIGHT);
                  Pair<Coordinate, Integer> _mappedTo_1 = Pair.<Coordinate, Integer>of(_otherMove_1, Integer.valueOf(1));
                  neighbours.put(current, CollectionLiterals.<Coordinate, Integer>newHashMap(_mappedTo_1));
                  break;
                case "^":
                  Coordinate _otherMove_2 = current.otherMove(Direction.UP);
                  Pair<Coordinate, Integer> _mappedTo_2 = Pair.<Coordinate, Integer>of(_otherMove_2, Integer.valueOf(1));
                  neighbours.put(current, CollectionLiterals.<Coordinate, Integer>newHashMap(_mappedTo_2));
                  break;
                case "v":
                  Coordinate _otherMove_3 = current.otherMove(Direction.DOWN);
                  Pair<Coordinate, Integer> _mappedTo_3 = Pair.<Coordinate, Integer>of(_otherMove_3, Integer.valueOf(1));
                  neighbours.put(current, CollectionLiterals.<Coordinate, Integer>newHashMap(_mappedTo_3));
                  break;
              }
            }
          };
          new IntegerRange(0, Day23.maxy).forEach(_function_1);
        };
        new IntegerRange(0, Day23.maxx).forEach(_function);
        _xblockexpression = neighbours;
      }
      return _xblockexpression;
    }
  }.apply();

  private static final HashMap<Coordinate, HashMap<Coordinate, Integer>> neighbours2 = new Function0<HashMap<Coordinate, HashMap<Coordinate, Integer>>>() {
    @Override
    public HashMap<Coordinate, HashMap<Coordinate, Integer>> apply() {
      HashMap<Coordinate, HashMap<Coordinate, Integer>> _xblockexpression = null;
      {
        final HashMap<Coordinate, HashMap<Coordinate, Integer>> neighbours = CollectionLiterals.<Coordinate, HashMap<Coordinate, Integer>>newHashMap();
        final Consumer<Integer> _function = (Integer i) -> {
          final Consumer<Integer> _function_1 = (Integer j) -> {
            final Coordinate current = new Coordinate((i).intValue(), (j).intValue());
            boolean _equals = Day23.chars.get((i).intValue()).get((j).intValue()).equals("#");
            boolean _not = (!_equals);
            if (_not) {
              final Function1<Direction, Pair<Coordinate, Integer>> _function_2 = (Direction it) -> {
                Coordinate _otherMove = current.otherMove(it);
                return Pair.<Coordinate, Integer>of(_otherMove, Integer.valueOf(1));
              };
              neighbours.put(current, CollectionLiterals.<Coordinate, Integer>newHashMap(((Pair<? extends Coordinate, ? extends Integer>[])Conversions.unwrapArray(IterableExtensions.<Direction, Pair<Coordinate, Integer>>map(Dir.allDirections(), _function_2), Pair.class))));
            }
          };
          new IntegerRange(0, Day23.maxy).forEach(_function_1);
        };
        new IntegerRange(0, Day23.maxx).forEach(_function);
        _xblockexpression = neighbours;
      }
      return _xblockexpression;
    }
  }.apply();

  private static HashMap<Coordinate, HashMap<Coordinate, Integer>> neighbours = null;

  private static final Coordinate target = new Coordinate(Day23.maxx, (Day23.maxy - 1));

  private static final Coordinate start = new Coordinate(0, 1);

  public static HashMap<Coordinate, HashMap<Coordinate, Integer>> processNeigbours(final HashMap<Coordinate, HashMap<Coordinate, Integer>> neighbours) {
    HashMap<Coordinate, HashMap<Coordinate, Integer>> _xblockexpression = null;
    {
      final Consumer<HashMap<Coordinate, Integer>> _function = (HashMap<Coordinate, Integer> value) -> {
        Set<Coordinate> _keySet = value.keySet();
        final Function1<Coordinate, Boolean> _function_1 = (Coordinate it) -> {
          boolean _containsKey = neighbours.containsKey(it);
          return Boolean.valueOf((!_containsKey));
        };
        final Consumer<Coordinate> _function_2 = (Coordinate it) -> {
          value.remove(it);
        };
        IterableExtensions.<Coordinate>filter(new HashSet<Coordinate>(_keySet), _function_1).forEach(_function_2);
      };
      neighbours.values().forEach(_function);
      final HashMap<Coordinate, HashMap<Coordinate, Integer>> final_neighbours = CollectionLiterals.<Coordinate, HashMap<Coordinate, Integer>>newHashMap();
      final HashSet<Pair<Coordinate, Coordinate>> tmp_neighbours = CollectionLiterals.<Pair<Coordinate, Coordinate>>newHashSet();
      final Consumer<Map.Entry<Coordinate, HashMap<Coordinate, Integer>>> _function_1 = (Map.Entry<Coordinate, HashMap<Coordinate, Integer>> e) -> {
        int _size = e.getValue().size();
        boolean _equals = (_size == 2);
        if (_equals) {
          final Function1<Map.Entry<Coordinate, Integer>, Coordinate> _function_2 = (Map.Entry<Coordinate, Integer> it) -> {
            return it.getKey();
          };
          final Consumer<Coordinate> _function_3 = (Coordinate it) -> {
            Coordinate _key = e.getKey();
            Pair<Coordinate, Coordinate> _pair = new Pair<Coordinate, Coordinate>(_key, it);
            tmp_neighbours.add(_pair);
          };
          IterableExtensions.<Map.Entry<Coordinate, Integer>, Coordinate>map(e.getValue().entrySet(), _function_2).forEach(_function_3);
        } else {
          final_neighbours.put(e.getKey(), e.getValue());
        }
      };
      neighbours.entrySet().forEach(_function_1);
      Set<Map.Entry<Coordinate, HashMap<Coordinate, Integer>>> _entrySet = final_neighbours.entrySet();
      HashSet<Map.Entry<Coordinate, HashMap<Coordinate, Integer>>> _hashSet = new HashSet<Map.Entry<Coordinate, HashMap<Coordinate, Integer>>>(_entrySet);
      for (final Map.Entry<Coordinate, HashMap<Coordinate, Integer>> node : _hashSet) {
        Set<Map.Entry<Coordinate, Integer>> _entrySet_1 = node.getValue().entrySet();
        HashSet<Map.Entry<Coordinate, Integer>> _hashSet_1 = new HashSet<Map.Entry<Coordinate, Integer>>(_entrySet_1);
        for (final Map.Entry<Coordinate, Integer> start : _hashSet_1) {
          {
            Coordinate current = start.getKey();
            Coordinate previous = node.getKey();
            Integer length = start.getValue();
            while (((current != null) && (!final_neighbours.containsKey(current)))) {
              {
                final Coordinate my_current = current;
                final Coordinate my_previous = previous;
                final Function1<Pair<Coordinate, Coordinate>, Boolean> _function_2 = (Pair<Coordinate, Coordinate> it) -> {
                  return Boolean.valueOf((it.getKey().equals(my_current) && (!it.getValue().equals(my_previous))));
                };
                final Pair<Coordinate, Coordinate> next = IterableExtensions.<Pair<Coordinate, Coordinate>>findFirst(tmp_neighbours, _function_2);
                if ((next == null)) {
                  current = null;
                } else {
                  previous = current;
                  current = next.getValue();
                  length++;
                }
              }
            }
            final HashMap<Coordinate, Integer> actual_node_value = final_neighbours.get(node.getKey());
            actual_node_value.remove(start.getKey());
            if ((current != null)) {
              actual_node_value.put(current, length);
            }
          }
        }
      }
      _xblockexpression = final_neighbours;
    }
    return _xblockexpression;
  }

  public static void main(final String[] args) {
    Day23.neighbours = Day23.processNeigbours(Day23.neighbours1);
    InputOutput.<Integer>println(Day23.max_path(CollectionLiterals.<Coordinate>newArrayList(Day23.start)).get());
    Day23.neighbours = Day23.processNeigbours(Day23.neighbours2);
    InputOutput.<Integer>println(Day23.max_path(CollectionLiterals.<Coordinate>newArrayList(Day23.start)).get());
  }

  public static Optional<Integer> max_path(final List<Coordinate> path) {
    Optional<Integer> _xblockexpression = null;
    {
      final Coordinate current = path.getLast();
      Optional<Integer> _xifexpression = null;
      boolean _equals = current.equals(Day23.target);
      boolean _not = (!_equals);
      if (_not) {
        final Function1<Map.Entry<Coordinate, Integer>, Boolean> _function = (Map.Entry<Coordinate, Integer> it) -> {
          int _size = path.size();
          int _minus = (_size - 1);
          boolean _contains = path.subList(0, _minus).contains(it.getKey());
          return Boolean.valueOf((!_contains));
        };
        final Function2<Optional<Integer>, Map.Entry<Coordinate, Integer>, Optional<Integer>> _function_1 = (Optional<Integer> acc, Map.Entry<Coordinate, Integer> next) -> {
          Optional<Integer> _xblockexpression_1 = null;
          {
            final ArrayList<Coordinate> new_path = new ArrayList<Coordinate>(path);
            new_path.add(next.getKey());
            final Function<Integer, Integer> _function_2 = (Integer it) -> {
              Integer _value = next.getValue();
              return Integer.valueOf(((it).intValue() + (_value).intValue()));
            };
            _xblockexpression_1 = Day23.maxOp(acc, Day23.max_path(new_path).<Integer>map(_function_2));
          }
          return _xblockexpression_1;
        };
        _xifexpression = IterableExtensions.<Map.Entry<Coordinate, Integer>, Optional<Integer>>fold(IterableExtensions.<Map.Entry<Coordinate, Integer>>filter(Day23.neighbours.get(current).entrySet(), _function), Optional.<Integer>empty(), _function_1);
      } else {
        _xifexpression = Optional.<Integer>of(Integer.valueOf(0));
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }

  public static Optional<Integer> maxOp(final Optional<Integer> n, final Optional<Integer> p) {
    Optional<Integer> _xifexpression = null;
    boolean _isEmpty = n.isEmpty();
    if (_isEmpty) {
      _xifexpression = p;
    } else {
      Optional<Integer> _xifexpression_1 = null;
      boolean _isEmpty_1 = p.isEmpty();
      if (_isEmpty_1) {
        _xifexpression_1 = n;
      } else {
        _xifexpression_1 = Optional.<Integer>of(Integer.valueOf(Math.max((n.get()).intValue(), (p.get()).intValue())));
      }
      _xifexpression = _xifexpression_1;
    }
    return _xifexpression;
  }
}
