package advent2022;

import adventutils.input.InputLoader;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day25 {
  public static void main(final String[] args) {
    final Function1<String, char[]> _function = (String it) -> {
      return it.toCharArray();
    };
    final Function2<Long, char[], Long> _function_1 = (Long acc, char[] v) -> {
      long _xblockexpression = (long) 0;
      {
        final Function1<Character, String> _function_2 = (Character it) -> {
          return it.toString();
        };
        final List<String> strings = ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray(v)), _function_2);
        int _size = strings.size();
        final Function2<Long, Integer, Long> _function_3 = (Long acc1, Integer i) -> {
          long _xblockexpression_1 = (long) 0;
          {
            int _size_1 = strings.size();
            int _minus = (_size_1 - (i).intValue());
            int _minus_1 = (_minus - 1);
            final String current = strings.get(_minus_1);
            long _switchResult = (long) 0;
            if (current != null) {
              switch (current) {
                case "=":
                  _switchResult = (-2);
                  break;
                case "-":
                  _switchResult = (-1);
                  break;
                default:
                  _switchResult = Long.parseLong(current);
                  break;
              }
            } else {
              _switchResult = Long.parseLong(current);
            }
            double _pow = Math.pow(5, (i).intValue());
            long _multiply = (_switchResult * ((long) _pow));
            _xblockexpression_1 = ((acc1).longValue() + _multiply);
          }
          return Long.valueOf(_xblockexpression_1);
        };
        Long _fold = IterableExtensions.<Integer, Long>fold(new ExclusiveRange(0, _size, true), Long.valueOf(0L), _function_3);
        _xblockexpression = ((acc).longValue() + (_fold).longValue());
      }
      return Long.valueOf(_xblockexpression);
    };
    final Function1<Character, Integer> _function_2 = (Character it) -> {
      return Integer.valueOf(Integer.parseInt(it.toString()));
    };
    final List<Integer> sum = ListExtensions.<Character, Integer>map(((List<Character>)Conversions.doWrapArray(Long.toString((IterableExtensions.<char[], Long>fold(ListExtensions.<String, char[]>map(new InputLoader(Integer.valueOf(2022), Integer.valueOf(25)).getInputs(), _function), Long.valueOf(0L), _function_1)).longValue(), 5).toCharArray())), _function_2);
    int _size = sum.size();
    ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, _size, true);
    Pair<String, Integer> _mappedTo = Pair.<String, Integer>of("", Integer.valueOf(0));
    final Function2<Pair<String, Integer>, Integer, Pair<String, Integer>> _function_3 = (Pair<String, Integer> acc, Integer v) -> {
      Pair<String, Integer> _xblockexpression = null;
      {
        int _size_1 = sum.size();
        int _minus = (_size_1 - 1);
        int _minus_1 = (_minus - (v).intValue());
        final Integer current = sum.get(_minus_1);
        Pair<String, Integer> _switchResult = null;
        Integer _value = acc.getValue();
        int _plus = ((current).intValue() + (_value).intValue());
        final int x = _plus;
        switch (x) {
          case 3:
            String _key = acc.getKey();
            String _plus_1 = ("=" + _key);
            _switchResult = Pair.<String, Integer>of(_plus_1, Integer.valueOf(1));
            break;
          case 4:
            String _key_1 = acc.getKey();
            String _plus_2 = ("-" + _key_1);
            _switchResult = Pair.<String, Integer>of(_plus_2, Integer.valueOf(1));
            break;
          case 5:
            String _key_2 = acc.getKey();
            String _plus_3 = ("0" + _key_2);
            _switchResult = Pair.<String, Integer>of(_plus_3, Integer.valueOf(1));
            break;
          default:
            String _key_3 = acc.getKey();
            String _plus_4 = (Integer.valueOf(x) + _key_3);
            _switchResult = Pair.<String, Integer>of(_plus_4, Integer.valueOf(0));
            break;
        }
        _xblockexpression = _switchResult;
      }
      return _xblockexpression;
    };
    final Pair<String, Integer> output = IterableExtensions.<Integer, Pair<String, Integer>>fold(_doubleDotLessThan, _mappedTo, _function_3);
    String _switchResult = null;
    Integer _value = output.getValue();
    if (_value != null) {
      switch (_value) {
        case 1:
          String _key = output.getKey();
          _switchResult = ("1" + _key);
          break;
        default:
          _switchResult = output.getKey();
          break;
      }
    } else {
      _switchResult = output.getKey();
    }
    InputOutput.<String>println(_switchResult);
  }
}
