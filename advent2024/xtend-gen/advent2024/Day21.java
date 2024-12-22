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
  private static final List<String> example = CollectionLiterals.<String>newArrayList("0", "2", "9", "A");

  private static final List<ArrayList<String>> inputs = ListExtensions.<String, ArrayList<String>>map(CollectionLiterals.<String>newArrayList("129A", "176A", "169A", "805A", "208A"), ((Function1<String, ArrayList<String>>) (String it) -> {
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

  private static final Map<Coordinate, String> pad_directionnel_map = new Function0<Map<Coordinate, String>>() {
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
        final List<List<String>> pad_directionnel = ListExtensions.<String, List<String>>map(Collections.<String>unmodifiableList(CollectionLiterals.<String>newArrayList(" ^A", "<v>")), _function);
        int _size = pad_directionnel.size();
        int _minus = (_size - 1);
        IntegerRange _upTo = new IntegerRange(0, _minus);
        for (final Integer i : _upTo) {
          int _size_1 = pad_directionnel.get(0).size();
          int _minus_1 = (_size_1 - 1);
          IntegerRange _upTo_1 = new IntegerRange(0, _minus_1);
          for (final Integer j : _upTo_1) {
            String _get = pad_directionnel.get((i).intValue()).get((j).intValue());
            boolean _notEquals = (!Objects.equals(_get, " "));
            if (_notEquals) {
              Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
              res.put(_coordinate, pad_directionnel.get((i).intValue()).get((j).intValue()));
            }
          }
        }
        _xblockexpression = res;
      }
      return _xblockexpression;
    }
  }.apply();

  private static final Coordinate forbidden_pad_directionnel = new Coordinate(0, 0);

  public static void main(final String[] args) {
    final Function2<Integer, ArrayList<String>, Integer> _function = (Integer acc, ArrayList<String> el) -> {
      int _xblockexpression = (int) 0;
      {
        final int number = Integer.parseInt(IterableExtensions.join(el.subList(0, 3)));
        int _treat_layered_code = Day21.treat_layered_code(el);
        int _multiply = (number * _treat_layered_code);
        _xblockexpression = ((acc).intValue() + _multiply);
      }
      return Integer.valueOf(_xblockexpression);
    };
    InputOutput.<Integer>println(IterableExtensions.<ArrayList<String>, Integer>fold(Day21.inputs, Integer.valueOf(0), _function));
  }

  public static int treat_layered_code(final List<String> code) {
    int _xblockexpression = (int) 0;
    {
      final Iterable<ArrayList<ArrayList<String>>> first_layers_inputs = Day21.treat_code(code, true);
      final ArrayList<ArrayList<String>> first_layers_inputs_merged = Day21.merge_possibilities(first_layers_inputs);
      final Function1<ArrayList<String>, Iterable<ArrayList<ArrayList<String>>>> _function = (ArrayList<String> it) -> {
        return Day21.treat_code(it, false);
      };
      List<Iterable<ArrayList<ArrayList<String>>>> second_layer = ListExtensions.<ArrayList<String>, Iterable<ArrayList<ArrayList<String>>>>map(first_layers_inputs_merged, _function);
      final ArrayList<ArrayList<String>> all_second_layer_merged = CollectionLiterals.<ArrayList<String>>newArrayList();
      final Consumer<Iterable<ArrayList<ArrayList<String>>>> _function_1 = (Iterable<ArrayList<ArrayList<String>>> it) -> {
        all_second_layer_merged.addAll(Day21.merge_possibilities(it));
      };
      second_layer.forEach(_function_1);
      final Function1<ArrayList<String>, Iterable<ArrayList<ArrayList<String>>>> _function_2 = (ArrayList<String> it) -> {
        return Day21.treat_code(it, false);
      };
      final List<Iterable<ArrayList<ArrayList<String>>>> third_layer = ListExtensions.<ArrayList<String>, Iterable<ArrayList<ArrayList<String>>>>map(all_second_layer_merged, _function_2);
      final ArrayList<ArrayList<String>> all_third_layer_merged = CollectionLiterals.<ArrayList<String>>newArrayList();
      final Consumer<Iterable<ArrayList<ArrayList<String>>>> _function_3 = (Iterable<ArrayList<ArrayList<String>>> it) -> {
        all_third_layer_merged.addAll(Day21.merge_possibilities(it));
      };
      third_layer.forEach(_function_3);
      final Function1<ArrayList<String>, Integer> _function_4 = (ArrayList<String> it) -> {
        return Integer.valueOf(it.size());
      };
      _xblockexpression = IterableExtensions.<ArrayList<String>, Integer>minBy(all_third_layer_merged, _function_4).size();
    }
    return _xblockexpression;
  }

  public static ArrayList<ArrayList<String>> merge_possibilities(final Iterable<ArrayList<ArrayList<String>>> input) {
    final Function2<ArrayList<ArrayList<String>>, ArrayList<ArrayList<String>>, ArrayList<ArrayList<String>>> _function = (ArrayList<ArrayList<String>> acc, ArrayList<ArrayList<String>> el) -> {
      ArrayList<ArrayList<String>> _xblockexpression = null;
      {
        final ArrayList<ArrayList<String>> res = CollectionLiterals.<ArrayList<String>>newArrayList();
        final Consumer<ArrayList<String>> _function_1 = (ArrayList<String> l1) -> {
          final Consumer<ArrayList<String>> _function_2 = (ArrayList<String> l2) -> {
            final ArrayList<String> current = CollectionLiterals.<String>newArrayList();
            current.addAll(l2);
            current.addAll(l1);
            res.add(current);
          };
          acc.forEach(_function_2);
        };
        el.forEach(_function_1);
        _xblockexpression = res;
      }
      return _xblockexpression;
    };
    return IterableExtensions.<ArrayList<ArrayList<String>>, ArrayList<ArrayList<String>>>fold(input, CollectionLiterals.<ArrayList<String>>newArrayList(CollectionLiterals.<String>newArrayList()), _function);
  }

  public static Iterable<ArrayList<ArrayList<String>>> treat_code(final List<String> code, final boolean is_numeric) {
    Iterable<ArrayList<ArrayList<String>>> _xblockexpression = null;
    {
      code.add(0, "A");
      final Function1<String, Coordinate> _function = (String c) -> {
        Map<Coordinate, String> _xifexpression = null;
        if (is_numeric) {
          _xifexpression = Day21.pad_numeric_map;
        } else {
          _xifexpression = Day21.pad_directionnel_map;
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
            _xifexpression = Day21.forbidden_pad_directionnel;
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
