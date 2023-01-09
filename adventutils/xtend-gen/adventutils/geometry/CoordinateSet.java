package adventutils.geometry;

import java.util.HashSet;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class CoordinateSet extends HashSet<Coordinate> {
  public CoordinateSet() {
    super();
  }

  public String toString() {
    String _xifexpression = null;
    boolean _isEmpty = this.isEmpty();
    if (_isEmpty) {
      _xifexpression = InputOutput.<String>println("This set is empty");
    } else {
      String _xblockexpression = null;
      {
        final Function1<Coordinate, Integer> _function = new Function1<Coordinate, Integer>() {
          public Integer apply(final Coordinate it) {
            return Integer.valueOf(it.getX());
          }
        };
        final int minX = IterableExtensions.<Coordinate, Integer>minBy(this, _function).getX();
        final Function1<Coordinate, Integer> _function_1 = new Function1<Coordinate, Integer>() {
          public Integer apply(final Coordinate it) {
            return Integer.valueOf(it.getX());
          }
        };
        final int maxX = IterableExtensions.<Coordinate, Integer>maxBy(this, _function_1).getX();
        final Function1<Coordinate, Integer> _function_2 = new Function1<Coordinate, Integer>() {
          public Integer apply(final Coordinate it) {
            return Integer.valueOf(it.getY());
          }
        };
        final int minY = IterableExtensions.<Coordinate, Integer>minBy(this, _function_2).getY();
        final Function1<Coordinate, Integer> _function_3 = new Function1<Coordinate, Integer>() {
          public Integer apply(final Coordinate it) {
            return Integer.valueOf(it.getY());
          }
        };
        final int maxY = IterableExtensions.<Coordinate, Integer>maxBy(this, _function_3).getY();
        String output = "";
        IntegerRange _upTo = new IntegerRange(minX, maxX);
        for (final Integer i : _upTo) {
          {
            IntegerRange _upTo_1 = new IntegerRange(minY, maxY);
            for (final Integer j : _upTo_1) {
              String _output = output;
              String _xifexpression_1 = null;
              Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
              boolean _contains = this.contains(_coordinate);
              if (_contains) {
                _xifexpression_1 = "#";
              } else {
                _xifexpression_1 = ".";
              }
              output = (_output + _xifexpression_1);
            }
            String _output_1 = output;
            output = (_output_1 + "\n");
          }
        }
        _xblockexpression = output;
      }
      _xifexpression = _xblockexpression;
    }
    return _xifexpression;
  }
}
