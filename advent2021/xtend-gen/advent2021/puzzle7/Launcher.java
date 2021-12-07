package advent2021.puzzle7;

import advent2021.Utils;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Launcher {
  public static void main(final String[] args) {
    final Function1<String, Integer> _function = new Function1<String, Integer>() {
      public Integer apply(final String x) {
        return Integer.valueOf(Integer.parseInt(x));
      }
    };
    final List<Integer> input = IterableExtensions.<Integer>sort(ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray(Utils.getInputs(7).get(0).split(","))), _function));
    Integer _get = input.get(0);
    int _size = input.size();
    int _minus = (_size - 1);
    Integer _get_1 = input.get(_minus);
    final Function2<Integer, Integer, Integer> _function_1 = new Function2<Integer, Integer, Integer>() {
      public Integer apply(final Integer min, final Integer k) {
        final Function2<Integer, Integer, Integer> _function = new Function2<Integer, Integer, Integer>() {
          public Integer apply(final Integer v, final Integer e) {
            int _abs = Math.abs(((e).intValue() - (k).intValue()));
            return Integer.valueOf(((v).intValue() + _abs));
          }
        };
        return Integer.valueOf(Math.min((min).intValue(), (IterableExtensions.<Integer, Integer>fold(input, Integer.valueOf(0), _function)).intValue()));
      }
    };
    InputOutput.<Integer>println(IterableExtensions.<Integer, Integer>fold(new IntegerRange((_get).intValue(), (_get_1).intValue()), Integer.valueOf(Integer.MAX_VALUE), _function_1));
    Integer _get_2 = input.get(0);
    int _size_1 = input.size();
    int _minus_1 = (_size_1 - 1);
    Integer _get_3 = input.get(_minus_1);
    final Function2<Integer, Integer, Integer> _function_2 = new Function2<Integer, Integer, Integer>() {
      public Integer apply(final Integer min, final Integer k) {
        final Function2<Integer, Integer, Integer> _function = new Function2<Integer, Integer, Integer>() {
          public Integer apply(final Integer v, final Integer e) {
            int _xblockexpression = (int) 0;
            {
              int n = Math.abs(((e).intValue() - (k).intValue()));
              _xblockexpression = ((v).intValue() + ((n * (n + 1)) / 2));
            }
            return Integer.valueOf(_xblockexpression);
          }
        };
        return Integer.valueOf(Math.min((min).intValue(), (IterableExtensions.<Integer, Integer>fold(input, Integer.valueOf(0), _function)).intValue()));
      }
    };
    InputOutput.<Integer>println(IterableExtensions.<Integer, Integer>fold(new IntegerRange((_get_2).intValue(), (_get_3).intValue()), Integer.valueOf(Integer.MAX_VALUE), _function_2));
  }
}
