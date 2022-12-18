package advent2022;

import adventutils.geometry.Triplet;
import adventutils.input.InputLoader;
import com.google.common.collect.Iterables;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Day18 {
  private static final Set<Triplet> elements = new Function0<Set<Triplet>>() {
    public Set<Triplet> apply() {
      final Function1<String, Triplet> _function = new Function1<String, Triplet>() {
        public Triplet apply(final String it) {
          return new Triplet(it);
        }
      };
      List<Triplet> _map = ListExtensions.<String, Triplet>map(new InputLoader(Integer.valueOf(2022), Integer.valueOf(18)).getInputs(), _function);
      return new HashSet<Triplet>(_map);
    }
  }.apply();

  private static final int min_value = (-1);

  private static final int max_value = 22;

  public static void main(final String[] args) {
    final Function2<Integer, Triplet, Integer> _function = new Function2<Integer, Triplet, Integer>() {
      public Integer apply(final Integer acc, final Triplet triplet) {
        final Function1<Triplet, Boolean> _function = new Function1<Triplet, Boolean>() {
          public Boolean apply(final Triplet it) {
            return Boolean.valueOf(Day18.elements.contains(it));
          }
        };
        int _size = IterableExtensions.size(IterableExtensions.<Triplet>reject(triplet.face_neighbours(), _function));
        return Integer.valueOf(((acc).intValue() + _size));
      }
    };
    InputOutput.<Integer>println(IterableExtensions.<Triplet, Integer>fold(Day18.elements, Integer.valueOf(0), _function));
    Triplet _triplet = new Triplet((-1), (-1), (-1));
    final HashSet<Triplet> toVisit = CollectionLiterals.<Triplet>newHashSet(_triplet);
    final HashSet<Triplet> exterior = CollectionLiterals.<Triplet>newHashSet();
    while ((!toVisit.isEmpty())) {
      {
        final Triplet current = IterableExtensions.<Triplet>head(toVisit);
        toVisit.remove(current);
        exterior.add(current);
        final Function1<Triplet, Boolean> _function_1 = new Function1<Triplet, Boolean>() {
          public Boolean apply(final Triplet it) {
            return Boolean.valueOf((((((((((!exterior.contains(it)) && (!Day18.elements.contains(it))) && (!toVisit.contains(it))) && (it.x >= Day18.min_value)) && 
              (it.x <= Day18.max_value)) && (it.y >= Day18.min_value)) && (it.y <= Day18.max_value)) && (it.z >= Day18.min_value)) && 
              (it.z <= Day18.max_value)));
          }
        };
        final Iterable<Triplet> neighbours = IterableExtensions.<Triplet>filter(current.face_neighbours(), _function_1);
        Iterables.<Triplet>addAll(toVisit, neighbours);
      }
    }
    final Function2<Integer, Triplet, Integer> _function_1 = new Function2<Integer, Triplet, Integer>() {
      public Integer apply(final Integer acc, final Triplet triplet) {
        final Function1<Triplet, Boolean> _function = new Function1<Triplet, Boolean>() {
          public Boolean apply(final Triplet it) {
            return Boolean.valueOf(exterior.contains(it));
          }
        };
        int _size = IterableExtensions.size(IterableExtensions.<Triplet>filter(triplet.face_neighbours(), _function));
        return Integer.valueOf(((acc).intValue() + _size));
      }
    };
    InputOutput.<Integer>println(IterableExtensions.<Triplet, Integer>fold(Day18.elements, Integer.valueOf(0), _function_1));
  }
}
