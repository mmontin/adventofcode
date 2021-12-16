package advent2021.puzzle15;

import advent2021.Utils;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Launcher {
  public static final List<List<Character>> input = Utils.<List<Character>>getInputs(15, new Function1<String, List<Character>>() {
    public List<Character> apply(final String it) {
      return IterableExtensions.<Character>toList(((Iterable<Character>)Conversions.doWrapArray(it.toCharArray())));
    }
  });
  
  public static final int max_value_small = Launcher.input.size();
  
  public static final int max_value_big = (Launcher.max_value_small * 5);
  
  public static Coordinate final_state;
  
  public static final Set<Coordinate> coordinates = IterableExtensions.<Integer, HashSet<Coordinate>>fold(new ExclusiveRange(0, Launcher.max_value_small, true), CollectionLiterals.<Coordinate>newHashSet(), new Function2<HashSet<Coordinate>, Integer, HashSet<Coordinate>>() {
    public HashSet<Coordinate> apply(final HashSet<Coordinate> set1, final Integer i) {
      final Function2<HashSet<Coordinate>, Integer, HashSet<Coordinate>> _function = new Function2<HashSet<Coordinate>, Integer, HashSet<Coordinate>>() {
        public HashSet<Coordinate> apply(final HashSet<Coordinate> set2, final Integer j) {
          HashSet<Coordinate> _xblockexpression = null;
          {
            Character _get = Launcher.input.get((i).intValue()).get((j).intValue());
            String _plus = (_get + "");
            final int ij = Integer.parseInt(_plus);
            final Function2<HashSet<Coordinate>, Integer, HashSet<Coordinate>> _function = new Function2<HashSet<Coordinate>, Integer, HashSet<Coordinate>>() {
              public HashSet<Coordinate> apply(final HashSet<Coordinate> set3, final Integer u) {
                final Function2<HashSet<Coordinate>, Integer, HashSet<Coordinate>> _function = new Function2<HashSet<Coordinate>, Integer, HashSet<Coordinate>>() {
                  public HashSet<Coordinate> apply(final HashSet<Coordinate> set4, final Integer v) {
                    HashSet<Coordinate> _xblockexpression = null;
                    {
                      final int indice = ((ij + (u).intValue()) + (v).intValue());
                      int _xifexpression = (int) 0;
                      if ((indice >= 10)) {
                        _xifexpression = (indice - 9);
                      } else {
                        _xifexpression = indice;
                      }
                      final Coordinate coord = new Coordinate((((u).intValue() * Launcher.max_value_small) + (i).intValue()), (((v).intValue() * Launcher.max_value_small) + (j).intValue()), _xifexpression);
                      if ((((((i).intValue() == (Launcher.max_value_small - 1)) && ((j).intValue() == (Launcher.max_value_small - 1))) && ((u).intValue() == 4)) && ((v).intValue() == 4))) {
                        Launcher.final_state = coord;
                      }
                      set4.add(coord);
                      _xblockexpression = set4;
                    }
                    return _xblockexpression;
                  }
                };
                return IterableExtensions.<Integer, HashSet<Coordinate>>fold(new ExclusiveRange(0, 5, true), set3, _function);
              }
            };
            _xblockexpression = IterableExtensions.<Integer, HashSet<Coordinate>>fold(new ExclusiveRange(0, 5, true), set2, _function);
          }
          return _xblockexpression;
        }
      };
      return IterableExtensions.<Integer, HashSet<Coordinate>>fold(new ExclusiveRange(0, Launcher.max_value_small, true), set1, _function);
    }
  });
  
  public static final Set<Coordinate> toVisit = new HashSet<Coordinate>(Launcher.coordinates);
  
  public static void main(final String[] args) {
    long time = System.currentTimeMillis();
    Coordinate first = null;
    while ((!(first = IterableExtensions.<Coordinate, Integer>minBy(Launcher.toVisit, new Function1<Coordinate, Integer>() {
      public Integer apply(final Coordinate it) {
        return Integer.valueOf(it.getDistance());
      }
    })).equals(Launcher.final_state))) {
      {
        int _size = Launcher.toVisit.size();
        int _modulo = (_size % 1000);
        boolean _equals = (_modulo == 0);
        if (_equals) {
          long time_1 = System.currentTimeMillis();
          String _plus = (Long.valueOf((time_1 - time)) + "ms for the last 1000 states");
          InputOutput.<String>println(_plus);
          time = time_1;
          int _size_1 = Launcher.toVisit.size();
          String _plus_1 = (Integer.valueOf(_size_1) + " states remaining");
          InputOutput.<String>println(_plus_1);
        }
        Launcher.toVisit.remove(first);
        Iterable<Coordinate> _neighbours = first.neighbours(Launcher.toVisit);
        for (final Coordinate c : _neighbours) {
          c.updateDistance(first);
        }
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(Launcher.final_state.getDistance()));
  }
}
