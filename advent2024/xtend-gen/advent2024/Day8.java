package advent2024;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Day8 {
  public static void main(final String[] args) {
    final Function1<String, List<String>> _function = (String it) -> {
      final Function1<Character, String> _function_1 = (Character it_1) -> {
        return (it_1 + "");
      };
      return ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray(it.toCharArray())), _function_1);
    };
    final List<List<String>> inputs = ListExtensions.<String, List<String>>map(new InputLoader(Integer.valueOf(2024), Integer.valueOf(8)).getInputs(), _function);
    final Map<String, List<Coordinate>> antennas = CollectionLiterals.<String, List<Coordinate>>newHashMap();
    int _size = inputs.size();
    final int max_i = (_size - 1);
    int _size_1 = inputs.get(0).size();
    final int max_j = (_size_1 - 1);
    final Consumer<Integer> _function_1 = (Integer i) -> {
      final List<String> line = inputs.get((i).intValue());
      final Consumer<Integer> _function_2 = (Integer j) -> {
        final String current_char = line.get((j).intValue());
        boolean _equals = current_char.equals(".");
        boolean _not = (!_equals);
        if (_not) {
          final Coordinate current = new Coordinate((i).intValue(), (j).intValue());
          boolean _containsKey = antennas.containsKey(current_char);
          if (_containsKey) {
            antennas.get(current_char).add(current);
          } else {
            antennas.put(current_char, CollectionLiterals.<Coordinate>newArrayList(current));
          }
        }
      };
      new IntegerRange(0, max_j).forEach(_function_2);
    };
    new IntegerRange(0, max_i).forEach(_function_1);
    final Function2<HashSet<Coordinate>, List<Coordinate>, HashSet<Coordinate>> _function_2 = (HashSet<Coordinate> acc, List<Coordinate> sublist) -> {
      HashSet<Coordinate> _xblockexpression = null;
      {
        final int current_nb = sublist.size();
        final Consumer<Integer> _function_3 = (Integer i) -> {
          final Consumer<Integer> _function_4 = (Integer j) -> {
            final Coordinate a = sublist.get((i).intValue());
            final Coordinate b = sublist.get((j).intValue());
            final Coordinate c = a.subtract(b);
            acc.add(a.add(c));
            acc.add(b.subtract(c));
          };
          new ExclusiveRange(((i).intValue() + 1), current_nb, true).forEach(_function_4);
        };
        new ExclusiveRange(0, current_nb, true).forEach(_function_3);
        _xblockexpression = acc;
      }
      return _xblockexpression;
    };
    final Function1<Coordinate, Boolean> _function_3 = (Coordinate it) -> {
      return Boolean.valueOf(it.includedIn(0, max_i, 0, max_j));
    };
    final Iterable<Coordinate> antinodes = IterableExtensions.<Coordinate>filter(IterableExtensions.<List<Coordinate>, HashSet<Coordinate>>fold(antennas.values(), CollectionLiterals.<Coordinate>newHashSet(), _function_2), _function_3);
    final Function2<HashSet<Coordinate>, List<Coordinate>, HashSet<Coordinate>> _function_4 = (HashSet<Coordinate> acc, List<Coordinate> sublist) -> {
      HashSet<Coordinate> _xblockexpression = null;
      {
        acc.addAll(sublist);
        final int current_nb = sublist.size();
        final Consumer<Integer> _function_5 = (Integer i) -> {
          final Consumer<Integer> _function_6 = (Integer j) -> {
            final Coordinate a = sublist.get((i).intValue());
            final Coordinate b = sublist.get((j).intValue());
            final Coordinate c = a.subtract(b);
            Coordinate next_a = a.add(c);
            while (next_a.includedIn(0, max_i, 0, max_j)) {
              {
                acc.add(next_a);
                next_a = next_a.add(c);
              }
            }
            Coordinate next_b = b.subtract(c);
            while (next_b.includedIn(0, max_i, 0, max_j)) {
              {
                acc.add(next_b);
                next_b = next_b.subtract(c);
              }
            }
          };
          new ExclusiveRange(((i).intValue() + 1), current_nb, true).forEach(_function_6);
        };
        new ExclusiveRange(0, current_nb, true).forEach(_function_5);
        _xblockexpression = acc;
      }
      return _xblockexpression;
    };
    final HashSet<Coordinate> new_antinodes = IterableExtensions.<List<Coordinate>, HashSet<Coordinate>>fold(antennas.values(), CollectionLiterals.<Coordinate>newHashSet(), _function_4);
    InputOutput.<Integer>println(Integer.valueOf(IterableExtensions.size(antinodes)));
    InputOutput.<Integer>println(Integer.valueOf(new_antinodes.size()));
  }
}
