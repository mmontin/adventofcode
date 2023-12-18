package advent2017;

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

import adventutils.geometry.Coordinate;

@SuppressWarnings("all")
public class Day14 {
  private static final String input = "oundnydw";

  public static void main(final String[] args) {
    final List<String> lines = CollectionLiterals.<String>newArrayList();
    final Consumer<Integer> _function = new Consumer<Integer>() {
      public void accept(final Integer it) {
        final String current = ((Day14.input + "-") + it);
        final Function1<Integer, String> _function = new Function1<Integer, String>() {
          public String apply(final Integer it_1) {
            return String.format("%8s", Integer.toBinaryString((it_1).intValue())).replaceAll(" ", ".").replaceAll("0", ".").replaceAll("1", "#");
          }
        };
        final String current_hash = IterableExtensions.join(ListExtensions.<Integer, String>map(Day10.knotHash(current), _function), "");
        lines.add(current_hash);
      }
    };
    new IntegerRange(0, 127).forEach(_function);
    final Function1<Character, Boolean> _function_1 = new Function1<Character, Boolean>() {
      public Boolean apply(final Character it) {
        return Boolean.valueOf(it.toString().equals("#"));
      }
    };
    InputOutput.<Integer>println(Integer.valueOf(IterableExtensions.size(IterableExtensions.<Character>filter(((Iterable<Character>)Conversions.doWrapArray(IterableExtensions.join(lines, "").toCharArray())), _function_1))));
    final HashSet<Coordinate> filled = CollectionLiterals.<Coordinate>newHashSet();
    final Set<Set<Coordinate>> regions = CollectionLiterals.<Set<Coordinate>>newHashSet();
    final Consumer<Integer> _function_2 = new Consumer<Integer>() {
      public void accept(final Integer i) {
        final String current = lines.get((i).intValue());
        final Consumer<Integer> _function = new Consumer<Integer>() {
          public void accept(final Integer j) {
            boolean _equals = Character.valueOf(current.charAt((j).intValue())).toString().equals("#");
            if (_equals) {
              Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
              filled.add(_coordinate);
            }
          }
        };
        new IntegerRange(0, 127).forEach(_function);
      }
    };
    new IntegerRange(0, 127).forEach(_function_2);
    final Consumer<Coordinate> _function_3 = new Consumer<Coordinate>() {
      public void accept(final Coordinate spot) {
        final Function1<Set<Coordinate>, Boolean> _function = new Function1<Set<Coordinate>, Boolean>() {
          public Boolean apply(final Set<Coordinate> it) {
            final Function2<Boolean, Coordinate, Boolean> _function = new Function2<Boolean, Coordinate, Boolean>() {
              public Boolean apply(final Boolean acc, final Coordinate v) {
                return Boolean.valueOf(((acc).booleanValue() || it.contains(v)));
              }
            };
            return IterableExtensions.<Coordinate, Boolean>fold(spot.noDiagonalUnboundedNeighbours(), Boolean.valueOf(false), _function);
          }
        };
        final Function2<HashSet<Coordinate>, Set<Coordinate>, HashSet<Coordinate>> _function_1 = new Function2<HashSet<Coordinate>, Set<Coordinate>, HashSet<Coordinate>>() {
          public HashSet<Coordinate> apply(final HashSet<Coordinate> acc, final Set<Coordinate> v) {
            HashSet<Coordinate> _xblockexpression = null;
            {
              regions.remove(v);
              acc.addAll(v);
              _xblockexpression = acc;
            }
            return _xblockexpression;
          }
        };
        regions.add(IterableExtensions.<Set<Coordinate>, HashSet<Coordinate>>fold(IterableExtensions.<Set<Coordinate>>toSet(IterableExtensions.<Set<Coordinate>>filter(regions, _function)), CollectionLiterals.<Coordinate>newHashSet(spot), _function_1));
      }
    };
    filled.forEach(_function_3);
    InputOutput.<Integer>println(Integer.valueOf(regions.size()));
  }
}
