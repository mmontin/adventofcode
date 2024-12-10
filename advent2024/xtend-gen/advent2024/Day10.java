package advent2024;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;
import com.google.common.collect.Iterables;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day10 {
  public static void main(final String[] args) {
    final Function1<String, List<Integer>> _function = (String it) -> {
      final Function1<Character, Integer> _function_1 = (Character it_1) -> {
        String _plus = (it_1 + "");
        return Integer.valueOf(Integer.parseInt(_plus));
      };
      return ListExtensions.<Character, Integer>map(((List<Character>)Conversions.doWrapArray(it.toCharArray())), _function_1);
    };
    final List<List<Integer>> input = ListExtensions.<String, List<Integer>>map(new InputLoader(Integer.valueOf(2024), Integer.valueOf(10)).getInputs(), _function);
    int _size = input.size();
    final int max_i = (_size - 1);
    int _size_1 = input.get(0).size();
    final int max_j = (_size_1 - 1);
    final HashMap<Coordinate, Integer> heights = CollectionLiterals.<Coordinate, Integer>newHashMap();
    final Consumer<Integer> _function_1 = (Integer i) -> {
      final List<Integer> line = input.get((i).intValue());
      final Consumer<Integer> _function_2 = (Integer j) -> {
        Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
        heights.put(_coordinate, line.get((j).intValue()));
      };
      new IntegerRange(0, max_j).forEach(_function_2);
    };
    new IntegerRange(0, max_i).forEach(_function_1);
    final Function1<Map.Entry<Coordinate, Integer>, Boolean> _function_2 = (Map.Entry<Coordinate, Integer> it) -> {
      Integer _value = it.getValue();
      return Boolean.valueOf(((_value).intValue() == 0));
    };
    final Function1<Map.Entry<Coordinate, Integer>, Coordinate> _function_3 = (Map.Entry<Coordinate, Integer> it) -> {
      return it.getKey();
    };
    Iterable<Coordinate> _map = IterableExtensions.<Map.Entry<Coordinate, Integer>, Coordinate>map(IterableExtensions.<Map.Entry<Coordinate, Integer>>filter(heights.entrySet(), _function_2), _function_3);
    Pair<Integer, Integer> _mappedTo = Pair.<Integer, Integer>of(Integer.valueOf(0), Integer.valueOf(0));
    final Function2<Pair<Integer, Integer>, Coordinate, Pair<Integer, Integer>> _function_4 = (Pair<Integer, Integer> acc, Coordinate source) -> {
      Pair<Integer, Integer> _xblockexpression = null;
      {
        int next_height = 1;
        ArrayList<Coordinate> current = CollectionLiterals.<Coordinate>newArrayList(source);
        while (((next_height <= 9) && (!current.isEmpty()))) {
          {
            final int height = next_height;
            final Function2<ArrayList<Coordinate>, Coordinate, ArrayList<Coordinate>> _function_5 = (ArrayList<Coordinate> acc1, Coordinate pos) -> {
              ArrayList<Coordinate> _xblockexpression_1 = null;
              {
                final Function1<Coordinate, Boolean> _function_6 = (Coordinate it) -> {
                  Integer _get = heights.get(it);
                  return Boolean.valueOf(((_get).intValue() == height));
                };
                Iterables.<Coordinate>addAll(acc1, IterableExtensions.<Coordinate>filter(pos.noDiagonalBoundedNeighbours(0, max_i, 0, max_j), _function_6));
                _xblockexpression_1 = acc1;
              }
              return _xblockexpression_1;
            };
            current = IterableExtensions.<Coordinate, ArrayList<Coordinate>>fold(current, CollectionLiterals.<Coordinate>newArrayList(), _function_5);
            next_height++;
          }
        }
        Integer _key = acc.getKey();
        int _size_2 = IterableExtensions.<Coordinate>toSet(current).size();
        int _plus = ((_key).intValue() + _size_2);
        Integer _value = acc.getValue();
        int _size_3 = current.size();
        int _plus_1 = ((_value).intValue() + _size_3);
        _xblockexpression = Pair.<Integer, Integer>of(Integer.valueOf(_plus), Integer.valueOf(_plus_1));
      }
      return _xblockexpression;
    };
    InputOutput.<Pair<Integer, Integer>>println(IterableExtensions.<Coordinate, Pair<Integer, Integer>>fold(_map, _mappedTo, _function_4));
  }
}
