package advent2017;

import java.util.List;

import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

import adventutils.input.InputLoader;

@SuppressWarnings("all")
public class Day1 {
  public static void main(final String[] args) {
    final char[] inputs = new InputLoader(Integer.valueOf(2017), Integer.valueOf(1)).getInputs().get(0).toCharArray();
    final int input_size = ((List<Character>)Conversions.doWrapArray(inputs)).size();
    final int half_size = (input_size / 2);
    Pair<Integer, Integer> _mappedTo = Pair.<Integer, Integer>of(Integer.valueOf(0), Integer.valueOf(0));
    final Function2<Pair<Integer, Integer>, Integer, Pair<Integer, Integer>> _function = new Function2<Pair<Integer, Integer>, Integer, Pair<Integer, Integer>>() {
      public Pair<Integer, Integer> apply(final Pair<Integer, Integer> acc, final Integer e) {
        Pair<Integer, Integer> _xblockexpression = null;
        {
          final char current = inputs[(e).intValue()];
          final char next = inputs[(((e).intValue() + 1) % input_size)];
          final char other = inputs[(((e).intValue() + half_size) % input_size)];
          Integer new_left = acc.getKey();
          boolean _equals = Character.valueOf(current).equals(Character.valueOf(next));
          if (_equals) {
            int _numericValue = Character.getNumericValue(current);
            int _plus = ((new_left).intValue() + _numericValue);
            new_left = Integer.valueOf(_plus);
          }
          Integer new_right = acc.getValue();
          boolean _equals_1 = Character.valueOf(current).equals(Character.valueOf(other));
          if (_equals_1) {
            int _numericValue_1 = Character.getNumericValue(current);
            int _plus_1 = ((new_right).intValue() + _numericValue_1);
            new_right = Integer.valueOf(_plus_1);
          }
          _xblockexpression = Pair.<Integer, Integer>of(new_left, new_right);
        }
        return _xblockexpression;
      }
    };
    Pair<Integer, Integer> sum = IterableExtensions.<Integer, Pair<Integer, Integer>>fold(new ExclusiveRange(0, input_size, true), _mappedTo, _function);
    InputOutput.<Pair<Integer, Integer>>println(sum);
  }
}
