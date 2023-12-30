package advent2017;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;
import com.google.common.base.Objects;
import java.util.List;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Day11 {
  private static Coordinate current = new Coordinate();

  private static int further = 0;

  public static void main(final String[] args) {
    final Consumer<String> _function = new Consumer<String>() {
      public void accept(final String it) {
        Coordinate _switchResult = null;
        boolean _matched = false;
        if (Objects.equal(it, "n")) {
          _matched=true;
          _switchResult = Day11.current.addY(1);
        }
        if (!_matched) {
          if (Objects.equal(it, "nw")) {
            _matched=true;
            _switchResult = Day11.current.addY(1).addX((-1));
          }
        }
        if (!_matched) {
          if (Objects.equal(it, "sw")) {
            _matched=true;
            _switchResult = Day11.current.addX((-1));
          }
        }
        if (!_matched) {
          if (Objects.equal(it, "s")) {
            _matched=true;
            _switchResult = Day11.current.addY((-1));
          }
        }
        if (!_matched) {
          if (Objects.equal(it, "se")) {
            _matched=true;
            _switchResult = Day11.current.addY((-1)).addX(1);
          }
        }
        if (!_matched) {
          if (Objects.equal(it, "ne")) {
            _matched=true;
            _switchResult = Day11.current.addX(1);
          }
        }
        Day11.current = _switchResult;
        Day11.further = Math.max(Day11.further, Day11.steps(Day11.current));
      }
    };
    ((List<String>)Conversions.doWrapArray(IterableExtensions.<String>head(new InputLoader(Integer.valueOf(2017), Integer.valueOf(11)).getInputs()).split(","))).forEach(_function);
    InputOutput.<Integer>println(Integer.valueOf(Day11.steps(Day11.current)));
    InputOutput.<Integer>println(Integer.valueOf(Day11.further));
  }

  public static int steps(final Coordinate c) {
    int _xblockexpression = (int) 0;
    {
      final int val_x = Math.abs(c.getX());
      final int val_y = Math.abs(c.getY());
      int _min = Math.min(val_x, val_y);
      _xblockexpression = ((val_x + val_y) - _min);
    }
    return _xblockexpression;
  }
}
