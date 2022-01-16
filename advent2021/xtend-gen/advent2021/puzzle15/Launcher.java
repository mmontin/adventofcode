package advent2021.puzzle15;

import adventutils.astar.AStar;
import adventutils.input.InputLoader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Launcher {
  public static final List<List<Character>> input = new InputLoader(Integer.valueOf(2021), Integer.valueOf(15)).<List<Character>>getInputs(new Function1<String, List<Character>>() {
    public List<Character> apply(final String it) {
      return IterableExtensions.<Character>toList(((Iterable<Character>)Conversions.doWrapArray(it.toCharArray())));
    }
  });
  
  public static final int max_value_small = Launcher.input.size();
  
  public static final int max_indice = ((Launcher.max_value_small * 5) - 1);
  
  public static final Map<Coordinate, Integer> coordinates = IterableExtensions.<Integer, HashMap<Coordinate, Integer>>fold(new ExclusiveRange(0, Launcher.max_value_small, true), CollectionLiterals.<Coordinate, Integer>newHashMap(), new Function2<HashMap<Coordinate, Integer>, Integer, HashMap<Coordinate, Integer>>() {
    public HashMap<Coordinate, Integer> apply(final HashMap<Coordinate, Integer> map1, final Integer i) {
      final Function2<HashMap<Coordinate, Integer>, Integer, HashMap<Coordinate, Integer>> _function = new Function2<HashMap<Coordinate, Integer>, Integer, HashMap<Coordinate, Integer>>() {
        public HashMap<Coordinate, Integer> apply(final HashMap<Coordinate, Integer> map2, final Integer j) {
          HashMap<Coordinate, Integer> _xblockexpression = null;
          {
            Character _get = Launcher.input.get((i).intValue()).get((j).intValue());
            String _plus = (_get + "");
            final int ij = Integer.parseInt(_plus);
            final Function2<HashMap<Coordinate, Integer>, Integer, HashMap<Coordinate, Integer>> _function = new Function2<HashMap<Coordinate, Integer>, Integer, HashMap<Coordinate, Integer>>() {
              public HashMap<Coordinate, Integer> apply(final HashMap<Coordinate, Integer> map3, final Integer u) {
                final Function2<HashMap<Coordinate, Integer>, Integer, HashMap<Coordinate, Integer>> _function = new Function2<HashMap<Coordinate, Integer>, Integer, HashMap<Coordinate, Integer>>() {
                  public HashMap<Coordinate, Integer> apply(final HashMap<Coordinate, Integer> map4, final Integer v) {
                    HashMap<Coordinate, Integer> _xblockexpression = null;
                    {
                      final int indice = ((ij + (u).intValue()) + (v).intValue());
                      Coordinate _coordinate = new Coordinate((((u).intValue() * Launcher.max_value_small) + (i).intValue()), (((v).intValue() * Launcher.max_value_small) + (j).intValue()));
                      int _xifexpression = (int) 0;
                      if ((indice >= 10)) {
                        _xifexpression = (indice - 9);
                      } else {
                        _xifexpression = indice;
                      }
                      map4.put(_coordinate, Integer.valueOf(_xifexpression));
                      _xblockexpression = map4;
                    }
                    return _xblockexpression;
                  }
                };
                return IterableExtensions.<Integer, HashMap<Coordinate, Integer>>fold(new ExclusiveRange(0, 5, true), map3, _function);
              }
            };
            _xblockexpression = IterableExtensions.<Integer, HashMap<Coordinate, Integer>>fold(new ExclusiveRange(0, 5, true), map2, _function);
          }
          return _xblockexpression;
        }
      };
      return IterableExtensions.<Integer, HashMap<Coordinate, Integer>>fold(new ExclusiveRange(0, Launcher.max_value_small, true), map1, _function);
    }
  });
  
  public static void main(final String[] args) {
    final long timer = System.currentTimeMillis();
    Coordinate _coordinate = new Coordinate(0, 0);
    InputOutput.<Integer>println(new AStar(_coordinate).run().getMinDistance());
    long _currentTimeMillis = System.currentTimeMillis();
    long _minus = (_currentTimeMillis - timer);
    String _plus = ("Result computed in " + Long.valueOf(_minus));
    String _plus_1 = (_plus + "ms");
    InputOutput.<String>println(_plus_1);
  }
}
