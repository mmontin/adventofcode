package advent2019;

import adventutils.input.InputLoader;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Day5 {
  public static void main(final String[] args) {
    final Function1<String, Integer> _function = (String it) -> {
      return Integer.valueOf(Integer.parseInt(it));
    };
    final List<Integer> opcodes = ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray(new InputLoader(Integer.valueOf(2019), Integer.valueOf(5)).getInputs().get(0).split(","))), _function);
    final int input = 1;
  }
}
