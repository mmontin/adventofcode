package advent2022;

import adventutils.geometry.Coordinate;
import adventutils.geometry.Interval;
import adventutils.geometry.Intervals;
import adventutils.input.InputLoader;
import java.math.BigInteger;
import java.util.Map;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Day15 {
  private static final Map<Coordinate, Integer> sensors = CollectionLiterals.<Coordinate, Integer>newHashMap();

  private static final Set<Coordinate> beacons = CollectionLiterals.<Coordinate>newHashSet();

  public static void main(final String[] args) {
    final Consumer<String> _function = new Consumer<String>() {
      public void accept(final String it) {
        final String[] split = (it + ",").split(" ");
        int _fromString = Day15.fromString(split[2]);
        int _fromString_1 = Day15.fromString(split[3]);
        final Coordinate sensor = new Coordinate(_fromString, _fromString_1);
        int _fromString_2 = Day15.fromString(split[8]);
        int _fromString_3 = Day15.fromString(split[9]);
        final Coordinate beacon = new Coordinate(_fromString_2, _fromString_3);
        Day15.sensors.put(sensor, Integer.valueOf(sensor.manhattanDistanceTo(beacon)));
        Day15.beacons.add(beacon);
      }
    };
    new InputLoader(Integer.valueOf(2022), Integer.valueOf(15)).getInputs().forEach(_function);
    Intervals itvs = Day15.findHole(2000000);
    InputOutput.<Long>println(Long.valueOf(itvs.content.get(0).length()));
    int j = 0;
    while ((itvs.content.size() < 2)) {
      int _plusPlus = j++;
      itvs = Day15.findHole(_plusPlus);
    }
    final long i = (itvs.content.get(0).rightBound + 1);
    InputOutput.<BigInteger>println(BigInteger.valueOf(i).multiply(BigInteger.valueOf(4000000)).add(BigInteger.valueOf((j - 1))));
  }

  public static Intervals findHole(final int y) {
    Intervals _xblockexpression = null;
    {
      final Intervals intervals = new Intervals();
      final Consumer<Map.Entry<Coordinate, Integer>> _function = new Consumer<Map.Entry<Coordinate, Integer>>() {
        public void accept(final Map.Entry<Coordinate, Integer> it) {
          int _y = it.getKey().getY();
          int _minus = (_y - y);
          int distance_to_line = Math.abs(_minus);
          Integer _value = it.getValue();
          final int remaining = ((_value).intValue() - distance_to_line);
          if ((remaining >= 0)) {
            int _x = it.getKey().getX();
            int _minus_1 = (_x - remaining);
            int _x_1 = it.getKey().getX();
            int _plus = (_x_1 + remaining);
            Interval _interval = new Interval(_minus_1, _plus);
            intervals.addInterval(_interval);
          }
        }
      };
      Day15.sensors.entrySet().forEach(_function);
      final Function1<Coordinate, Boolean> _function_1 = new Function1<Coordinate, Boolean>() {
        public Boolean apply(final Coordinate it) {
          int _y = it.getY();
          return Boolean.valueOf((_y == y));
        }
      };
      final Consumer<Coordinate> _function_2 = new Consumer<Coordinate>() {
        public void accept(final Coordinate it) {
          int _x = it.getX();
          int _x_1 = it.getX();
          Interval _interval = new Interval(_x, _x_1);
          intervals.addInterval(_interval);
        }
      };
      IterableExtensions.<Coordinate>filter(Day15.beacons, _function_1).forEach(_function_2);
      _xblockexpression = intervals;
    }
    return _xblockexpression;
  }

  public static int fromString(final String input) {
    int _length = input.length();
    int _minus = (_length - 1);
    return Integer.parseInt(input.substring(2, _minus));
  }
}
