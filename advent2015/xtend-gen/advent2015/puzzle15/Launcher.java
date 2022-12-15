package advent2015.puzzle15;

import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;

@SuppressWarnings("all")
public class Launcher {
  public static void main(final String[] args) {
    int max = 0;
    IntegerRange _upTo = new IntegerRange(0, 100);
    for (final Integer x : _upTo) {
      IntegerRange _upTo_1 = new IntegerRange(0, (100 - (x).intValue()));
      for (final Integer y : _upTo_1) {
        IntegerRange _upTo_2 = new IntegerRange(0, ((100 - (x).intValue()) - (y).intValue()));
        for (final Integer z : _upTo_2) {
          max = Math.max(max, Launcher.valuation((x).intValue(), (y).intValue(), (z).intValue(), (((100 - (x).intValue()) - (y).intValue()) - (z).intValue())));
        }
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(max));
  }

  public static int valuation(final int x, final int y, final int z, final int t) {
    int _xifexpression = (int) 0;
    if ((((((2 * x) + (9 * y)) + z) + (8 * t)) == 500)) {
      int _max = Math.max((((3 * x) - (3 * y)) - z), 0);
      int _max_1 = Math.max((3 * y), 0);
      int _multiply = (_max * _max_1);
      int _max_2 = Math.max(((4 * z) - (2 * t)), 0);
      int _multiply_1 = (_multiply * _max_2);
      int _max_3 = Math.max((((-3) * x) + (2 * t)), 0);
      _xifexpression = (_multiply_1 * _max_3);
    } else {
      _xifexpression = 0;
    }
    return _xifexpression;
  }
}
