package adventutils.maths;

import java.util.ArrayList;
import java.util.Objects;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class GaussianElim {
  public static ArrayList<Rational> solve(final ArrayList<ArrayList<Rational>> coeffs, final ArrayList<Rational> b) {
    ArrayList<Rational> _xblockexpression = null;
    {
      final int n = ((Object[])Conversions.unwrapArray(b, Object.class)).length;
      ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, n, true);
      for (final Integer p : _doubleDotLessThan) {
        {
          final Function1<Integer, Rational> _function = (Integer it) -> {
            return coeffs.get((it).intValue()).get((p).intValue()).abs();
          };
          Integer max = IterableExtensions.<Integer, Rational>maxBy(new ExclusiveRange((p).intValue(), n, true), _function);
          final ArrayList<Rational> temp = coeffs.get((p).intValue());
          coeffs.set((p).intValue(), coeffs.get((max).intValue()));
          coeffs.set((max).intValue(), temp);
          final Rational t = b.get((p).intValue());
          b.set((p).intValue(), b.get((max).intValue()));
          b.set((max).intValue(), t);
          final ArrayList<Rational> p_line = coeffs.get((p).intValue());
          final Rational pivot = p_line.get((p).intValue());
          final Rational res = b.get((p).intValue());
          boolean _equals = Objects.equals(pivot, Rational.ZERO);
          if (_equals) {
            throw new NumberFormatException();
          }
          ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(((p).intValue() + 1), n, true);
          for (final Integer i : _doubleDotLessThan_1) {
            {
              final ArrayList<Rational> line = coeffs.get((i).intValue());
              Rational _get = line.get((p).intValue());
              final Rational alpha = _get.operator_divide(pivot);
              Rational _get_1 = b.get((i).intValue());
              Rational _multiply = alpha.operator_multiply(res);
              Rational _minus = _get_1.operator_minus(_multiply);
              b.set((i).intValue(), _minus);
              ExclusiveRange _doubleDotLessThan_2 = new ExclusiveRange((p).intValue(), n, true);
              for (final Integer j : _doubleDotLessThan_2) {
                Rational _get_2 = line.get((j).intValue());
                Rational _get_3 = p_line.get((j).intValue());
                Rational _multiply_1 = alpha.operator_multiply(_get_3);
                Rational _minus_1 = _get_2.operator_minus(_multiply_1);
                line.set((j).intValue(), _minus_1);
              }
            }
          }
        }
      }
      final ArrayList<Rational> x = CollectionLiterals.<Rational>newArrayList();
      final Consumer<Integer> _function = (Integer it) -> {
        x.add(Rational.ZERO);
      };
      new ExclusiveRange(0, n, true).forEach(_function);
      IntegerRange _upTo = new IntegerRange((n - 1), 0);
      for (final Integer i : _upTo) {
        {
          final ArrayList<Rational> i_line = coeffs.get((i).intValue());
          final Function2<Rational, Integer, Rational> _function_1 = (Rational acc, Integer j) -> {
            Rational _get = i_line.get((j).intValue());
            Rational _get_1 = x.get((j).intValue());
            Rational _multiply = _get.operator_multiply(_get_1);
            return acc.operator_plus(_multiply);
          };
          Rational sum = IterableExtensions.<Integer, Rational>fold(new ExclusiveRange(((i).intValue() + 1), n, true), Rational.ZERO, _function_1);
          Rational _get = b.get((i).intValue());
          Rational _minus = _get.operator_minus(sum);
          Rational _get_1 = i_line.get((i).intValue());
          Rational _divide = _minus.operator_divide(_get_1);
          x.set((i).intValue(), _divide);
        }
      }
      _xblockexpression = x;
    }
    return _xblockexpression;
  }
}
