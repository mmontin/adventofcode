package advent2017;

import adventutils.geometry.Coordinate;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Day14 {
  private static final String input = "oundnydw";

  public static void main(final String[] args) {
    final List<String> lines = CollectionLiterals.<String>newArrayList();
    final Consumer<Integer> _function = (Integer it) -> {
      final String current = ((Day14.input + "-") + it);
      final Function1<Integer, String> _function_1 = (Integer it_1) -> {
        return String.format("%8s", Integer.toBinaryString((it_1).intValue())).replaceAll(" ", ".").replaceAll("0", ".").replaceAll("1", "#");
      };
      final String current_hash = IterableExtensions.join(ListExtensions.<Integer, String>map(Day10.knotHash(current), _function_1), "");
      lines.add(current_hash);
    };
    new IntegerRange(0, 127).forEach(_function);
    final Function1<Character, Boolean> _function_1 = (Character it) -> {
      return Boolean.valueOf(it.toString().equals("#"));
    };
    InputOutput.<Integer>println(Integer.valueOf(IterableExtensions.size(IterableExtensions.<Character>filter(((Iterable<Character>)Conversions.doWrapArray(IterableExtensions.join(lines, "").toCharArray())), _function_1))));
    final HashSet<Coordinate> filled = CollectionLiterals.<Coordinate>newHashSet();
    final Set<Set<Coordinate>> regions = CollectionLiterals.<Set<Coordinate>>newHashSet();
    final Consumer<Integer> _function_2 = (Integer i) -> {
      final String current = lines.get((i).intValue());
      final Consumer<Integer> _function_3 = (Integer j) -> {
        boolean _equals = Character.valueOf(current.charAt((j).intValue())).toString().equals("#");
        if (_equals) {
          Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
          filled.add(_coordinate);
        }
      };
      new IntegerRange(0, 127).forEach(_function_3);
    };
    new IntegerRange(0, 127).forEach(_function_2);
    final Consumer<Coordinate> _function_3 = (Coordinate spot) -> {
      final Function1<Set<Coordinate>, Boolean> _function_4 = (Set<Coordinate> it) -> {
        final Function2<Boolean, Coordinate, Boolean> _function_5 = (Boolean acc, Coordinate v) -> {
          return Boolean.valueOf(((acc).booleanValue() || it.contains(v)));
        };
        return IterableExtensions.<Coordinate, Boolean>fold(spot.noDiagonalUnboundedNeighbours(), Boolean.valueOf(false), _function_5);
      };
      final Function2<HashSet<Coordinate>, Set<Coordinate>, HashSet<Coordinate>> _function_5 = (HashSet<Coordinate> acc, Set<Coordinate> v) -> {
        HashSet<Coordinate> _xblockexpression = null;
        {
          regions.remove(v);
          acc.addAll(v);
          _xblockexpression = acc;
        }
        return _xblockexpression;
      };
      regions.add(IterableExtensions.<Set<Coordinate>, HashSet<Coordinate>>fold(IterableExtensions.<Set<Coordinate>>toSet(IterableExtensions.<Set<Coordinate>>filter(regions, _function_4)), CollectionLiterals.<Coordinate>newHashSet(spot), _function_5));
    };
    filled.forEach(_function_3);
    InputOutput.<Integer>println(Integer.valueOf(regions.size()));
  }
}
