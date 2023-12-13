package advent2019;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;
import java.util.ArrayList;
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
import org.eclipse.xtext.xbase.lib.Pair;

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
              Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
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
          final Coordinate vect = second.diff(first);
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
    InputOutput.<Integer>println(Integer.valueOf(best_spot.getValue().size()));
    InputOutput.<Coordinate>println(best_spot.getKey());
    final Function1<Coordinate, Pair<Coordinate, Double>> _function_2 = (Coordinate it) -> {
      Pair<Coordinate, Double> _xblockexpression = null;
      {
        final Coordinate vector = it.diff(best_spot.getKey());
        int _x = vector.getX();
        int _minus = (-_x);
        double _length = vector.length();
        double _divide = (_minus / _length);
        double _acos = Math.acos(_divide);
        _xblockexpression = Pair.<Coordinate, Double>of(it, Double.valueOf(_acos));
      }
      return _xblockexpression;
    };
    final Function1<Pair<Coordinate, Double>, Double> _function_3 = (Pair<Coordinate, Double> it) -> {
      return it.getValue();
    };
    InputOutput.<List<Pair<Coordinate, Double>>>println(
      IterableExtensions.<Pair<Coordinate, Double>, Double>sortBy(IterableExtensions.<Coordinate, Pair<Coordinate, Double>>map(best_spot.getValue(), _function_2), _function_3));
  }
}
