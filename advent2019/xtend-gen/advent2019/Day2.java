package advent2019;

import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Day2 {
  public static void main(final String[] args) {
    final Function1<String, Integer> _function = (String it) -> {
      return Integer.valueOf(Integer.parseInt(it));
    };
    final List<Integer> inputs = ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray(new InputLoader(Integer.valueOf(2019), Integer.valueOf(2)).getInputs().get(0).split(","))), _function);
    InputOutput.<Integer>println(Day2.process(Integer.valueOf(12), Integer.valueOf(2), inputs));
    int i = 0;
    int j = 0;
    int output = 0;
    while ((output != 19690720)) {
      {
        i++;
        if ((i == 99)) {
          i = 0;
          j++;
        }
        output = (Day2.process(Integer.valueOf(i), Integer.valueOf(j), inputs)).intValue();
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(((100 * i) + j)));
  }

  public static Integer process(final Integer noun, final Integer verb, final List<Integer> inputs) {
    Integer _xblockexpression = null;
    {
      final ArrayList<Integer> opcodes = new ArrayList<Integer>(inputs);
      opcodes.set(1, noun);
      opcodes.set(2, verb);
      int i = 0;
      while (((opcodes.get(i)).intValue() != 99)) {
        {
          final Integer left = opcodes.get((opcodes.get((i + 1))).intValue());
          final Integer right = opcodes.get((opcodes.get((i + 2))).intValue());
          int _xifexpression = (int) 0;
          Integer _get = opcodes.get(i);
          boolean _equals = ((_get).intValue() == 1);
          if (_equals) {
            _xifexpression = ((left).intValue() + (right).intValue());
          } else {
            _xifexpression = ((left).intValue() * (right).intValue());
          }
          final int newVal = _xifexpression;
          opcodes.set((opcodes.get((i + 3))).intValue(), Integer.valueOf(newVal));
          int _i = i;
          i = (_i + 4);
        }
      }
      _xblockexpression = opcodes.get(0);
    }
    return _xblockexpression;
  }
}
