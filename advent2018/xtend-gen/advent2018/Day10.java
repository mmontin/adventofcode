package advent2018;

import adventutils.geometry.Coordinate;
import adventutils.geometry.CoordinateSet;
import adventutils.geometry.Interval;
import adventutils.input.InputLoader;
import java.util.List;
import java.util.Objects;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day10 {
  private static final List<Pair<Coordinate, Coordinate>> initial_conditions = new InputLoader(Integer.valueOf(2018), Integer.valueOf(10)).<Pair<Coordinate, Coordinate>>getInputs(((Function1<String, Pair<Coordinate, Coordinate>>) (String it) -> {
    String _substring = it.substring(10, 24);
    Coordinate _coordinate = new Coordinate(_substring);
    String _substring_1 = it.substring(36, 42);
    Coordinate _coordinate_1 = new Coordinate(_substring_1);
    return Pair.<Coordinate, Coordinate>of(_coordinate, _coordinate_1);
  }));

  public static void main(final String[] args) {
    final Pair<Coordinate, Coordinate> first = Day10.initial_conditions.get(0);
    Interval current = new Interval(0, Long.MAX_VALUE);
    int i = 1;
    while ((!current.isUnity())) {
      {
        Interval next = Day10.getTimeInterval(first, Day10.initial_conditions.get(i));
        long _max = Math.max(current.leftBound, next.leftBound);
        long _min = Math.min(current.rightBound, next.rightBound);
        Interval _interval = new Interval(_max, _min);
        current = _interval;
      }
    }
    final int right_time = ((int) current.leftBound);
    CoordinateSet _coordinateSet = new CoordinateSet();
    final Function2<CoordinateSet, Pair<Coordinate, Coordinate>, CoordinateSet> _function = (CoordinateSet acc, Pair<Coordinate, Coordinate> v) -> {
      CoordinateSet _xblockexpression = null;
      {
        int _y = v.getKey().getY();
        int _y_1 = v.getValue().getY();
        int _multiply = (right_time * _y_1);
        int _plus = (_y + _multiply);
        int _x = v.getKey().getX();
        int _x_1 = v.getValue().getX();
        int _multiply_1 = (right_time * _x_1);
        int _plus_1 = (_x + _multiply_1);
        Coordinate _coordinate = new Coordinate(_plus, _plus_1);
        acc.add(_coordinate);
        _xblockexpression = acc;
      }
      return _xblockexpression;
    };
    InputOutput.<CoordinateSet>println(IterableExtensions.<Pair<Coordinate, Coordinate>, CoordinateSet>fold(Day10.initial_conditions, _coordinateSet, _function));
    InputOutput.<Integer>println(Integer.valueOf(right_time));
  }

  public static Interval getTimeInterval(final Pair<Coordinate, Coordinate> c1, final Pair<Coordinate, Coordinate> c2) {
    return Day10.getTimeInterval(c1.getKey().getY(), c2.getKey().getY(), c1.getValue().getY(), c2.getValue().getY());
  }

  public static Interval getTimeInterval(final int xA, final int xB, final int vA, final int vB) {
    Interval _switchResult = null;
    final int x = (vB - vA);
    boolean _matched = false;
    if (Objects.equals(x, 0)) {
      _matched=true;
      _switchResult = new Interval(0, Long.MAX_VALUE);
    }
    if (!_matched) {
      if ((x > 0)) {
        _matched=true;
        _switchResult = new Interval((((((-7) + xA) - xB) / x) + 1), (((7 + xA) - xB) / x));
      }
    }
    if (!_matched) {
      _switchResult = new Interval((((((-7) + xB) - xA) / (-x)) + 1), (((7 + xB) - xA) / (-x)));
    }
    return _switchResult;
  }
}
