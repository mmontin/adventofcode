package advent2017;

import java.util.List;

import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

import adventutils.input.InputLoader;

@SuppressWarnings("all")
public class Day2 {
  public static void main(final String[] args) {
    final List<String> inputs = new InputLoader(Integer.valueOf(2017), Integer.valueOf(2)).getInputs();
    Pair<Integer, Integer> _mappedTo = Pair.<Integer, Integer>of(Integer.valueOf(0), Integer.valueOf(0));
    final Function2<Pair<Integer, Integer>, String, Pair<Integer, Integer>> _function = new Function2<Pair<Integer, Integer>, String, Pair<Integer, Integer>>() {
      public Pair<Integer, Integer> apply(final Pair<Integer, Integer> acc1, final String e1) {
        Pair<Integer, Integer> _xblockexpression = null;
        {
          final Function1<String, Integer> _function = new Function1<String, Integer>() {
            public Integer apply(final String it) {
              return Integer.valueOf(Integer.parseInt(it));
            }
          };
          final List<Integer> s = ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray(e1.split("\\s+"))), _function);
          Pair<Integer, Integer> _mappedTo = Pair.<Integer, Integer>of(Integer.valueOf(0), Integer.valueOf(Integer.MAX_VALUE));
          final Function2<Pair<Integer, Integer>, Integer, Pair<Integer, Integer>> _function_1 = new Function2<Pair<Integer, Integer>, Integer, Pair<Integer, Integer>>() {
            public Pair<Integer, Integer> apply(final Pair<Integer, Integer> acc2, final Integer e2) {
              Pair<Integer, Integer> _xblockexpression = null;
              {
                Integer new_max = acc2.getKey();
                Integer new_min = acc2.getValue();
                boolean _greaterThan = (e2.compareTo(new_max) > 0);
                if (_greaterThan) {
                  new_max = e2;
                }
                boolean _lessThan = (e2.compareTo(new_min) < 0);
                if (_lessThan) {
                  new_min = e2;
                }
                _xblockexpression = Pair.<Integer, Integer>of(new_max, new_min);
              }
              return _xblockexpression;
            }
          };
          final Pair<Integer, Integer> res1 = IterableExtensions.<Integer, Pair<Integer, Integer>>fold(s, _mappedTo, _function_1);
          Integer _key = acc1.getKey();
          Integer _key_1 = res1.getKey();
          int _plus = ((_key).intValue() + (_key_1).intValue());
          Integer _value = res1.getValue();
          int _minus = (_plus - (_value).intValue());
          Integer _value_1 = acc1.getValue();
          int _divisor = Day2.divisor(((Integer[])Conversions.unwrapArray(s, Integer.class)));
          int _plus_1 = ((_value_1).intValue() + _divisor);
          _xblockexpression = Pair.<Integer, Integer>of(Integer.valueOf(_minus), Integer.valueOf(_plus_1));
        }
        return _xblockexpression;
      }
    };
    InputOutput.<Pair<Integer, Integer>>print(IterableExtensions.<String, Pair<Integer, Integer>>fold(inputs, _mappedTo, _function));
  }

  public static int divisor(final Integer[] input) {
    int _xblockexpression = (int) 0;
    {
      int _size = ((List<Integer>)Conversions.doWrapArray(input)).size();
      ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, _size, true);
      for (final Integer i : _doubleDotLessThan) {
        int _size_1 = ((List<Integer>)Conversions.doWrapArray(input)).size();
        ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(((i).intValue() + 1), _size_1, true);
        for (final Integer j : _doubleDotLessThan_1) {
          {
            final Integer first = input[(i).intValue()];
            final Integer second = input[(j).intValue()];
            if (((((first).intValue() / (second).intValue()) * (second).intValue()) == (first).intValue())) {
              return ((first).intValue() / (second).intValue());
            }
            if (((((second).intValue() / (first).intValue()) * (first).intValue()) == (second).intValue())) {
              return ((second).intValue() / (first).intValue());
            }
          }
        }
      }
      _xblockexpression = 0;
    }
    return _xblockexpression;
  }
}
