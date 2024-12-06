package advent2024;

import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.HashSet;
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
public class Day2 {
  public static void main(final String[] args) {
    final Function1<String, List<Integer>> _function = (String it) -> {
      final Function1<String, Integer> _function_1 = (String n) -> {
        return Integer.valueOf(Integer.parseInt((n + "")));
      };
      return ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray(it.split(" "))), _function_1);
    };
    final List<List<Integer>> reports = ListExtensions.<String, List<Integer>>map(new InputLoader(Integer.valueOf(2024), Integer.valueOf(2)).getInputs(), _function);
    final Function2<Integer, List<Integer>, Integer> _function_1 = (Integer acc, List<Integer> el) -> {
      Integer _xifexpression = null;
      boolean _isSafe = Day2.isSafe(el);
      if (_isSafe) {
        _xifexpression = Integer.valueOf(((acc).intValue() + 1));
      } else {
        _xifexpression = acc;
      }
      return _xifexpression;
    };
    InputOutput.<Integer>println(IterableExtensions.<List<Integer>, Integer>fold(reports, Integer.valueOf(0), _function_1));
    final Function2<Integer, List<Integer>, Integer> _function_2 = (Integer acc, List<Integer> el) -> {
      int _xifexpression = (int) 0;
      boolean _isSafe = Day2.isSafe(el);
      if (_isSafe) {
        _xifexpression = ((acc).intValue() + 1);
      } else {
        int _xblockexpression = (int) 0;
        {
          final ArrayList<Integer> currentList = new ArrayList<Integer>(el);
          boolean foundSafe = false;
          int i = 0;
          while (((i != currentList.size()) && (!foundSafe))) {
            {
              final Integer element = currentList.remove(i);
              foundSafe = Day2.isSafe(currentList);
              currentList.add(i, element);
              i++;
            }
          }
          int _xifexpression_1 = (int) 0;
          if (foundSafe) {
            _xifexpression_1 = 1;
          } else {
            _xifexpression_1 = 0;
          }
          _xblockexpression = ((acc).intValue() + _xifexpression_1);
        }
        _xifexpression = _xblockexpression;
      }
      return Integer.valueOf(_xifexpression);
    };
    InputOutput.<Integer>println(IterableExtensions.<List<Integer>, Integer>fold(reports, Integer.valueOf(0), _function_2));
  }

  public static boolean isSafe(final List<Integer> report) {
    boolean _xblockexpression = false;
    {
      final ArrayList<Integer> differences = CollectionLiterals.<Integer>newArrayList();
      final HashSet<Float> signs = CollectionLiterals.<Float>newHashSet();
      int _size = report.size();
      int _minus = (_size - 2);
      IntegerRange _upTo = new IntegerRange(0, _minus);
      for (final Integer i : _upTo) {
        {
          Integer _get = report.get(((i).intValue() + 1));
          Integer _get_1 = report.get((i).intValue());
          final int current_diff = ((_get).intValue() - (_get_1).intValue());
          differences.add(Integer.valueOf(Math.abs(current_diff)));
          signs.add(Float.valueOf(Math.signum(current_diff)));
        }
      }
      _xblockexpression = (!(IterableExtensions.<Integer>exists(differences, ((Function1<Integer, Boolean>) (Integer d) -> {
        return Boolean.valueOf((((d).intValue() > 3) || ((d).intValue() == 0)));
      })) || (signs.size() != 1)));
    }
    return _xblockexpression;
  }
}
