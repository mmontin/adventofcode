package advent2022;

import java.util.ArrayList;
import java.util.List;

import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

import adventutils.input.InputLoader;

@SuppressWarnings("all")
public class Day1 {
  public static void main(final String[] args) {
    final List<String> input = new InputLoader(Integer.valueOf(2022), Integer.valueOf(1)).getInputs();
    Pair<Integer, Integer> _mappedTo = Pair.<Integer, Integer>of(Integer.valueOf(0), Integer.valueOf(0));
    final Function2<Pair<Integer, Integer>, String, Pair<Integer, Integer>> _function = new Function2<Pair<Integer, Integer>, String, Pair<Integer, Integer>>() {
      public Pair<Integer, Integer> apply(final Pair<Integer, Integer> acc, final String s) {
        Pair<Integer, Integer> _xifexpression = null;
        boolean _isEmpty = s.isEmpty();
        if (_isEmpty) {
          int _max = Math.max((acc.getKey()).intValue(), (acc.getValue()).intValue());
          _xifexpression = Pair.<Integer, Integer>of(Integer.valueOf(0), Integer.valueOf(_max));
        } else {
          Integer _key = acc.getKey();
          int _parseInt = Integer.parseInt(s);
          int _plus = ((_key).intValue() + _parseInt);
          Integer _value = acc.getValue();
          _xifexpression = Pair.<Integer, Integer>of(Integer.valueOf(_plus), _value);
        }
        return _xifexpression;
      }
    };
    InputOutput.<Integer>println(IterableExtensions.<String, Pair<Integer, Integer>>fold(input, _mappedTo, _function).getValue());
    ArrayList<Integer> _newArrayList = CollectionLiterals.<Integer>newArrayList();
    Pair<Integer, ArrayList<Integer>> _mappedTo_1 = Pair.<Integer, ArrayList<Integer>>of(Integer.valueOf(0), _newArrayList);
    final Function2<Pair<Integer, ArrayList<Integer>>, String, Pair<Integer, ArrayList<Integer>>> _function_1 = new Function2<Pair<Integer, ArrayList<Integer>>, String, Pair<Integer, ArrayList<Integer>>>() {
      public Pair<Integer, ArrayList<Integer>> apply(final Pair<Integer, ArrayList<Integer>> acc, final String s) {
        Pair<Integer, ArrayList<Integer>> _xifexpression = null;
        boolean _isEmpty = s.isEmpty();
        if (_isEmpty) {
          Pair<Integer, ArrayList<Integer>> _xblockexpression = null;
          {
            final ArrayList<Integer> nlist = acc.getValue();
            nlist.add(acc.getKey());
            _xblockexpression = Pair.<Integer, ArrayList<Integer>>of(Integer.valueOf(0), nlist);
          }
          _xifexpression = _xblockexpression;
        } else {
          Integer _key = acc.getKey();
          int _parseInt = Integer.parseInt(s);
          int _plus = ((_key).intValue() + _parseInt);
          ArrayList<Integer> _value = acc.getValue();
          _xifexpression = Pair.<Integer, ArrayList<Integer>>of(Integer.valueOf(_plus), _value);
        }
        return _xifexpression;
      }
    };
    final Function2<Integer, Integer, Integer> _function_2 = new Function2<Integer, Integer, Integer>() {
      public Integer apply(final Integer x, final Integer y) {
        return Integer.valueOf(((x).intValue() + (y).intValue()));
      }
    };
    InputOutput.<Integer>println(IterableExtensions.<Integer>reduce(ListExtensions.<Integer>reverse(IterableExtensions.<Integer>sort(IterableExtensions.<String, Pair<Integer, ArrayList<Integer>>>fold(input, _mappedTo_1, _function_1).getValue())).subList(0, 3), _function_2));
  }
}
