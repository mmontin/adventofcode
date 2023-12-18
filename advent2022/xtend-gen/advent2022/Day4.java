package advent2022;

import java.util.List;

import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

import adventutils.geometry.Interval;
import adventutils.input.InputLoader;

@SuppressWarnings("all")
public class Day4 {
  public static void main(final String[] args) {
    final List<String> inputs = new InputLoader(Integer.valueOf(2022), Integer.valueOf(4)).getInputs();
    Pair<Integer, Integer> _mappedTo = Pair.<Integer, Integer>of(Integer.valueOf(0), Integer.valueOf(0));
    final Function2<Pair<Integer, Integer>, String, Pair<Integer, Integer>> _function = new Function2<Pair<Integer, Integer>, String, Pair<Integer, Integer>>() {
      public Pair<Integer, Integer> apply(final Pair<Integer, Integer> acc, final String e) {
        Pair<Integer, Integer> _xblockexpression = null;
        {
          final String[] s = e.split(",");
          String _get = s[0];
          final Interval i1 = new Interval(_get);
          String _get_1 = s[1];
          final Interval i2 = new Interval(_get_1);
          Pair<Integer, Integer> _xifexpression = null;
          if ((i1.includedIn(i2) || i2.includedIn(i1))) {
            Integer _key = acc.getKey();
            int _plus = ((_key).intValue() + 1);
            Integer _value = acc.getValue();
            int _plus_1 = ((_value).intValue() + 1);
            _xifexpression = Pair.<Integer, Integer>of(Integer.valueOf(_plus), Integer.valueOf(_plus_1));
          } else {
            Pair<Integer, Integer> _xifexpression_1 = null;
            boolean _overlapsWith = i1.overlapsWith(i2);
            if (_overlapsWith) {
              Integer _key_1 = acc.getKey();
              Integer _value_1 = acc.getValue();
              int _plus_2 = ((_value_1).intValue() + 1);
              _xifexpression_1 = Pair.<Integer, Integer>of(_key_1, Integer.valueOf(_plus_2));
            } else {
              _xifexpression_1 = acc;
            }
            _xifexpression = _xifexpression_1;
          }
          _xblockexpression = _xifexpression;
        }
        return _xblockexpression;
      }
    };
    InputOutput.<Pair<Integer, Integer>>print(IterableExtensions.<String, Pair<Integer, Integer>>fold(inputs, _mappedTo, _function));
  }
}
