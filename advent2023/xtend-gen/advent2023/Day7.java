package advent2023;

import adventutils.input.InputLoader;
import com.google.common.base.Objects;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day7 {
  public static void main(final String[] args) {
    final Function1<String, Pair<Pair<HAND, List<String>>, Integer>> _function = new Function1<String, Pair<Pair<HAND, List<String>>, Integer>>() {
      public Pair<Pair<HAND, List<String>>, Integer> apply(final String it) {
        Pair<Pair<HAND, List<String>>, Integer> _xblockexpression = null;
        {
          final String[] split = it.split(" ");
          final Function1<Character, String> _function = new Function1<Character, String>() {
            public String apply(final Character it_1) {
              return (it_1 + "");
            }
          };
          final List<String> hand = IterableExtensions.<String>toList(ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray((split[0]).toCharArray())), _function));
          final int bet = Integer.parseInt(split[1]);
          final HAND spread = Day7.spread(hand, false);
          Pair<HAND, List<String>> _mappedTo = Pair.<HAND, List<String>>of(spread, hand);
          _xblockexpression = Pair.<Pair<HAND, List<String>>, Integer>of(_mappedTo, Integer.valueOf(bet));
        }
        return _xblockexpression;
      }
    };
    List<Pair<Pair<HAND, List<String>>, Integer>> _map = ListExtensions.<String, Pair<Pair<HAND, List<String>>, Integer>>map(new InputLoader(Integer.valueOf(2023), Integer.valueOf(7)).getInputs(), _function);
    final Comparator<Pair<Pair<HAND, List<String>>, Integer>> _function_1 = new Comparator<Pair<Pair<HAND, List<String>>, Integer>>() {
      public int compare(final Pair<Pair<HAND, List<String>>, Integer> x, final Pair<Pair<HAND, List<String>>, Integer> y) {
        return Day7.comparePair(x.getKey(), y.getKey(), false);
      }
    };
    final List<Pair<Pair<HAND, List<String>>, Integer>> sorted = ListExtensions.<Pair<Pair<HAND, List<String>>, Integer>>sortInplace(new ArrayList<Pair<Pair<HAND, List<String>>, Integer>>(_map), _function_1);
    int _size = sorted.size();
    final Function2<Long, Integer, Long> _function_2 = new Function2<Long, Integer, Long>() {
      public Long apply(final Long res, final Integer i) {
        Integer _value = sorted.get(((i).intValue() - 1)).getValue();
        long _multiply = (((long) (i).intValue()) * ((long) (_value).intValue()));
        return Long.valueOf(((res).longValue() + _multiply));
      }
    };
    InputOutput.<Long>println(IterableExtensions.<Integer, Long>fold(new IntegerRange(1, _size), Long.valueOf(0L), _function_2));
    final Function1<String, Pair<Pair<HAND, List<String>>, Integer>> _function_3 = new Function1<String, Pair<Pair<HAND, List<String>>, Integer>>() {
      public Pair<Pair<HAND, List<String>>, Integer> apply(final String it) {
        Pair<Pair<HAND, List<String>>, Integer> _xblockexpression = null;
        {
          final String[] split = it.split(" ");
          final Function1<Character, String> _function = new Function1<Character, String>() {
            public String apply(final Character it_1) {
              return (it_1 + "");
            }
          };
          final List<String> hand = IterableExtensions.<String>toList(ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray((split[0]).toCharArray())), _function));
          final int bet = Integer.parseInt(split[1]);
          final HAND spread = Day7.spread(hand, true);
          Pair<HAND, List<String>> _mappedTo = Pair.<HAND, List<String>>of(spread, hand);
          _xblockexpression = Pair.<Pair<HAND, List<String>>, Integer>of(_mappedTo, Integer.valueOf(bet));
        }
        return _xblockexpression;
      }
    };
    List<Pair<Pair<HAND, List<String>>, Integer>> _map_1 = ListExtensions.<String, Pair<Pair<HAND, List<String>>, Integer>>map(new InputLoader(Integer.valueOf(2023), Integer.valueOf(7)).getInputs(), _function_3);
    final Comparator<Pair<Pair<HAND, List<String>>, Integer>> _function_4 = new Comparator<Pair<Pair<HAND, List<String>>, Integer>>() {
      public int compare(final Pair<Pair<HAND, List<String>>, Integer> x, final Pair<Pair<HAND, List<String>>, Integer> y) {
        return Day7.comparePair(x.getKey(), y.getKey(), true);
      }
    };
    final List<Pair<Pair<HAND, List<String>>, Integer>> sorted2 = ListExtensions.<Pair<Pair<HAND, List<String>>, Integer>>sortInplace(new ArrayList<Pair<Pair<HAND, List<String>>, Integer>>(_map_1), _function_4);
    int _size_1 = sorted2.size();
    final Function2<Long, Integer, Long> _function_5 = new Function2<Long, Integer, Long>() {
      public Long apply(final Long res, final Integer i) {
        Integer _value = sorted2.get(((i).intValue() - 1)).getValue();
        long _multiply = (((long) (i).intValue()) * ((long) (_value).intValue()));
        return Long.valueOf(((res).longValue() + _multiply));
      }
    };
    InputOutput.<Long>println(IterableExtensions.<Integer, Long>fold(new IntegerRange(1, _size_1), Long.valueOf(0L), _function_5));
  }

  public static int toInt(final HAND hand) {
    int _switchResult = (int) 0;
    if (hand != null) {
      switch (hand) {
        case HIGH:
          _switchResult = 0;
          break;
        case ONE:
          _switchResult = 1;
          break;
        case TWO:
          _switchResult = 2;
          break;
        case THREE:
          _switchResult = 3;
          break;
        case FULL:
          _switchResult = 4;
          break;
        case FOUR:
          _switchResult = 5;
          break;
        case FIVE:
          _switchResult = 6;
          break;
        default:
          break;
      }
    }
    return _switchResult;
  }

  public static int toInt(final String s, final boolean joker) {
    int _switchResult = (int) 0;
    boolean _matched = false;
    if (Objects.equal(s, "2")) {
      _matched=true;
      _switchResult = 0;
    }
    if (!_matched) {
      if (Objects.equal(s, "3")) {
        _matched=true;
        _switchResult = 1;
      }
    }
    if (!_matched) {
      if (Objects.equal(s, "4")) {
        _matched=true;
        _switchResult = 2;
      }
    }
    if (!_matched) {
      if (Objects.equal(s, "5")) {
        _matched=true;
        _switchResult = 3;
      }
    }
    if (!_matched) {
      if (Objects.equal(s, "6")) {
        _matched=true;
        _switchResult = 4;
      }
    }
    if (!_matched) {
      if (Objects.equal(s, "7")) {
        _matched=true;
        _switchResult = 5;
      }
    }
    if (!_matched) {
      if (Objects.equal(s, "8")) {
        _matched=true;
        _switchResult = 6;
      }
    }
    if (!_matched) {
      if (Objects.equal(s, "9")) {
        _matched=true;
        _switchResult = 7;
      }
    }
    if (!_matched) {
      if (Objects.equal(s, "T")) {
        _matched=true;
        _switchResult = 8;
      }
    }
    if (!_matched) {
      if (Objects.equal(s, "J")) {
        _matched=true;
        int _xifexpression = (int) 0;
        if (joker) {
          _xifexpression = (-1);
        } else {
          _xifexpression = 9;
        }
        _switchResult = _xifexpression;
      }
    }
    if (!_matched) {
      if (Objects.equal(s, "Q")) {
        _matched=true;
        _switchResult = 10;
      }
    }
    if (!_matched) {
      if (Objects.equal(s, "K")) {
        _matched=true;
        _switchResult = 11;
      }
    }
    if (!_matched) {
      _switchResult = 12;
    }
    return _switchResult;
  }

  public static int compare(final HAND left, final HAND right) {
    return Integer.valueOf(Day7.toInt(left)).compareTo(Integer.valueOf(Day7.toInt(right)));
  }

  public static int compare(final List<String> left, final List<String> right, final boolean joker) {
    int _xblockexpression = (int) 0;
    {
      final Function1<String, Integer> _function = new Function1<String, Integer>() {
        public Integer apply(final String it) {
          return Integer.valueOf(Day7.toInt(it, joker));
        }
      };
      final List<Integer> leftInts = ListExtensions.<String, Integer>map(left, _function);
      final Function1<String, Integer> _function_1 = new Function1<String, Integer>() {
        public Integer apply(final String it) {
          return Integer.valueOf(Day7.toInt(it, joker));
        }
      };
      final List<Integer> rightInts = ListExtensions.<String, Integer>map(right, _function_1);
      int i = 0;
      int output = 0;
      while ((output == 0)) {
        {
          output = leftInts.get(i).compareTo(rightInts.get(i));
          i++;
        }
      }
      _xblockexpression = output;
    }
    return _xblockexpression;
  }

  public static int comparePair(final Pair<HAND, List<String>> left, final Pair<HAND, List<String>> right, final boolean joker) {
    int _xblockexpression = (int) 0;
    {
      int res = Day7.compare(left.getKey(), right.getKey());
      if ((res == 0)) {
        res = Day7.compare(left.getValue(), right.getValue(), joker);
      }
      _xblockexpression = res;
    }
    return _xblockexpression;
  }

  public static HAND spread(final List<String> l, final boolean joker) {
    HAND _xblockexpression = null;
    {
      final Function1<String, String> _function = new Function1<String, String>() {
        public String apply(final String it) {
          return it;
        }
      };
      final Map<String, List<String>> groups = IterableExtensions.<String, String>groupBy(l, _function);
      if (joker) {
        final List<String> entry = groups.remove("J");
        int _size = groups.size();
        boolean _greaterThan = (_size > 0);
        if (_greaterThan) {
          if ((entry != null)) {
            final Comparator<Map.Entry<String, List<String>>> _function_1 = new Comparator<Map.Entry<String, List<String>>>() {
              public int compare(final Map.Entry<String, List<String>> x, final Map.Entry<String, List<String>> y) {
                int _xblockexpression = (int) 0;
                {
                  int cmp = Integer.valueOf(x.getValue().size()).compareTo(Integer.valueOf(y.getValue().size()));
                  if ((cmp == 0)) {
                    cmp = Integer.valueOf(Day7.toInt(x.getKey(), false)).compareTo(Integer.valueOf(Day7.toInt(y.getKey(), false)));
                  }
                  _xblockexpression = cmp;
                }
                return _xblockexpression;
              }
            };
            final Map.Entry<String, List<String>> maxEntry = IterableExtensions.<Map.Entry<String, List<String>>>max(groups.entrySet(), _function_1);
            maxEntry.getValue().addAll(entry);
          }
        } else {
          groups.put("J", entry);
        }
      }
      final Collection<List<String>> vals = groups.values();
      HAND _switchResult = null;
      int _size_1 = vals.size();
      switch (_size_1) {
        case 1:
          _switchResult = HAND.FIVE;
          break;
        case 2:
          HAND _xifexpression = null;
          if ((((((List<String>[])Conversions.unwrapArray(vals, List.class))[0]).size() == 4) || ((((List<String>[])Conversions.unwrapArray(vals, List.class))[1]).size() == 4))) {
            _xifexpression = HAND.FOUR;
          } else {
            _xifexpression = HAND.FULL;
          }
          _switchResult = _xifexpression;
          break;
        case 3:
          HAND _xifexpression_1 = null;
          if (((((((List<String>[])Conversions.unwrapArray(vals, List.class))[0]).size() == 3) || ((((List<String>[])Conversions.unwrapArray(vals, List.class))[1]).size() == 3)) || ((((List<String>[])Conversions.unwrapArray(vals, List.class))[2]).size() == 3))) {
            _xifexpression_1 = HAND.THREE;
          } else {
            _xifexpression_1 = HAND.TWO;
          }
          _switchResult = _xifexpression_1;
          break;
        case 4:
          _switchResult = HAND.ONE;
          break;
        case 5:
          _switchResult = HAND.HIGH;
          break;
      }
      _xblockexpression = _switchResult;
    }
    return _xblockexpression;
  }
}
