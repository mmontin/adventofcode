package advent2019;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.function.BiFunction;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Day10 {
  public static void main(final String[] args) {
    final ArrayList<Coordinate> asteroids = CollectionLiterals.<Coordinate>newArrayList();
    final Function2<Integer, List<String>, Integer> _function = (Integer i, List<String> el) -> {
      int _xblockexpression = (int) 0;
      {
        final Function2<Integer, String, Integer> _function_1 = (Integer j, String s) -> {
          int _xblockexpression_1 = (int) 0;
          {
            boolean _equals = s.equals("#");
            if (_equals) {
              Coordinate _coordinate = new Coordinate((j).intValue(), (-(i).intValue()));
              asteroids.add(_coordinate);
            }
            _xblockexpression_1 = ((j).intValue() + 1);
          }
          return Integer.valueOf(_xblockexpression_1);
        };
        IterableExtensions.<String, Integer>fold(el, Integer.valueOf(0), _function_1);
        _xblockexpression = ((i).intValue() + 1);
      }
      return Integer.valueOf(_xblockexpression);
    };
    IterableExtensions.<List<String>, Integer>fold(new InputLoader(Integer.valueOf(2019), Integer.valueOf(10)).getChars(), Integer.valueOf(0), _function);
    final HashSet<Coordinate> asteroids_set = new HashSet<Coordinate>(asteroids);
    final HashMap<Coordinate, HashSet<Coordinate>> visible = CollectionLiterals.<Coordinate, HashSet<Coordinate>>newHashMap();
    final int nb_of_asteroids = asteroids.size();
    ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, nb_of_asteroids, true);
    for (final Integer i : _doubleDotLessThan) {
      ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(((i).intValue() + 1), nb_of_asteroids, true);
      for (final Integer j : _doubleDotLessThan_1) {
        {
          final Coordinate first = asteroids.get((i).intValue());
          final Coordinate second = asteroids.get((j).intValue());
          final Coordinate vect = second.subtract(first).reduce();
          Coordinate current = first.add(vect);
          while ((!asteroids_set.contains(current))) {
            current = current.add(vect);
          }
          final BiFunction<HashSet<Coordinate>, HashSet<Coordinate>, HashSet<Coordinate>> _function_1 = (HashSet<Coordinate> x, HashSet<Coordinate> y) -> {
            HashSet<Coordinate> _xblockexpression = null;
            {
              x.addAll(y);
              _xblockexpression = x;
            }
            return _xblockexpression;
          };
          visible.merge(first, CollectionLiterals.<Coordinate>newHashSet(current), _function_1);
          final BiFunction<HashSet<Coordinate>, HashSet<Coordinate>, HashSet<Coordinate>> _function_2 = (HashSet<Coordinate> x, HashSet<Coordinate> y) -> {
            HashSet<Coordinate> _xblockexpression = null;
            {
              x.addAll(y);
              _xblockexpression = x;
            }
            return _xblockexpression;
          };
          visible.merge(current, CollectionLiterals.<Coordinate>newHashSet(first), _function_2);
        }
      }
    }
    final Function1<Map.Entry<Coordinate, HashSet<Coordinate>>, Integer> _function_1 = (Map.Entry<Coordinate, HashSet<Coordinate>> it) -> {
      return Integer.valueOf(it.getValue().size());
    };
    final Map.Entry<Coordinate, HashSet<Coordinate>> best_spot = IterableExtensions.<Map.Entry<Coordinate, HashSet<Coordinate>>, Integer>maxBy(visible.entrySet(), _function_1);
    final Function1<Coordinate, Coordinate> _function_2 = (Coordinate it) -> {
      return it.subtract(best_spot.getKey());
    };
    final List<Coordinate> visible_from_best_location = IterableExtensions.<Coordinate>toList(IterableExtensions.<Coordinate, Coordinate>map(best_spot.getValue(), _function_2));
    InputOutput.<Integer>println(Integer.valueOf(visible_from_best_location.size()));
    final Comparator<Coordinate> _function_3 = (Coordinate x, Coordinate y) -> {
      return Day10.compare(x, y);
    };
    final Coordinate star200 = ListExtensions.<Coordinate>sortInplace(visible_from_best_location, _function_3).get(199).add(best_spot.getKey()).symByY(0);
    int _x = star200.getX();
    int _multiply = (_x * 100);
    int _y = star200.getY();
    int _plus = (_multiply + _y);
    InputOutput.<Integer>println(Integer.valueOf(_plus));
  }

  public static int compare(final Coordinate c1, final Coordinate c2) {
    int _xblockexpression = (int) 0;
    {
      final int quartile1 = Day10.quartile(c1);
      final int quartile2 = Day10.quartile(c2);
      int _xifexpression = (int) 0;
      if ((quartile1 != quartile2)) {
        _xifexpression = Integer.valueOf(quartile1).compareTo(Integer.valueOf(quartile2));
      } else {
        int _xblockexpression_1 = (int) 0;
        {
          int _x = c1.getX();
          int _y = c1.getY();
          double _divide = (((double) _x) / ((double) _y));
          final double angle1 = Math.atan(Math.abs(_divide));
          int _x_1 = c2.getX();
          int _y_1 = c2.getY();
          double _divide_1 = (((double) _x_1) / ((double) _y_1));
          final double angle2 = Math.atan(Math.abs(_divide_1));
          int _switchResult = (int) 0;
          switch (quartile1) {
            case 1:
              _switchResult = Integer.valueOf(c1.getY()).compareTo(Integer.valueOf(c2.getY()));
              break;
            case 3:
              _switchResult = Integer.valueOf(c1.getX()).compareTo(Integer.valueOf(c1.getY()));
              break;
            case 5:
              _switchResult = Integer.valueOf(c2.getY()).compareTo(Integer.valueOf(c2.getY()));
              break;
            case 7:
              _switchResult = Integer.valueOf(c2.getX()).compareTo(Integer.valueOf(c1.getX()));
              break;
            case 2:
              _switchResult = Double.valueOf(angle1).compareTo(Double.valueOf(angle2));
              break;
            case 4:
              _switchResult = Double.valueOf(angle2).compareTo(Double.valueOf(angle1));
              break;
            case 6:
              _switchResult = Double.valueOf(angle1).compareTo(Double.valueOf(angle2));
              break;
            default:
              _switchResult = Double.valueOf(angle2).compareTo(Double.valueOf(angle1));
              break;
          }
          _xblockexpression_1 = _switchResult;
        }
        _xifexpression = _xblockexpression_1;
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }

  public static int quartile(final Coordinate c) {
    int _switchResult = (int) 0;
    boolean _matched = false;
    if (((c.getY() == 0) && (c.getX() > 0))) {
      _matched=true;
      _switchResult = 3;
    }
    if (!_matched) {
      int _y = c.getY();
      boolean _equals = (_y == 0);
      if (_equals) {
        _matched=true;
        _switchResult = 7;
      }
    }
    if (!_matched) {
      if (((c.getX() == 0) && (c.getY() > 0))) {
        _matched=true;
        _switchResult = 1;
      }
    }
    if (!_matched) {
      int _x = c.getX();
      boolean _equals_1 = (_x == 0);
      if (_equals_1) {
        _matched=true;
        _switchResult = 5;
      }
    }
    if (!_matched) {
      if (((c.getX() > 0) && (c.getY() > 0))) {
        _matched=true;
        _switchResult = 2;
      }
    }
    if (!_matched) {
      int _x_1 = c.getX();
      boolean _greaterThan = (_x_1 > 0);
      if (_greaterThan) {
        _matched=true;
        _switchResult = 4;
      }
    }
    if (!_matched) {
      if (((c.getX() < 0) && (c.getY() < 0))) {
        _matched=true;
        _switchResult = 6;
      }
    }
    if (!_matched) {
      _switchResult = 8;
    }
    return _switchResult;
  }
}
