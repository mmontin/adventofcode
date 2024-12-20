package advent2016.puzzle3;

import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Launcher {
  public static void main(final String[] args) {
    final Function1<String, List<Integer>> _function = (String it) -> {
      final Function1<String, Boolean> _function_1 = (String s) -> {
        boolean _isEmpty = s.isEmpty();
        return Boolean.valueOf((!_isEmpty));
      };
      final Function1<String, Integer> _function_2 = (String it_1) -> {
        return Integer.valueOf(Integer.parseInt(it_1));
      };
      return IterableExtensions.<Integer>toList(IterableExtensions.<String, Integer>map(IterableExtensions.<String>filter(((Iterable<String>)Conversions.doWrapArray(it.split(" "))), _function_1), _function_2));
    };
    List<List<Integer>> input = new InputLoader(Integer.valueOf(2016), Integer.valueOf(3)).<List<Integer>>getInputs(_function);
    final Function2<Integer, List<Integer>, Integer> _function_1 = (Integer nb, List<Integer> triangle) -> {
      Integer _xblockexpression = null;
      {
        Integer c1 = triangle.get(0);
        Integer c2 = triangle.get(1);
        Integer c3 = triangle.get(2);
        Integer _xifexpression = null;
        if ((((((c1).intValue() + (c2).intValue()) > (c3).intValue()) && (((c1).intValue() + (c3).intValue()) > (c2).intValue())) && (((c2).intValue() + (c3).intValue()) > (c1).intValue()))) {
          _xifexpression = Integer.valueOf(((nb).intValue() + 1));
        } else {
          _xifexpression = nb;
        }
        _xblockexpression = _xifexpression;
      }
      return _xblockexpression;
    };
    InputOutput.<Integer>println(IterableExtensions.<List<Integer>, Integer>fold(input, Integer.valueOf(0), _function_1));
    final ArrayList<List<Integer>> other_inputs = CollectionLiterals.<List<Integer>>newArrayList();
    IntegerRange _upTo = new IntegerRange(0, 2);
    for (final Integer j : _upTo) {
      int _size = input.size();
      ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, _size, true);
      for (final Integer i : _doubleDotLessThan) {
        {
          if ((((i).intValue() % 3) == 0)) {
            other_inputs.add(CollectionLiterals.<Integer>newArrayList());
          }
          other_inputs.getLast().add(input.get((i).intValue()).get((j).intValue()));
        }
      }
    }
    final Function2<Integer, List<Integer>, Integer> _function_2 = (Integer nb, List<Integer> triangle) -> {
      Integer _xblockexpression = null;
      {
        Integer c1 = triangle.get(0);
        Integer c2 = triangle.get(1);
        Integer c3 = triangle.get(2);
        Integer _xifexpression = null;
        if ((((((c1).intValue() + (c2).intValue()) > (c3).intValue()) && (((c1).intValue() + (c3).intValue()) > (c2).intValue())) && (((c2).intValue() + (c3).intValue()) > (c1).intValue()))) {
          _xifexpression = Integer.valueOf(((nb).intValue() + 1));
        } else {
          _xifexpression = nb;
        }
        _xblockexpression = _xifexpression;
      }
      return _xblockexpression;
    };
    InputOutput.<Integer>println(IterableExtensions.<List<Integer>, Integer>fold(other_inputs, Integer.valueOf(0), _function_2));
  }
}
