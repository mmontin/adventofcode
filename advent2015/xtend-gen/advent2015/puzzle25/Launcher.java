package advent2015.puzzle25;

import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Launcher {
  public static void main(final String[] args) {
    int _intValue = Launcher.intValue(2978, 3083);
    final Function2<Long, Integer, Long> _function = new Function2<Long, Integer, Long>() {
      public Long apply(final Long v, final Integer e) {
        return Long.valueOf((((v).longValue() * 252533L) % 33554393L));
      }
    };
    InputOutput.<Long>println(IterableExtensions.<Integer, Long>fold(new ExclusiveRange(1, _intValue, true), Long.valueOf(20151125L), _function));
  }

  public static int intValue(final int row, final int column) {
    return ((((((column + row) - 1) * (column + row)) / 2) - row) + 1);
  }
}
