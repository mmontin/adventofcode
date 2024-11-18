package advent2022;

import adventutils.geometry.Triplet;
import adventutils.input.InputLoader;
import com.google.common.collect.Iterables;
import java.util.HashSet;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day18 {
  private static final Set<Triplet> elements = new HashSet<Triplet>(
    ListExtensions.<String, Triplet>map(new InputLoader(Integer.valueOf(2022), Integer.valueOf(18)).getInputs(), ((Function1<String, Triplet>) (String it) -> {
      return new Triplet(it);
    })));

  private static final int min_value = (-1);

  private static final int max_value = 22;

  public static void main(final String[] args) {
    Triplet _triplet = new Triplet(Day18.min_value, Day18.min_value, Day18.min_value);
    final HashSet<Triplet> toVisit = CollectionLiterals.<Triplet>newHashSet(_triplet);
    final HashSet<Triplet> exterior = CollectionLiterals.<Triplet>newHashSet();
    while ((!toVisit.isEmpty())) {
      {
        final Triplet current = IterableExtensions.<Triplet>head(toVisit);
        toVisit.remove(current);
        exterior.add(current);
        final Function1<Triplet, Boolean> _function = (Triplet it) -> {
          return Boolean.valueOf((((((((((!exterior.contains(it)) && (!Day18.elements.contains(it))) && (!toVisit.contains(it))) && (it.x >= Day18.min_value)) && 
            (it.x <= Day18.max_value)) && (it.y >= Day18.min_value)) && (it.y <= Day18.max_value)) && (it.z >= Day18.min_value)) && 
            (it.z <= Day18.max_value)));
        };
        final Iterable<Triplet> neighbours = IterableExtensions.<Triplet>filter(current.face_neighbours(), _function);
        Iterables.<Triplet>addAll(toVisit, neighbours);
      }
    }
    Pair<Integer, Integer> _mappedTo = Pair.<Integer, Integer>of(Integer.valueOf(0), Integer.valueOf(0));
    final Function2<Pair<Integer, Integer>, Triplet, Pair<Integer, Integer>> _function = (Pair<Integer, Integer> acc, Triplet triplet) -> {
      Pair<Integer, Integer> _xblockexpression = null;
      {
        final HashSet<Triplet> current_neighbours = triplet.face_neighbours();
        Integer _key = acc.getKey();
        final Function1<Triplet, Boolean> _function_1 = (Triplet it) -> {
          return Boolean.valueOf(Day18.elements.contains(it));
        };
        int _size = IterableExtensions.size(IterableExtensions.<Triplet>reject(current_neighbours, _function_1));
        int _plus = ((_key).intValue() + _size);
        Integer _value = acc.getValue();
        final Function1<Triplet, Boolean> _function_2 = (Triplet it) -> {
          return Boolean.valueOf(exterior.contains(it));
        };
        int _size_1 = IterableExtensions.size(IterableExtensions.<Triplet>filter(current_neighbours, _function_2));
        int _plus_1 = ((_value).intValue() + _size_1);
        _xblockexpression = Pair.<Integer, Integer>of(Integer.valueOf(_plus), Integer.valueOf(_plus_1));
      }
      return _xblockexpression;
    };
    InputOutput.<Pair<Integer, Integer>>println(IterableExtensions.<Triplet, Pair<Integer, Integer>>fold(Day18.elements, _mappedTo, _function));
  }
}
