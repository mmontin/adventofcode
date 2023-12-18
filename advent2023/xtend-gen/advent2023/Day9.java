package advent2023;

import adventutils.collection.ListUtils;
import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Day9 {
  public static void main(final String[] args) {
    final Function1<String, List<Integer>> _function = new Function1<String, List<Integer>>() {
      public List<Integer> apply(final String it) {
        final Function1<String, Integer> _function = new Function1<String, Integer>() {
          public Integer apply(final String it_1) {
            return Integer.valueOf(Integer.parseInt(it_1));
          }
        };
        return ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray(it.split(" "))), _function);
      }
    };
    final List<List<Integer>> inputs = ListExtensions.<String, List<Integer>>map(new InputLoader(Integer.valueOf(2023), Integer.valueOf(9)).getInputs(), _function);
    final Function2<Integer, List<Integer>, Integer> _function_1 = new Function2<Integer, List<Integer>, Integer>() {
      public Integer apply(final Integer acc, final List<Integer> el) {
        int _nextValue = Day9.getNextValue(el);
        return Integer.valueOf(((acc).intValue() + _nextValue));
      }
    };
    InputOutput.<Integer>println(IterableExtensions.<List<Integer>, Integer>fold(inputs, Integer.valueOf(0), _function_1));
    final Function2<Integer, List<Integer>, Integer> _function_2 = new Function2<Integer, List<Integer>, Integer>() {
      public Integer apply(final Integer acc, final List<Integer> el) {
        int _prevValue = Day9.getPrevValue(el);
        return Integer.valueOf(((acc).intValue() + _prevValue));
      }
    };
    InputOutput.<Integer>println(IterableExtensions.<List<Integer>, Integer>fold(inputs, Integer.valueOf(0), _function_2));
  }

  public static int getNextValue(final List<Integer> l) {
    int _xifexpression = (int) 0;
    int _size = l.size();
    boolean _equals = (_size == 0);
    if (_equals) {
      _xifexpression = 0;
    } else {
      int _nextValue = Day9.getNextValue(Day9.getSubList(l));
      Integer _last = IterableExtensions.<Integer>last(l);
      _xifexpression = (_nextValue + (_last).intValue());
    }
    return _xifexpression;
  }

  public static int getPrevValue(final List<Integer> l) {
    int _xifexpression = (int) 0;
    int _size = l.size();
    boolean _equals = (_size == 0);
    if (_equals) {
      _xifexpression = 0;
    } else {
      Integer _head = IterableExtensions.<Integer>head(l);
      int _prevValue = Day9.getPrevValue(Day9.getSubList(l));
      _xifexpression = ((_head).intValue() - _prevValue);
    }
    return _xifexpression;
  }

  public static List<Integer> getSubList(final List<Integer> l) {
    ArrayList<Integer> _xifexpression = null;
    int _size = l.size();
    boolean _greaterThan = (_size > 1);
    if (_greaterThan) {
      int _size_1 = l.size();
      int _minus = (_size_1 - 2);
      final Function2<ArrayList<Integer>, Integer, ArrayList<Integer>> _function = new Function2<ArrayList<Integer>, Integer, ArrayList<Integer>>() {
        public ArrayList<Integer> apply(final ArrayList<Integer> acc, final Integer el) {
          Integer _get = l.get(((el).intValue() + 1));
          Integer _get_1 = l.get((el).intValue());
          int _minus = ((_get).intValue() - (_get_1).intValue());
          return ListUtils.<Integer, ArrayList<Integer>>cons(Integer.valueOf(_minus), acc);
        }
      };
      _xifexpression = IterableExtensions.<Integer, ArrayList<Integer>>fold(new IntegerRange(0, _minus), CollectionLiterals.<Integer>newArrayList(), _function);
    } else {
      _xifexpression = CollectionLiterals.<Integer>newArrayList();
    }
    return _xifexpression;
  }
}
