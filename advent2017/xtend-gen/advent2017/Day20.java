package advent2017;

import adventutils.input.InputLoader;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Day20 {
  private static final List<String> input = new InputLoader(Integer.valueOf(2017), Integer.valueOf(20)).getInputs();

  public static void main(final String[] args) {
    final Function1<String, Integer> _function = new Function1<String, Integer>() {
      public Integer apply(final String it) {
        int _xblockexpression = (int) 0;
        {
          String last_part = it.split("a=<")[1];
          int _length = last_part.length();
          int _minus = (_length - 1);
          last_part = last_part.substring(0, _minus);
          final String[] splitty = last_part.split(",");
          final int a = Math.abs(Integer.parseInt(splitty[0]));
          final int b = Math.abs(Integer.parseInt(splitty[1]));
          final int c = Math.abs(Integer.parseInt(splitty[2]));
          _xblockexpression = ((a + b) + c);
        }
        return Integer.valueOf(_xblockexpression);
      }
    };
    final List<Integer> accs = ListExtensions.<String, Integer>map(Day20.input, _function);
    InputOutput.<Integer>println(Integer.valueOf(accs.lastIndexOf(IterableExtensions.<Integer>min(accs))));
  }
}
