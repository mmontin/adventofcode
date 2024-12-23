package advent2024;

import adventutils.geometry.Coordinate;
import adventutils.geometry.Dir;
import adventutils.geometry.Direction;
import java.util.ArrayList;
import java.util.Collections;
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
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Day21 {
  private static final List<String> example = CollectionLiterals.<String>newArrayList("A", "0", "2", "9", "A");

  private static final List<ArrayList<String>> examples = ListExtensions.<String, ArrayList<String>>map(CollectionLiterals.<String>newArrayList("A029A", "A980A", "A179A", "A456A", "A379A"), ((Function1<String, ArrayList<String>>) (String it) -> {
    final Function1<Character, String> _function = (Character it_1) -> {
      return (it_1 + "");
    };
    List<String> _map = ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray(it.toCharArray())), _function);
    return new ArrayList<String>(_map);
  }));

  private static final List<ArrayList<String>> inputs = ListExtensions.<String, ArrayList<String>>map(CollectionLiterals.<String>newArrayList("A129A", "A176A", "A169A", "A805A", "A208A"), ((Function1<String, ArrayList<String>>) (String it) -> {
    final Function1<Character, String> _function = (Character it_1) -> {
      return (it_1 + "");
    };
    List<String> _map = ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray(it.toCharArray())), _function);
    return new ArrayList<String>(_map);
  }));

  private static final Map<Coordinate, String> pad_numeric_map = new Function0<Map<Coordinate, String>>() {
    @Override
    public Map<Coordinate, String> apply() {
      HashMap<Coordinate, String> _xblockexpression = null;
      {
        final HashMap<Coordinate, String> res = CollectionLiterals.<Coordinate, String>newHashMap();
        final Function1<String, List<String>> _function = (String it) -> {
          final Function1<Character, String> _function_1 = (Character it_1) -> {
            return (it_1 + "");
          };
          return ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray(it.toCharArray())), _function_1);
        };
        final List<List<String>> pad_numeric = ListExtensions.<String, List<String>>map(Collections.<String>unmodifiableList(CollectionLiterals.<String>newArrayList("789", "456", "123", " 0A")), _function);
        int _size = pad_numeric.size();
        int _minus = (_size - 1);
        IntegerRange _upTo = new IntegerRange(0, _minus);
        for (final Integer i : _upTo) {
          int _size_1 = pad_numeric.get(0).size();
          int _minus_1 = (_size_1 - 1);
          IntegerRange _upTo_1 = new IntegerRange(0, _minus_1);
          for (final Integer j : _upTo_1) {
            String _get = pad_numeric.get((i).intValue()).get((j).intValue());
            boolean _notEquals = (!Objects.equals(_get, " "));
            if (_notEquals) {
              Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
              res.put(_coordinate, pad_numeric.get((i).intValue()).get((j).intValue()));
            }
          }
        }
        _xblockexpression = res;
      }
      return _xblockexpression;
    }
  }.apply();

  private static final Coordinate forbidden_pad_numeric = new Coordinate(3, 0);

  private static final Map<Coordinate, String> pad_directional_map = new Function0<Map<Coordinate, String>>() {
    @Override
    public Map<Coordinate, String> apply() {
      HashMap<Coordinate, String> _xblockexpression = null;
      {
        final HashMap<Coordinate, String> res = CollectionLiterals.<Coordinate, String>newHashMap();
        final Function1<String, List<String>> _function = (String it) -> {
          final Function1<Character, String> _function_1 = (Character it_1) -> {
            return (it_1 + "");
          };
          return ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray(it.toCharArray())), _function_1);
        };
        final List<List<String>> pad_directional = ListExtensions.<String, List<String>>map(Collections.<String>unmodifiableList(CollectionLiterals.<String>newArrayList(" ^A", "<v>")), _function);
        int _size = pad_directional.size();
        int _minus = (_size - 1);
        IntegerRange _upTo = new IntegerRange(0, _minus);
        for (final Integer i : _upTo) {
          int _size_1 = pad_directional.get(0).size();
          int _minus_1 = (_size_1 - 1);
          IntegerRange _upTo_1 = new IntegerRange(0, _minus_1);
          for (final Integer j : _upTo_1) {
            String _get = pad_directional.get((i).intValue()).get((j).intValue());
            boolean _notEquals = (!Objects.equals(_get, " "));
            if (_notEquals) {
              Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
              res.put(_coordinate, pad_directional.get((i).intValue()).get((j).intValue()));
            }
          }
        }
        _xblockexpression = res;
      }
      return _xblockexpression;
    }
  }.apply();

  private static final Set<Coordinate> pad_keys = Day21.pad_directional_map.keySet();

  private static final Coordinate forbidden_pad_directional = new Coordinate(0, 0);

  private static final Set<String> chunks = new Function0<Set<String>>() {
    @Override
    public Set<String> apply() {
      HashSet<String> _xblockexpression = null;
      {
        final HashSet<String> res = CollectionLiterals.<String>newHashSet();
        for (final Coordinate c1 : Day21.pad_keys) {
          for (final Coordinate c2 : Day21.pad_keys) {
            {
              String _get = Day21.pad_directional_map.get(c1);
              String _plus = (_get + "");
              String _get_1 = Day21.pad_directional_map.get(c2);
              String _plus_1 = (_get_1 + "");
              final Function1<ArrayList<ArrayList<String>>, String> _function = (ArrayList<ArrayList<String>> it) -> {
                return IterableExtensions.join(IterableExtensions.<ArrayList<String>>head(it));
              };
              final String x = IterableExtensions.<String>head(IterableExtensions.<ArrayList<ArrayList<String>>, String>map(Day21.treat_code(
                CollectionLiterals.<String>newArrayList(_plus, _plus_1), 
                false), _function));
              res.add(x);
            }
          }
        }
        _xblockexpression = res;
      }
      return _xblockexpression;
    }
  }.apply();

  public static void main(final String[] args) {
    final Function2<Long, ArrayList<String>, Long> _function = (Long acc, ArrayList<String> el) -> {
      Long _compute = Day21.compute(el, 1);
      int _size = el.size();
      int _minus = (_size - 1);
      int _parseInt = Integer.parseInt(IterableExtensions.join(el.subList(1, _minus)));
      long _multiply = ((_compute).longValue() * _parseInt);
      return Long.valueOf(((acc).longValue() + _multiply));
    };
    InputOutput.<Long>println(IterableExtensions.<ArrayList<String>, Long>fold(Day21.inputs, Long.valueOf(0L), _function));
    final Function2<Long, ArrayList<String>, Long> _function_1 = (Long acc, ArrayList<String> el) -> {
      Long _compute = Day21.compute(el, 24);
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
      final ArrayList<ArrayList<String>> first_layer_codes = IterableExtensions.<ArrayList<ArrayList<String>>, ArrayList<ArrayList<String>>>fold(Day21.treat_code(code, true), CollectionLiterals.<ArrayList<String>>newArrayList(CollectionLiterals.<String>newArrayList("A")), _function);
      final Function1<ArrayList<String>, Long> _function_1 = (ArrayList<String> first_layer_code) -> {
        Long _xblockexpression_1 = null;
        {
          final Function1<ArrayList<ArrayList<String>>, ArrayList<String>> _function_2 = (ArrayList<ArrayList<String>> it) -> {
            final Function1<ArrayList<String>, Boolean> _function_3 = (ArrayList<String> it_1) -> {
              return Boolean.valueOf(Day21.chunks.contains(IterableExtensions.join(it_1)));
            };
            return IterableExtensions.<ArrayList<String>>findFirst(it, _function_3);
          };
          final Function1<ArrayList<String>, String> _function_3 = (ArrayList<String> it) -> {
            return IterableExtensions.join(it);
          };
          final Iterable<String> first_layer_treated = IterableExtensions.<ArrayList<String>, String>map(IterableExtensions.<ArrayList<ArrayList<String>>, ArrayList<String>>map(Day21.treat_code(first_layer_code, false), _function_2), _function_3);
          final Function2<HashMap<String, Long>, String, HashMap<String, Long>> _function_4 = (HashMap<String, Long> acc, String el) -> {
            HashMap<String, Long> _xblockexpression_2 = null;
            {
              final BiFunction<Long, Long, Long> _function_5 = (Long x, Long y) -> {
                return Long.valueOf(((x).longValue() + (y).longValue()));
              };
              acc.merge(el, Long.valueOf(1L), _function_5);
              _xblockexpression_2 = acc;
            }
            return _xblockexpression_2;
          };
          HashMap<String, Long> layer_map = IterableExtensions.<String, HashMap<String, Long>>fold(first_layer_treated, CollectionLiterals.<String, Long>newHashMap(), _function_4);
          IntegerRange _upTo = new IntegerRange(1, occurrences);
          for (final Integer i : _upTo) {
            layer_map = Day21.transform_chunk(layer_map);
          }
          final Function2<Long, Map.Entry<String, Long>, Long> _function_5 = (Long acc, Map.Entry<String, Long> el) -> {
            int _length = el.getKey().length();
            Long _value = el.getValue();
            long _multiply = (_length * (_value).longValue());
            return Long.valueOf(((acc).longValue() + _multiply));
          };
          _xblockexpression_1 = IterableExtensions.<Map.Entry<String, Long>, Long>fold(layer_map.entrySet(), Long.valueOf(0L), _function_5);
        }
        return _xblockexpression_1;
      };
      _xblockexpression = IterableExtensions.<Long>min(ListExtensions.<ArrayList<String>, Long>map(first_layer_codes, _function_1));
    }
    return _xblockexpression;
  }

  public static HashMap<String, Long> transform_chunk(final Map<String, Long> layer_map) {
    final Function2<HashMap<String, Long>, Map.Entry<String, Long>, HashMap<String, Long>> _function = (HashMap<String, Long> acc, Map.Entry<String, Long> el) -> {
      HashMap<String, Long> _xblockexpression = null;
      {
        final Function1<Character, String> _function_1 = (Character it) -> {
          return (it + "");
        };
        List<String> _map = ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray(el.getKey().toCharArray())), _function_1);
        final ArrayList<String> code = new ArrayList<String>(_map);
        code.add(0, "A");
        final Function1<ArrayList<ArrayList<String>>, ArrayList<String>> _function_2 = (ArrayList<ArrayList<String>> it) -> {
          final Function1<ArrayList<String>, Boolean> _function_3 = (ArrayList<String> it_1) -> {
            return Boolean.valueOf(Day21.chunks.contains(IterableExtensions.join(it_1)));
          };
          return IterableExtensions.<ArrayList<String>>findFirst(it, _function_3);
        };
        final Function1<ArrayList<String>, String> _function_3 = (ArrayList<String> it) -> {
          return IterableExtensions.join(it);
        };
        final Consumer<String> _function_4 = (String it) -> {
          final BiFunction<Long, Long, Long> _function_5 = (Long x, Long y) -> {
            return Long.valueOf(((x).longValue() + (y).longValue()));
          };
          acc.merge(it, el.getValue(), _function_5);
        };
        IterableExtensions.<ArrayList<String>, String>map(IterableExtensions.<ArrayList<ArrayList<String>>, ArrayList<String>>map(Day21.treat_code(code, false), _function_2), _function_3).forEach(_function_4);
        _xblockexpression = acc;
      }
      return _xblockexpression;
    };
    return IterableExtensions.<Map.Entry<String, Long>, HashMap<String, Long>>fold(layer_map.entrySet(), CollectionLiterals.<String, Long>newHashMap(), _function);
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
            _xifexpression = Day21.forbidden_pad_numeric;
          } else {
            _xifexpression = Day21.forbidden_pad_directional;
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
