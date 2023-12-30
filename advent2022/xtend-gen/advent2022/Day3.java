package advent2022;

import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.ArrayExtensions;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day3 {
  public static void main(final String[] args) {
    final List<String> inputs = new InputLoader(Integer.valueOf(2022), Integer.valueOf(3)).getInputs();
    final Function2<Integer, String, Integer> _function = new Function2<Integer, String, Integer>() {
      public Integer apply(final Integer acc, final String e) {
        int _xblockexpression = (int) 0;
        {
          int _length = e.length();
          int _divide = (_length / 2);
          final char[] part1 = e.substring(0, _divide).toCharArray();
          int _length_1 = e.length();
          int _divide_1 = (_length_1 / 2);
          final char[] part2 = e.substring(_divide_1).toCharArray();
          final Function1<Character, Boolean> _function = new Function1<Character, Boolean>() {
            public Boolean apply(final Character it) {
              return Boolean.valueOf(ArrayExtensions.contains(part2, (it).charValue()));
            }
          };
          int _value = Day3.toValue((IterableExtensions.<Character>head(IterableExtensions.<Character>filter(((Iterable<Character>)Conversions.doWrapArray(part1)), _function))).charValue());
          _xblockexpression = ((acc).intValue() + _value);
        }
        return Integer.valueOf(_xblockexpression);
      }
    };
    InputOutput.<Integer>println(IterableExtensions.<String, Integer>fold(inputs, Integer.valueOf(0), _function));
    ArrayList<char[]> _newArrayList = CollectionLiterals.<char[]>newArrayList();
    Pair<ArrayList<char[]>, Integer> _mappedTo = Pair.<ArrayList<char[]>, Integer>of(_newArrayList, Integer.valueOf(0));
    final Function2<Pair<ArrayList<char[]>, Integer>, String, Pair<ArrayList<char[]>, Integer>> _function_1 = new Function2<Pair<ArrayList<char[]>, Integer>, String, Pair<ArrayList<char[]>, Integer>>() {
      public Pair<ArrayList<char[]>, Integer> apply(final Pair<ArrayList<char[]>, Integer> acc, final String e) {
        Pair<ArrayList<char[]>, Integer> _xblockexpression = null;
        {
          acc.getKey().add(e.toCharArray());
          Pair<ArrayList<char[]>, Integer> _xifexpression = null;
          int _size = acc.getKey().size();
          boolean _equals = (_size == 3);
          if (_equals) {
            Pair<ArrayList<char[]>, Integer> _xblockexpression_1 = null;
            {
              final Function1<Character, Boolean> _function = new Function1<Character, Boolean>() {
                public Boolean apply(final Character it) {
                  return Boolean.valueOf(ArrayExtensions.contains(acc.getKey().get(1), (it).charValue()));
                }
              };
              final Function1<Character, Boolean> _function_1 = new Function1<Character, Boolean>() {
                public Boolean apply(final Character it) {
                  return Boolean.valueOf(ArrayExtensions.contains(acc.getKey().get(2), (it).charValue()));
                }
              };
              final Character id = IterableExtensions.<Character>head(IterableExtensions.<Character>filter(IterableExtensions.<Character>filter(((Iterable<Character>)Conversions.doWrapArray(acc.getKey().get(0))), _function), _function_1));
              ArrayList<char[]> _newArrayList = CollectionLiterals.<char[]>newArrayList();
              Integer _value = acc.getValue();
              int _value_1 = Day3.toValue((id).charValue());
              int _plus = ((_value).intValue() + _value_1);
              _xblockexpression_1 = Pair.<ArrayList<char[]>, Integer>of(_newArrayList, Integer.valueOf(_plus));
            }
            _xifexpression = _xblockexpression_1;
          } else {
            _xifexpression = acc;
          }
          _xblockexpression = _xifexpression;
        }
        return _xblockexpression;
      }
    };
    InputOutput.<Integer>println(IterableExtensions.<String, Pair<ArrayList<char[]>, Integer>>fold(inputs, _mappedTo, _function_1).getValue());
  }

  public static int toValue(final char c) {
    int _xblockexpression = (int) 0;
    {
      int output = (((int) c) - 96);
      int _xifexpression = (int) 0;
      if ((output < 0)) {
        _xifexpression = (output + 58);
      } else {
        _xifexpression = output;
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }
}
