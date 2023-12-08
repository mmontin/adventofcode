package advent2023;

import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day7 {
  public static void main(final String[] args) {
    final List<String> inputs = new InputLoader(Integer.valueOf(2023), Integer.valueOf(7)).getInputs();
    Day7.process(inputs, false);
    Day7.process(inputs, true);
  }

  public static void process(final List<String> inputs, final boolean joker) {
    final Function1<String, Pair<Pair<HAND, List<String>>, Integer>> _function = (String it) -> {
      Pair<Pair<HAND, List<String>>, Integer> _xblockexpression = null;
      {
        final String[] split = it.split(" ");
        final Function1<Character, String> _function_1 = (Character it_1) -> {
          return (it_1 + "");
        };
        final List<String> hand = IterableExtensions.<String>toList(ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray((split[0]).toCharArray())), _function_1));
        final int bet = Integer.parseInt(split[1]);
        final HAND spread = Day7.spread(hand, joker);
        Pair<HAND, List<String>> _mappedTo = Pair.<HAND, List<String>>of(spread, hand);
        _xblockexpression = Pair.<Pair<HAND, List<String>>, Integer>of(_mappedTo, Integer.valueOf(bet));
      }
      return _xblockexpression;
    };
    List<Pair<Pair<HAND, List<String>>, Integer>> _map = ListExtensions.<String, Pair<Pair<HAND, List<String>>, Integer>>map(inputs, _function);
    final Comparator<Pair<Pair<HAND, List<String>>, Integer>> _function_1 = (Pair<Pair<HAND, List<String>>, Integer> x, Pair<Pair<HAND, List<String>>, Integer> y) -> {
      return Day7.comparePair(x.getKey(), y.getKey(), joker);
    };
    List<Pair<Pair<HAND, List<String>>, Integer>> _sortInplace = ListExtensions.<Pair<Pair<HAND, List<String>>, Integer>>sortInplace(new ArrayList<Pair<Pair<HAND, List<String>>, Integer>>(_map), _function_1);
    Pair<Integer, Integer> _mappedTo = Pair.<Integer, Integer>of(Integer.valueOf(0), Integer.valueOf(1));
    final Function2<Pair<Integer, Integer>, Pair<Pair<HAND, List<String>>, Integer>, Pair<Integer, Integer>> _function_2 = (Pair<Integer, Integer> acc, Pair<Pair<HAND, List<String>>, Integer> el) -> {
      Pair<Integer, Integer> _xblockexpression = null;
      {
        final Integer count = acc.getKey();
        final Integer i = acc.getValue();
        Integer _value = el.getValue();
        int _multiply = ((i).intValue() * (_value).intValue());
        int _plus = ((count).intValue() + _multiply);
        _xblockexpression = Pair.<Integer, Integer>of(Integer.valueOf(_plus), Integer.valueOf(((i).intValue() + 1)));
      }
      return _xblockexpression;
    };
    InputOutput.<Integer>println(IterableExtensions.<Pair<Pair<HAND, List<String>>, Integer>, Pair<Integer, Integer>>fold(_sortInplace, _mappedTo, _function_2).getKey());
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
    if (s != null) {
      switch (s) {
        case "2":
          _switchResult = 0;
          break;
        case "3":
          _switchResult = 1;
          break;
        case "4":
          _switchResult = 2;
          break;
        case "5":
          _switchResult = 3;
          break;
        case "6":
          _switchResult = 4;
          break;
        case "7":
          _switchResult = 5;
          break;
        case "8":
          _switchResult = 6;
          break;
        case "9":
          _switchResult = 7;
          break;
        case "T":
          _switchResult = 8;
          break;
        case "J":
          int _xifexpression = (int) 0;
          if (joker) {
            _xifexpression = (-1);
          } else {
            _xifexpression = 9;
          }
          _switchResult = _xifexpression;
          break;
        case "Q":
          _switchResult = 10;
          break;
        case "K":
          _switchResult = 11;
          break;
        default:
          _switchResult = 12;
          break;
      }
    } else {
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
      final Function1<String, Integer> _function = (String it) -> {
        return Integer.valueOf(Day7.toInt(it, joker));
      };
      final List<Integer> leftInts = ListExtensions.<String, Integer>map(left, _function);
      final Function1<String, Integer> _function_1 = (String it) -> {
        return Integer.valueOf(Day7.toInt(it, joker));
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
      final Function1<String, String> _function = (String it) -> {
        return it;
      };
      final Map<String, List<String>> groups = IterableExtensions.<String, String>groupBy(l, _function);
      if (joker) {
        final List<String> entry = groups.remove("J");
        int _size = groups.size();
        boolean _greaterThan = (_size > 0);
        if (_greaterThan) {
          if ((entry != null)) {
            final Comparator<Map.Entry<String, List<String>>> _function_1 = (Map.Entry<String, List<String>> x, Map.Entry<String, List<String>> y) -> {
              int _xblockexpression_1 = (int) 0;
              {
                int cmp = Integer.valueOf(x.getValue().size()).compareTo(Integer.valueOf(y.getValue().size()));
                if ((cmp == 0)) {
                  cmp = Integer.valueOf(Day7.toInt(x.getKey(), false)).compareTo(Integer.valueOf(Day7.toInt(y.getKey(), false)));
                }
                _xblockexpression_1 = cmp;
              }
              return _xblockexpression_1;
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
