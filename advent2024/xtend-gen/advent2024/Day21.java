package advent2024;

import adventutils.geometry.Coordinate;
import adventutils.geometry.Dir;
import adventutils.geometry.Direction;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.function.BiFunction;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day21 {
  private static final List<ArrayList<String>> inputs = ListExtensions.<String, ArrayList<String>>map(CollectionLiterals.<String>newArrayList("A129A", "A176A", "A169A", "A805A", "A208A"), ((Function1<String, ArrayList<String>>) (String it) -> {
    final Function1<Character, String> _function = (Character it_1) -> {
      return (it_1 + "");
    };
    List<String> _map = ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray(it.toCharArray())), _function);
    return new ArrayList<String>(_map);
  }));

  private static final Map<Coordinate, String> pad_numeric_map = CollectionLiterals.<Coordinate, String>newHashMap(
    Pair.<Coordinate, String>of(new Coordinate(0, 0), "7"), 
    Pair.<Coordinate, String>of(new Coordinate(0, 1), "8"), 
    Pair.<Coordinate, String>of(new Coordinate(0, 2), "9"), 
    Pair.<Coordinate, String>of(new Coordinate(1, 0), "4"), 
    Pair.<Coordinate, String>of(new Coordinate(1, 1), "5"), 
    Pair.<Coordinate, String>of(new Coordinate(1, 2), "6"), 
    Pair.<Coordinate, String>of(new Coordinate(2, 0), "1"), 
    Pair.<Coordinate, String>of(new Coordinate(2, 1), "2"), 
    Pair.<Coordinate, String>of(new Coordinate(2, 2), "3"), 
    Pair.<Coordinate, String>of(new Coordinate(3, 1), "0"), 
    Pair.<Coordinate, String>of(new Coordinate(3, 2), "A"));

  private static final Map<Coordinate, String> pad_directional_map = CollectionLiterals.<Coordinate, String>newHashMap(
    Pair.<Coordinate, String>of(new Coordinate(0, 1), "^"), 
    Pair.<Coordinate, String>of(new Coordinate(0, 2), "A"), 
    Pair.<Coordinate, String>of(new Coordinate(1, 0), "<"), 
    Pair.<Coordinate, String>of(new Coordinate(1, 1), ">"), 
    Pair.<Coordinate, String>of(new Coordinate(1, 2), "v"));

  private static final Map<Pair<String, String>, List<Pair<String, String>>> letters = CollectionLiterals.<Pair<String, String>, List<Pair<String, String>>>newHashMap(
    Pair.<Pair<String, String>, List<Pair<String, String>>>of(Pair.<String, String>of("A", "A"), CollectionLiterals.<Pair<String, String>>newArrayList(Pair.<String, String>of("A", "A"))), 
    Pair.<Pair<String, String>, List<Pair<String, String>>>of(Pair.<String, String>of("A", "^"), CollectionLiterals.<Pair<String, String>>newArrayList(Pair.<String, String>of("A", "<"), Pair.<String, String>of("<", "A"))), 
    Pair.<Pair<String, String>, List<Pair<String, String>>>of(Pair.<String, String>of("A", "v"), CollectionLiterals.<Pair<String, String>>newArrayList(Pair.<String, String>of("A", "<"), Pair.<String, String>of("<", "v"), Pair.<String, String>of("v", "A"))), 
    Pair.<Pair<String, String>, List<Pair<String, String>>>of(Pair.<String, String>of("A", ">"), CollectionLiterals.<Pair<String, String>>newArrayList(Pair.<String, String>of("A", "v"), Pair.<String, String>of("v", "A"))), 
    Pair.<Pair<String, String>, List<Pair<String, String>>>of(Pair.<String, String>of("A", "<"), CollectionLiterals.<Pair<String, String>>newArrayList(Pair.<String, String>of("A", "v"), Pair.<String, String>of("v", "<"), Pair.<String, String>of("<", "<"), Pair.<String, String>of("<", "A"))), 
    Pair.<Pair<String, String>, List<Pair<String, String>>>of(Pair.<String, String>of("^", "A"), CollectionLiterals.<Pair<String, String>>newArrayList(Pair.<String, String>of("A", ">"), Pair.<String, String>of(">", "A"))), 
    Pair.<Pair<String, String>, List<Pair<String, String>>>of(Pair.<String, String>of("^", "^"), CollectionLiterals.<Pair<String, String>>newArrayList(Pair.<String, String>of("A", "A"))), 
    Pair.<Pair<String, String>, List<Pair<String, String>>>of(Pair.<String, String>of("^", "v"), CollectionLiterals.<Pair<String, String>>newArrayList(Pair.<String, String>of("A", "v"), Pair.<String, String>of("v", "A"))), 
    Pair.<Pair<String, String>, List<Pair<String, String>>>of(Pair.<String, String>of("^", ">"), CollectionLiterals.<Pair<String, String>>newArrayList(Pair.<String, String>of("A", "v"), Pair.<String, String>of("v", ">"), Pair.<String, String>of(">", "A"))), 
    Pair.<Pair<String, String>, List<Pair<String, String>>>of(Pair.<String, String>of("^", "<"), CollectionLiterals.<Pair<String, String>>newArrayList(Pair.<String, String>of("A", "v"), Pair.<String, String>of("v", "<"), Pair.<String, String>of("<", "A"))), 
    Pair.<Pair<String, String>, List<Pair<String, String>>>of(Pair.<String, String>of("v", "A"), CollectionLiterals.<Pair<String, String>>newArrayList(Pair.<String, String>of("A", "^"), Pair.<String, String>of("^", ">"), Pair.<String, String>of(">", "A"))), 
    Pair.<Pair<String, String>, List<Pair<String, String>>>of(Pair.<String, String>of("v", "^"), CollectionLiterals.<Pair<String, String>>newArrayList(Pair.<String, String>of("A", "^"), Pair.<String, String>of("^", "A"))), 
    Pair.<Pair<String, String>, List<Pair<String, String>>>of(Pair.<String, String>of("v", "v"), CollectionLiterals.<Pair<String, String>>newArrayList(Pair.<String, String>of("A", "A"))), 
    Pair.<Pair<String, String>, List<Pair<String, String>>>of(Pair.<String, String>of("v", ">"), CollectionLiterals.<Pair<String, String>>newArrayList(Pair.<String, String>of("A", ">"), Pair.<String, String>of(">", "A"))), 
    Pair.<Pair<String, String>, List<Pair<String, String>>>of(Pair.<String, String>of("v", "<"), CollectionLiterals.<Pair<String, String>>newArrayList(Pair.<String, String>of("A", "<"), Pair.<String, String>of("<", "A"))), 
    Pair.<Pair<String, String>, List<Pair<String, String>>>of(Pair.<String, String>of(">", "A"), CollectionLiterals.<Pair<String, String>>newArrayList(Pair.<String, String>of("A", "^"), Pair.<String, String>of("^", "A"))), 
    Pair.<Pair<String, String>, List<Pair<String, String>>>of(Pair.<String, String>of(">", "^"), CollectionLiterals.<Pair<String, String>>newArrayList(Pair.<String, String>of("A", "<"), Pair.<String, String>of("<", "^"), Pair.<String, String>of("^", "A"))), 
    Pair.<Pair<String, String>, List<Pair<String, String>>>of(Pair.<String, String>of(">", "v"), CollectionLiterals.<Pair<String, String>>newArrayList(Pair.<String, String>of("A", "<"), Pair.<String, String>of("<", "A"))), 
    Pair.<Pair<String, String>, List<Pair<String, String>>>of(Pair.<String, String>of(">", ">"), CollectionLiterals.<Pair<String, String>>newArrayList(Pair.<String, String>of("A", "A"))), 
    Pair.<Pair<String, String>, List<Pair<String, String>>>of(Pair.<String, String>of(">", "<"), CollectionLiterals.<Pair<String, String>>newArrayList(Pair.<String, String>of("A", "<"), Pair.<String, String>of("<", "<"), Pair.<String, String>of("<", "A"))), 
    Pair.<Pair<String, String>, List<Pair<String, String>>>of(Pair.<String, String>of("<", "A"), CollectionLiterals.<Pair<String, String>>newArrayList(Pair.<String, String>of("A", ">"), Pair.<String, String>of(">", ">"), Pair.<String, String>of(">", "^"), Pair.<String, String>of("^", "A"))), 
    Pair.<Pair<String, String>, List<Pair<String, String>>>of(Pair.<String, String>of("<", "^"), CollectionLiterals.<Pair<String, String>>newArrayList(Pair.<String, String>of("A", ">"), Pair.<String, String>of(">", "^"), Pair.<String, String>of("^", "A"))), 
    Pair.<Pair<String, String>, List<Pair<String, String>>>of(Pair.<String, String>of("<", "v"), CollectionLiterals.<Pair<String, String>>newArrayList(Pair.<String, String>of("A", ">"), Pair.<String, String>of(">", "A"))), 
    Pair.<Pair<String, String>, List<Pair<String, String>>>of(Pair.<String, String>of("<", ">"), CollectionLiterals.<Pair<String, String>>newArrayList(Pair.<String, String>of("A", ">"), Pair.<String, String>of(">", ">"), Pair.<String, String>of(">", "A"))), 
    Pair.<Pair<String, String>, List<Pair<String, String>>>of(Pair.<String, String>of("<", "<"), CollectionLiterals.<Pair<String, String>>newArrayList(Pair.<String, String>of("A", "A"))));

  public static void main(final String[] args) {
    final Function2<Long, ArrayList<String>, Long> _function = (Long acc, ArrayList<String> el) -> {
      Long _compute = Day21.compute(el, 2);
      int _size = el.size();
      int _minus = (_size - 1);
      int _parseInt = Integer.parseInt(IterableExtensions.join(el.subList(1, _minus)));
      long _multiply = ((_compute).longValue() * _parseInt);
      return Long.valueOf(((acc).longValue() + _multiply));
    };
    InputOutput.<Long>println(IterableExtensions.<ArrayList<String>, Long>fold(Day21.inputs, Long.valueOf(0L), _function));
    final Function2<Long, ArrayList<String>, Long> _function_1 = (Long acc, ArrayList<String> el) -> {
      Long _compute = Day21.compute(el, 25);
      int _size = el.size();
      int _minus = (_size - 1);
      int _parseInt = Integer.parseInt(IterableExtensions.join(el.subList(1, _minus)));
      long _multiply = ((_compute).longValue() * _parseInt);
      return Long.valueOf(((acc).longValue() + _multiply));
    };
    InputOutput.<Long>println(IterableExtensions.<ArrayList<String>, Long>fold(Day21.inputs, Long.valueOf(0L), _function_1));
  }

  public static Long compute(final List<String> code, final int occurrences) {
    Long _xblockexpression = null;
    {
      final Function2<ArrayList<ArrayList<String>>, ArrayList<ArrayList<String>>, ArrayList<ArrayList<String>>> _function = (ArrayList<ArrayList<String>> acc, ArrayList<ArrayList<String>> el) -> {
        ArrayList<ArrayList<String>> _xblockexpression_1 = null;
        {
          final ArrayList<ArrayList<String>> res = CollectionLiterals.<ArrayList<String>>newArrayList();
          final Consumer<ArrayList<String>> _function_1 = (ArrayList<String> ac) -> {
            final Consumer<ArrayList<String>> _function_2 = (ArrayList<String> e) -> {
              final ArrayList<String> tmp = CollectionLiterals.<String>newArrayList();
              tmp.addAll(ac);
              tmp.addAll(e);
              res.add(tmp);
            };
            el.forEach(_function_2);
          };
          acc.forEach(_function_1);
          _xblockexpression_1 = res;
        }
        return _xblockexpression_1;
      };
      final ArrayList<ArrayList<String>> first_layer_codes = IterableExtensions.<ArrayList<ArrayList<String>>, ArrayList<ArrayList<String>>>fold(Day21.treat_code(code, true), CollectionLiterals.<ArrayList<String>>newArrayList(CollectionLiterals.<String>newArrayList()), _function);
      final Function1<ArrayList<String>, Long> _function_1 = (ArrayList<String> first_layer_code) -> {
        Long _xblockexpression_1 = null;
        {
          first_layer_code.add(0, "A");
          HashMap<Pair<String, String>, Long> layer_map = CollectionLiterals.<Pair<String, String>, Long>newHashMap();
          int _size = first_layer_code.size();
          int _minus = (_size - 2);
          IntegerRange _upTo = new IntegerRange(0, _minus);
          for (final Integer i : _upTo) {
            String _get = first_layer_code.get((i).intValue());
            String _get_1 = first_layer_code.get(((i).intValue() + 1));
            Pair<String, String> _mappedTo = Pair.<String, String>of(_get, _get_1);
            final BiFunction<Long, Long, Long> _function_2 = (Long x, Long y) -> {
              return Long.valueOf(((x).longValue() + (y).longValue()));
            };
            layer_map.merge(_mappedTo, Long.valueOf(1L), _function_2);
          }
          IntegerRange _upTo_1 = new IntegerRange(1, occurrences);
          for (final Integer i_1 : _upTo_1) {
            {
              final HashMap<Pair<String, String>, Long> new_layer_map = CollectionLiterals.<Pair<String, String>, Long>newHashMap();
              Set<Map.Entry<Pair<String, String>, Long>> _entrySet = layer_map.entrySet();
              for (final Map.Entry<Pair<String, String>, Long> entry : _entrySet) {
                final Consumer<Pair<String, String>> _function_3 = (Pair<String, String> it) -> {
                  final BiFunction<Long, Long, Long> _function_4 = (Long x, Long y) -> {
                    return Long.valueOf(((x).longValue() + (y).longValue()));
                  };
                  new_layer_map.merge(it, entry.getValue(), _function_4);
                };
                Day21.letters.get(entry.getKey()).forEach(_function_3);
              }
              layer_map = new_layer_map;
            }
          }
          final Function2<Long, Long, Long> _function_3 = (Long x, Long y) -> {
            return Long.valueOf(((x).longValue() + (y).longValue()));
          };
          _xblockexpression_1 = IterableExtensions.<Long>reduce(layer_map.values(), _function_3);
        }
        return _xblockexpression_1;
      };
      _xblockexpression = IterableExtensions.<Long>min(ListExtensions.<ArrayList<String>, Long>map(first_layer_codes, _function_1));
    }
    return _xblockexpression;
  }

  public static Iterable<ArrayList<ArrayList<String>>> treat_code(final List<String> code, final boolean is_numeric) {
    Iterable<ArrayList<ArrayList<String>>> _xblockexpression = null;
    {
      final Function1<String, Coordinate> _function = (String c) -> {
        Map<Coordinate, String> _xifexpression = null;
        if (is_numeric) {
          _xifexpression = Day21.pad_numeric_map;
        } else {
          _xifexpression = Day21.pad_directional_map;
        }
        final Function1<Map.Entry<Coordinate, String>, Boolean> _function_1 = (Map.Entry<Coordinate, String> it) -> {
          String _value = it.getValue();
          return Boolean.valueOf(Objects.equals(_value, c));
        };
        return IterableExtensions.<Map.Entry<Coordinate, String>>findFirst(_xifexpression.entrySet(), _function_1).getKey();
      };
      final List<Coordinate> coordinates = ListExtensions.<String, Coordinate>map(code, _function);
      int _size = coordinates.size();
      int _minus = (_size - 2);
      final Function1<Integer, ArrayList<ArrayList<String>>> _function_1 = (Integer it) -> {
        ArrayList<ArrayList<String>> _xblockexpression_1 = null;
        {
          HashSet<ArrayList<Direction>> _treat_pair = Day21.treat_pair(coordinates.get((it).intValue()), coordinates.get(((it).intValue() + 1)));
          Coordinate _get = coordinates.get((it).intValue());
          Coordinate _xifexpression = null;
          if (is_numeric) {
            _xifexpression = new Coordinate(3, 0);
          } else {
            _xifexpression = new Coordinate(0, 0);
          }
          final Iterable<List<String>> paths = Day21.replay_and_trim(_treat_pair, _get, _xifexpression);
          final ArrayList<ArrayList<String>> ans = CollectionLiterals.<ArrayList<String>>newArrayList();
          final Consumer<List<String>> _function_2 = (List<String> it_1) -> {
            final ArrayList<String> current = new ArrayList<String>(it_1);
            current.add("A");
            ans.add(current);
          };
          paths.forEach(_function_2);
          _xblockexpression_1 = ans;
        }
        return _xblockexpression_1;
      };
      _xblockexpression = IterableExtensions.<Integer, ArrayList<ArrayList<String>>>map(new IntegerRange(0, _minus), _function_1);
    }
    return _xblockexpression;
  }

  public static HashSet<ArrayList<Direction>> treat_pair(final Coordinate c1, final Coordinate c2) {
    HashSet<ArrayList<Direction>> _xblockexpression = null;
    {
      List<Direction> _switchResult = null;
      int _x = c2.getX();
      int _x_1 = c1.getX();
      int _minus = (_x - _x_1);
      final int diff_x = _minus;
      boolean _matched = false;
      if (Objects.equals(diff_x, 0)) {
        _matched=true;
        _switchResult = CollectionLiterals.<Direction>newArrayList();
      }
      if (!_matched) {
        if ((diff_x < 0)) {
          _matched=true;
          final Function1<Integer, Direction> _function = (Integer it) -> {
            return Direction.UP;
          };
          _switchResult = IterableExtensions.<Direction>toList(IterableExtensions.<Integer, Direction>map(new IntegerRange(1, (-diff_x)), _function));
        }
      }
      if (!_matched) {
        final Function1<Integer, Direction> _function_1 = (Integer it) -> {
          return Direction.DOWN;
        };
        _switchResult = IterableExtensions.<Direction>toList(IterableExtensions.<Integer, Direction>map(new IntegerRange(1, diff_x), _function_1));
      }
      final List<Direction> x_moves = _switchResult;
      List<Direction> _switchResult_1 = null;
      int _y = c2.getY();
      int _y_1 = c1.getY();
      int _minus_1 = (_y - _y_1);
      final int diff_y = _minus_1;
      boolean _matched_1 = false;
      if (Objects.equals(diff_y, 0)) {
        _matched_1=true;
        _switchResult_1 = CollectionLiterals.<Direction>newArrayList();
      }
      if (!_matched_1) {
        if ((diff_y < 0)) {
          _matched_1=true;
          final Function1<Integer, Direction> _function_2 = (Integer it) -> {
            return Direction.LEFT;
          };
          _switchResult_1 = IterableExtensions.<Direction>toList(IterableExtensions.<Integer, Direction>map(new IntegerRange(1, (-diff_y)), _function_2));
        }
      }
      if (!_matched_1) {
        final Function1<Integer, Direction> _function_3 = (Integer it) -> {
          return Direction.RIGHT;
        };
        _switchResult_1 = IterableExtensions.<Direction>toList(IterableExtensions.<Integer, Direction>map(new IntegerRange(1, diff_y), _function_3));
      }
      final List<Direction> y_moves = _switchResult_1;
      final HashSet<ArrayList<Direction>> res = CollectionLiterals.<ArrayList<Direction>>newHashSet();
      final ArrayList<Direction> poss1 = CollectionLiterals.<Direction>newArrayList();
      final ArrayList<Direction> poss2 = CollectionLiterals.<Direction>newArrayList();
      poss1.addAll(x_moves);
      poss1.addAll(y_moves);
      poss2.addAll(y_moves);
      poss2.addAll(x_moves);
      res.add(poss1);
      res.add(poss2);
      _xblockexpression = res;
    }
    return _xblockexpression;
  }

  public static Iterable<List<String>> replay_and_trim(final HashSet<ArrayList<Direction>> dirs, final Coordinate source, final Coordinate forbidden) {
    final Function1<ArrayList<Direction>, Boolean> _function = (ArrayList<Direction> list) -> {
      boolean _xblockexpression = false;
      {
        Coordinate current = source;
        int i = 0;
        while (((i < list.size()) && (!Objects.equals(current, forbidden)))) {
          int _plusPlus = i++;
          current = current.otherMove(list.get(_plusPlus));
        }
        _xblockexpression = (!Objects.equals(current, forbidden));
      }
      return Boolean.valueOf(_xblockexpression);
    };
    final Function1<ArrayList<Direction>, List<String>> _function_1 = (ArrayList<Direction> it) -> {
      final Function1<Direction, String> _function_2 = (Direction it_1) -> {
        return Dir.directionToStringArrows(it_1);
      };
      return ListExtensions.<Direction, String>map(it, _function_2);
    };
    return IterableExtensions.<ArrayList<Direction>, List<String>>map(IterableExtensions.<ArrayList<Direction>>filter(dirs, _function), _function_1);
  }
}
