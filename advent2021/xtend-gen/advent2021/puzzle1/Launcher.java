package advent2021.puzzle1;

import advent2021.Utils;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;

@SuppressWarnings("all")
public class Launcher {
  public static void main(final String[] args) {
    final Function1<String, Integer> _function = new Function1<String, Integer>() {
      public Integer apply(final String x) {
        return Integer.valueOf(Integer.parseInt(x));
      }
    };
    final List<Integer> input = Utils.<Integer>getInputs(1, _function);
    ArrayList<Integer> _arrayList = new ArrayList<Integer>(input);
    InputOutput.<Integer>println(Integer.valueOf(Launcher.greater(_arrayList)));
    int _size = input.size();
    int _minus = (_size - 2);
    final ArrayList<Integer> newList = new ArrayList<Integer>(_minus);
    int _size_1 = input.size();
    int _minus_1 = (_size_1 - 2);
    ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, _minus_1, true);
    for (final Integer i : _doubleDotLessThan) {
      Integer _get = input.get((i).intValue());
      Integer _get_1 = input.get(((i).intValue() + 1));
      int _plus = ((_get).intValue() + (_get_1).intValue());
      Integer _get_2 = input.get(((i).intValue() + 2));
      int _plus_1 = (_plus + (_get_2).intValue());
      newList.add(Integer.valueOf(_plus_1));
    }
    InputOutput.<Integer>println(Integer.valueOf(Launcher.greater(newList)));
  }
  
  private static int greater(final List<Integer> input) {
    int _xblockexpression = (int) 0;
    {
      Integer previous = input.remove(0);
      int result = 0;
      for (final Integer n : input) {
        {
          int _result = result;
          int _xifexpression = (int) 0;
          boolean _greaterThan = (n.compareTo(previous) > 0);
          if (_greaterThan) {
            _xifexpression = 1;
          } else {
            _xifexpression = 0;
          }
          result = (_result + _xifexpression);
          previous = n;
        }
      }
      _xblockexpression = result;
    }
    return _xblockexpression;
  }
}
