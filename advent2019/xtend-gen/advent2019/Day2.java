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
    final ArrayList<Integer> inputs_1 = new ArrayList<Integer>(inputs);
    inputs_1.set(1, Integer.valueOf(12));
    inputs_1.set(2, Integer.valueOf(2));
    final Intcode decoder = new Intcode(inputs_1);
    decoder.process();
    InputOutput.<Integer>println(decoder.result());
  }
}
