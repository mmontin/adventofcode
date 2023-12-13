package advent2023;

import adventutils.RunnerWithMemory2;
import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.List;
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
public class Day12 {
  public static void main(final String[] args) {
    final Function1<String, Pair<String, List<Integer>>> _function = (String it) -> {
      Pair<String, List<Integer>> _xblockexpression = null;
      {
        final String[] split = it.split(" ");
        String _get = split[0];
        final Function1<String, Integer> _function_1 = (String it_1) -> {
          return Integer.valueOf(Integer.parseInt(it_1));
        };
        List<Integer> _map = ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray((split[1]).split(","))), _function_1);
        _xblockexpression = Pair.<String, List<Integer>>of(_get, _map);
      }
      return _xblockexpression;
    };
    final List<Pair<String, List<Integer>>> inputs = ListExtensions.<String, Pair<String, List<Integer>>>map(new InputLoader(Integer.valueOf(2023), Integer.valueOf(12)).getInputs(), _function);
    final Function2<Long, Pair<String, List<Integer>>, Long> _function_1 = (Long acc, Pair<String, List<Integer>> el) -> {
      Long _call = Day12.myRunner.call(el.getKey(), el.getValue());
      return Long.valueOf(((acc).longValue() + (_call).longValue()));
    };
    InputOutput.<Long>println(IterableExtensions.<Pair<String, List<Integer>>, Long>fold(inputs, Long.valueOf(0L), _function_1));
    final Function1<Pair<String, List<Integer>>, Pair<String, ArrayList<Integer>>> _function_2 = (Pair<String, List<Integer>> el) -> {
      Pair<String, ArrayList<Integer>> _xblockexpression = null;
      {
        final ArrayList<Integer> new_list = CollectionLiterals.<Integer>newArrayList();
        final Consumer<Integer> _function_3 = (Integer it) -> {
          new_list.addAll(el.getValue());
        };
        new IntegerRange(0, 4).forEach(_function_3);
        String _key = el.getKey();
        String _repeat = (_key + "?").repeat(4);
        String _key_1 = el.getKey();
        String _plus = (_repeat + _key_1);
        _xblockexpression = Pair.<String, ArrayList<Integer>>of(_plus, new_list);
      }
      return _xblockexpression;
    };
    final List<Pair<String, ArrayList<Integer>>> inputs_mod = ListExtensions.<Pair<String, List<Integer>>, Pair<String, ArrayList<Integer>>>map(inputs, _function_2);
    final Function2<Long, Pair<String, ArrayList<Integer>>, Long> _function_3 = (Long acc, Pair<String, ArrayList<Integer>> el) -> {
      Long _call = Day12.myRunner.call(el.getKey(), el.getValue());
      return Long.valueOf(((acc).longValue() + (_call).longValue()));
    };
    InputOutput.<Long>println(IterableExtensions.<Pair<String, ArrayList<Integer>>, Long>fold(inputs_mod, Long.valueOf(0L), _function_3));
  }

  public static ArrayList<Pair<Pair<String, String>, String>> fulls(final String s, final int size, final int left_buffer, final int right_buffer) {
    ArrayList<Pair<Pair<String, String>, String>> _xblockexpression = null;
    {
      final ArrayList<Pair<Pair<String, String>, String>> output = CollectionLiterals.<Pair<Pair<String, String>, String>>newArrayList();
      int _length = s.length();
      int _minus = (_length - left_buffer);
      int _minus_1 = (_minus - right_buffer);
      boolean _lessEqualsThan = (size <= _minus_1);
      if (_lessEqualsThan) {
        int _length_1 = s.length();
        int _minus_2 = (_length_1 - size);
        int _minus_3 = (_minus_2 - right_buffer);
        final Consumer<Integer> _function = (Integer it) -> {
          boolean _full = Day12.full(s.substring((it).intValue(), ((it).intValue() + size)));
          if (_full) {
            String _substring = s.substring(0, (it).intValue());
            String _replaceAll = s.substring((it).intValue(), ((it).intValue() + size)).replaceAll("\\?", "#");
            Pair<String, String> _mappedTo = Pair.<String, String>of(_substring, _replaceAll);
            String _substring_1 = s.substring(((it).intValue() + size));
            Pair<Pair<String, String>, String> _mappedTo_1 = Pair.<Pair<String, String>, String>of(_mappedTo, _substring_1);
            output.add(_mappedTo_1);
          }
        };
        new IntegerRange(left_buffer, _minus_3).forEach(_function);
      }
      _xblockexpression = output;
    }
    return _xblockexpression;
  }

  public static boolean empty(final String s) {
    return s.matches("[\\.]*");
  }

  public static boolean possiblyEmpty(final String s) {
    return s.matches("[\\.\\?]*");
  }

  public static boolean full(final String s) {
    return s.matches("[\\?#]+");
  }

  public static Integer minSize(final List<Integer> input) {
    Integer _switchResult = null;
    int _size = input.size();
    switch (_size) {
      case 0:
        _switchResult = Integer.valueOf(0);
        break;
      case 1:
        _switchResult = input.get(0);
        break;
      default:
        int _size_1 = input.size();
        int _minus = (_size_1 - 2);
        final Function2<Integer, Integer, Integer> _function = (Integer acc, Integer i) -> {
          Integer _get = input.get(((i).intValue() + 1));
          return Integer.valueOf((((acc).intValue() + 1) + (_get).intValue()));
        };
        _switchResult = IterableExtensions.<Integer, Integer>fold(new IntegerRange(0, _minus), input.get(0), _function);
        break;
    }
    return _switchResult;
  }

  public static Pair<Pair<List<Integer>, Integer>, List<Integer>> breakList(final List<Integer> input) {
    Pair<Pair<List<Integer>, Integer>, List<Integer>> _xblockexpression = null;
    {
      final Integer max = IterableExtensions.<Integer>max(input);
      final int max_pos = input.indexOf(IterableExtensions.<Integer>max(input));
      List<Integer> _subList = input.subList(0, max_pos);
      Pair<List<Integer>, Integer> _mappedTo = Pair.<List<Integer>, Integer>of(_subList, max);
      List<Integer> _subList_1 = input.subList((max_pos + 1), input.size());
      _xblockexpression = Pair.<Pair<List<Integer>, Integer>, List<Integer>>of(_mappedTo, _subList_1);
    }
    return _xblockexpression;
  }

  private static final RunnerWithMemory2<String, List<Integer>, Long> myRunner = new RunnerWithMemory2<String, List<Integer>, Long>(((Function2<String, List<Integer>, Long>) (String a, List<Integer> b) -> {
    return Day12.count(a, b);
  }));

  public static Long count(final String line, final List<Integer> brokens) {
    Long _switchResult = null;
    boolean _matched = false;
    if ((brokens.isEmpty() && Day12.possiblyEmpty(line))) {
      _matched=true;
      _switchResult = Long.valueOf(1L);
    }
    if (!_matched) {
      if ((brokens.isEmpty() || Day12.empty(line))) {
        _matched=true;
        _switchResult = Long.valueOf(0L);
      }
    }
    if (!_matched) {
      Long _xblockexpression = null;
      {
        final Pair<Pair<List<Integer>, Integer>, List<Integer>> splitted = Day12.breakList(brokens);
        final List<Integer> left = splitted.getKey().getKey();
        final Integer max = splitted.getKey().getValue();
        final List<Integer> right = splitted.getValue();
        final Function2<Long, Pair<Pair<String, String>, String>, Long> _function = (Long acc, Pair<Pair<String, String>, String> el) -> {
          long _xblockexpression_1 = (long) 0;
          {
            final String left_string = el.getKey().getKey();
            final String right_string = el.getValue();
            long left_possibilities = 0L;
            boolean _isEmpty = left_string.isEmpty();
            boolean _not = (!_isEmpty);
            if (_not) {
              int _length = left_string.length();
              int _minus = (_length - 1);
              final String last_left = left_string.substring(_minus);
              int _length_1 = left_string.length();
              int _minus_1 = (_length_1 - 1);
              final String first_left = left_string.substring(0, _minus_1);
              boolean _possiblyEmpty = Day12.possiblyEmpty(last_left);
              if (_possiblyEmpty) {
                long _left_possibilities = left_possibilities;
                Long _call = Day12.myRunner.call(first_left, left);
                left_possibilities = (_left_possibilities + (_call).longValue());
              }
            } else {
              boolean _isEmpty_1 = left.isEmpty();
              if (_isEmpty_1) {
                left_possibilities++;
              }
            }
            long right_possibilities = 0L;
            if ((left_possibilities != 0)) {
              boolean _isEmpty_2 = right_string.isEmpty();
              boolean _not_1 = (!_isEmpty_2);
              if (_not_1) {
                final String first_right = right_string.substring(0, 1);
                final String last_right = right_string.substring(1);
                boolean _possiblyEmpty_1 = Day12.possiblyEmpty(first_right);
                if (_possiblyEmpty_1) {
                  long _right_possibilities = right_possibilities;
                  Long _call_1 = Day12.myRunner.call(last_right, right);
                  right_possibilities = (_right_possibilities + (_call_1).longValue());
                }
              } else {
                boolean _isEmpty_3 = right.isEmpty();
                if (_isEmpty_3) {
                  right_possibilities++;
                }
              }
            }
            _xblockexpression_1 = ((acc).longValue() + (right_possibilities * left_possibilities));
          }
          return Long.valueOf(_xblockexpression_1);
        };
        _xblockexpression = IterableExtensions.<Pair<Pair<String, String>, String>, Long>fold(Day12.fulls(line, (max).intValue(), (Day12.minSize(left)).intValue(), (Day12.minSize(right)).intValue()), Long.valueOf(0L), _function);
      }
      _switchResult = _xblockexpression;
    }
    return _switchResult;
  }
}
