package advent2017;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;
import com.google.common.base.Objects;
import java.util.HashSet;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Day11 {
  public static void main(final String[] args) {
    final String[] input = IterableExtensions.<String>head(new InputLoader(Integer.valueOf(2017), Integer.valueOf(11)).getInputs()).split(",");
    final Coordinate starting_spot = new Coordinate();
    Coordinate current = starting_spot;
    final HashSet<Coordinate> positions = CollectionLiterals.<Coordinate>newHashSet(current);
    for (final String i : input) {
      {
        Coordinate _switchResult = null;
        boolean _matched = false;
        if (Objects.equal(i, "n")) {
          _matched=true;
          _switchResult = current.addY(1);
        }
        if (!_matched) {
          if (Objects.equal(i, "nw")) {
            _matched=true;
            _switchResult = current.addY(1).addX((-1));
          }
        }
        if (!_matched) {
          if (Objects.equal(i, "sw")) {
            _matched=true;
            _switchResult = current.addX((-1));
          }
        }
        if (!_matched) {
          if (Objects.equal(i, "s")) {
            _matched=true;
            _switchResult = current.addY((-1));
          }
        }
        if (!_matched) {
          if (Objects.equal(i, "se")) {
            _matched=true;
            _switchResult = current.addY((-1)).addX(1);
          }
        }
        if (!_matched) {
          if (Objects.equal(i, "ne")) {
            _matched=true;
            _switchResult = current.addX(1);
          }
        }
        current = _switchResult;
        positions.add(current);
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(Day11.steps(current)));
    final Function1<Coordinate, Integer> _function = new Function1<Coordinate, Integer>() {
      public Integer apply(final Coordinate it) {
        return Integer.valueOf(Day11.steps(it));
      }
    };
    InputOutput.<Integer>println(Integer.valueOf(Day11.steps(IterableExtensions.<Coordinate, Integer>maxBy(positions, _function))));
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
