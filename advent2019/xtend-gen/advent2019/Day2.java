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
      final Intcode decoder = new Intcode(opcodes);
      decoder.run();
      _xblockexpression = decoder.result();
    }
    return _xblockexpression;
  }
}
