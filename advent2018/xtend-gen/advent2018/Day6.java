package advent2018;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.function.BiFunction;
import java.util.function.Consumer;

import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;

@SuppressWarnings("all")
public class Day6 {
  public static void main(final String[] args) {
    final Function1<String, Coordinate> _function = (String it) -> {
      String _replace = it.replace(" ", "");
      return new Coordinate(_replace);
    };
    final List<Coordinate> sensors = new InputLoader(Integer.valueOf(2018), Integer.valueOf(6)).<Coordinate>getInputs(_function);
    final Function1<Coordinate, Integer> _function_1 = (Coordinate it) -> {
      return Integer.valueOf(it.getX());
    };
    final int minX = IterableExtensions.<Coordinate, Integer>minBy(sensors, _function_1).getX();
    final Function1<Coordinate, Integer> _function_2 = (Coordinate it) -> {
      return Integer.valueOf(it.getX());
    };
    final int maxX = IterableExtensions.<Coordinate, Integer>maxBy(sensors, _function_2).getX();
    final Function1<Coordinate, Integer> _function_3 = (Coordinate it) -> {
      return Integer.valueOf(it.getY());
    };
    final int minY = IterableExtensions.<Coordinate, Integer>minBy(sensors, _function_3).getY();
    final Function1<Coordinate, Integer> _function_4 = (Coordinate it) -> {
      return Integer.valueOf(it.getY());
    };
    final int maxY = IterableExtensions.<Coordinate, Integer>maxBy(sensors, _function_4).getY();
    final ArrayList<Coordinate> position = CollectionLiterals.<Coordinate>newArrayList();
    final Consumer<Integer> _function_5 = (Integer i) -> {
      final Consumer<Integer> _function_6 = (Integer j) -> {
        Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
        position.add(_coordinate);
      };
      new IntegerRange(minY, maxY).forEach(_function_6);
    };
    new IntegerRange(minX, maxX).forEach(_function_5);
    final HashMap<Coordinate, HashSet<Coordinate>> areas = CollectionLiterals.<Coordinate, HashSet<Coordinate>>newHashMap();
    while ((!position.isEmpty())) {
      {
        final Coordinate current = position.remove(0);
        final Function1<Coordinate, Integer> _function_6 = (Coordinate it) -> {
          return Integer.valueOf(it.manhattanDistanceTo(current));
        };
        final List<Coordinate> sorted = IterableExtensions.<Coordinate, Integer>sortBy(sensors, _function_6);
        final int d1 = current.manhattanDistanceTo(sorted.get(0));
        final int d2 = current.manhattanDistanceTo(sorted.get(1));
        if ((d1 != d2)) {
          final BiFunction<HashSet<Coordinate>, HashSet<Coordinate>, HashSet<Coordinate>> _function_7 = (HashSet<Coordinate> u, HashSet<Coordinate> v) -> {
            HashSet<Coordinate> _xblockexpression = null;
            {
              u.addAll(v);
              _xblockexpression = u;
            }
            return _xblockexpression;
          };
          areas.merge(sorted.get(0), CollectionLiterals.<Coordinate>newHashSet(current), _function_7);
        }
      }
    }
    final Function1<HashSet<Coordinate>, Integer> _function_6 = (HashSet<Coordinate> it) -> {
      int _xifexpression = (int) 0;
      final Function1<Coordinate, Boolean> _function_7 = (Coordinate c) -> {
        return Boolean.valueOf(((((c.getX() == minX) || (c.getX() == maxX)) || (c.getY() == minY)) || (c.getY() == maxY)));
      };
      boolean _exists = IterableExtensions.<Coordinate>exists(it, _function_7);
      if (_exists) {
        _xifexpression = 0;
      } else {
        _xifexpression = it.size();
      }
      return Integer.valueOf(_xifexpression);
    };
    InputOutput.<Integer>println(IterableExtensions.<Integer>max(IterableExtensions.<HashSet<Coordinate>, Integer>map(areas.values(), _function_6)));
    final int max_distance = 10000;
    int _size = sensors.size();
    final int max_offset = (max_distance / _size);
    final HashSet<Coordinate> region = CollectionLiterals.<Coordinate>newHashSet();
    final Consumer<Integer> _function_7 = (Integer i) -> {
      final Consumer<Integer> _function_8 = (Integer j) -> {
        final Coordinate current = new Coordinate((i).intValue(), (j).intValue());
        final Function2<Integer, Coordinate, Integer> _function_9 = (Integer acc, Coordinate v) -> {
          int _manhattanDistanceTo = current.manhattanDistanceTo(v);
          return Integer.valueOf(((acc).intValue() + _manhattanDistanceTo));
        };
        final Integer sum = IterableExtensions.<Coordinate, Integer>fold(sensors, Integer.valueOf(0), _function_9);
        if (((sum).intValue() < max_distance)) {
          region.add(current);
        }
      };
      new IntegerRange((minY - max_offset), (maxY + max_offset)).forEach(_function_8);
    };
    new IntegerRange((minX - max_offset), (maxX + max_offset)).forEach(_function_7);
    InputOutput.<Integer>println(Integer.valueOf(region.size()));
  }
}
