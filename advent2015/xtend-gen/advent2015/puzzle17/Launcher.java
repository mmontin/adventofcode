package advent2015.puzzle17;

import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Launcher {
  private static int minNumber = 20;
  
  private static int iterations = 0;
  
  public static void main(final String[] args) {
    final Function1<String, Integer> _function = new Function1<String, Integer>() {
      public Integer apply(final String x) {
        return Integer.valueOf(Integer.parseInt(x));
      }
    };
    InputOutput.<Integer>println(Launcher.compute(ListExtensions.<Integer>reverse(IterableExtensions.<Integer>sort(ListExtensions.<String, Integer>map(new InputLoader(Integer.valueOf(2015), Integer.valueOf(17)).getInputs(), _function))), Integer.valueOf(150), Integer.valueOf(0)));
    InputOutput.<Integer>println(Integer.valueOf(Launcher.iterations));
  }
  
  public static Integer compute(final List<Integer> candidates, final Integer value, final Integer bucketsUsed) {
    int _xifexpression = (int) 0;
    if (((value).intValue() == 0)) {
      int _xblockexpression = (int) 0;
      {
        Launcher.update(bucketsUsed);
        _xblockexpression = 1;
      }
      _xifexpression = _xblockexpression;
    } else {
      int _xblockexpression_1 = (int) 0;
      {
        final ArrayList<Integer> candidatesDuplicate = new ArrayList<Integer>(candidates);
        final Predicate<Integer> _function = new Predicate<Integer>() {
          public boolean test(final Integer x) {
            return (x.compareTo(value) > 0);
          }
        };
        candidatesDuplicate.removeIf(_function);
        final Function2<Integer, Integer, Integer> _function_1 = new Function2<Integer, Integer, Integer>() {
          public Integer apply(final Integer v, final Integer x) {
            return Integer.valueOf(((v).intValue() + (x).intValue()));
          }
        };
        Integer _fold = IterableExtensions.<Integer, Integer>fold(candidatesDuplicate, Integer.valueOf(0), _function_1);
        final int difference = ((_fold).intValue() - (value).intValue());
        int _xifexpression_1 = (int) 0;
        if ((difference > 0)) {
          int _xblockexpression_2 = (int) 0;
          {
            final Integer first = candidatesDuplicate.get(0);
            candidatesDuplicate.remove(0);
            Integer _compute = Launcher.compute(candidatesDuplicate, Integer.valueOf(((value).intValue() - (first).intValue())), Integer.valueOf(((bucketsUsed).intValue() + 1)));
            Integer _compute_1 = Launcher.compute(candidatesDuplicate, value, bucketsUsed);
            _xblockexpression_2 = ((_compute).intValue() + (_compute_1).intValue());
          }
          _xifexpression_1 = _xblockexpression_2;
        } else {
          int _xifexpression_2 = (int) 0;
          if ((difference == 0)) {
            int _xblockexpression_3 = (int) 0;
            {
              int _size = candidates.size();
              int _plus = ((bucketsUsed).intValue() + _size);
              Launcher.update(Integer.valueOf(_plus));
              _xblockexpression_3 = 1;
            }
            _xifexpression_2 = _xblockexpression_3;
          } else {
            _xifexpression_2 = 0;
          }
          _xifexpression_1 = _xifexpression_2;
        }
        _xblockexpression_1 = _xifexpression_1;
      }
      _xifexpression = _xblockexpression_1;
    }
    return Integer.valueOf(_xifexpression);
  }
  
  public static int update(final Integer bucketsUsed) {
    int _xifexpression = (int) 0;
    if (((bucketsUsed).intValue() == Launcher.minNumber)) {
      _xifexpression = Launcher.iterations++;
    } else {
      int _xifexpression_1 = (int) 0;
      if (((bucketsUsed).intValue() < Launcher.minNumber)) {
        int _xblockexpression = (int) 0;
        {
          Launcher.minNumber = (bucketsUsed).intValue();
          _xblockexpression = Launcher.iterations = 1;
        }
        _xifexpression_1 = _xblockexpression;
      }
      _xifexpression = _xifexpression_1;
    }
    return _xifexpression;
  }
}
