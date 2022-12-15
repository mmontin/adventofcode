package advent2015.puzzle20;

import java.util.ArrayList;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Launcher {
  private static int INPUT = 36000000;

  public static void main(final String[] args) {
    int i = 0;
    int result = 0;
    while ((result < Launcher.INPUT)) {
      int _plusPlus = i++;
      final Function2<Integer, Integer, Integer> _function = new Function2<Integer, Integer, Integer>() {
        public Integer apply(final Integer v, final Integer e) {
          return Integer.valueOf(((v).intValue() + (11 * (e).intValue())));
        }
      };
      result = (IterableExtensions.<Integer, Integer>fold(Launcher.divisors(_plusPlus), Integer.valueOf(0), _function)).intValue();
    }
    InputOutput.<Integer>println(Integer.valueOf((i - 1)));
  }

  public static ArrayList<Integer> divisors(final int number) {
    ArrayList<Integer> _xblockexpression = null;
    {
      final ArrayList<Integer> output = new ArrayList<Integer>();
      int i = 1;
      while ((i < Math.sqrt(number))) {
        {
          if (((number % i) == 0)) {
            if ((number <= (50 * i))) {
              output.add(Integer.valueOf(i));
            }
            if ((number <= ((50 * number) / i))) {
              output.add(Integer.valueOf((number / i)));
            }
          }
          i++;
        }
      }
      _xblockexpression = output;
    }
    return _xblockexpression;
  }
}
