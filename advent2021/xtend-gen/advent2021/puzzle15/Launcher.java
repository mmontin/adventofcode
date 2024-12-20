package advent2021.puzzle15;

import adventutils.input.InputLoader;
import adventutils.pathfinding.AStar;
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
  public static final List<List<Character>> input = new InputLoader(Integer.valueOf(2021), Integer.valueOf(15)).<List<Character>>getInputs(((Function1<String, List<Character>>) (String it) -> {
    return IterableExtensions.<Character>toList(((Iterable<Character>)Conversions.doWrapArray(it.toCharArray())));
  }));

  public static final int max_value_small = Launcher.input.size();

  public static final int max_indice = ((Launcher.max_value_small * 5) - 1);

  public static final Map<CoordinateState, Integer> coordinates = IterableExtensions.<Integer, HashMap<CoordinateState, Integer>>fold(new ExclusiveRange(0, Launcher.max_value_small, true), CollectionLiterals.<CoordinateState, Integer>newHashMap(), ((Function2<HashMap<CoordinateState, Integer>, Integer, HashMap<CoordinateState, Integer>>) (HashMap<CoordinateState, Integer> map1, Integer i) -> {
    final Function2<HashMap<CoordinateState, Integer>, Integer, HashMap<CoordinateState, Integer>> _function = (HashMap<CoordinateState, Integer> map2, Integer j) -> {
      HashMap<CoordinateState, Integer> _xblockexpression = null;
      {
        Character _get = Launcher.input.get((i).intValue()).get((j).intValue());
        String _plus = (_get + "");
        final int ij = Integer.parseInt(_plus);
        final Function2<HashMap<CoordinateState, Integer>, Integer, HashMap<CoordinateState, Integer>> _function_1 = (HashMap<CoordinateState, Integer> map3, Integer u) -> {
          final Function2<HashMap<CoordinateState, Integer>, Integer, HashMap<CoordinateState, Integer>> _function_2 = (HashMap<CoordinateState, Integer> map4, Integer v) -> {
            HashMap<CoordinateState, Integer> _xblockexpression_1 = null;
            {
              final int indice = ((ij + (u).intValue()) + (v).intValue());
              CoordinateState _coordinateState = new CoordinateState((((u).intValue() * Launcher.max_value_small) + (i).intValue()), (((v).intValue() * Launcher.max_value_small) + (j).intValue()));
              int _xifexpression = (int) 0;
              if ((indice >= 10)) {
                _xifexpression = (indice - 9);
              } else {
                _xifexpression = indice;
              }
              map4.put(_coordinateState, Integer.valueOf(_xifexpression));
              _xblockexpression_1 = map4;
            }
            return _xblockexpression_1;
          };
          return IterableExtensions.<Integer, HashMap<CoordinateState, Integer>>fold(new ExclusiveRange(0, 5, true), map3, _function_2);
        };
        _xblockexpression = IterableExtensions.<Integer, HashMap<CoordinateState, Integer>>fold(new ExclusiveRange(0, 5, true), map2, _function_1);
      }
      return _xblockexpression;
    };
    return IterableExtensions.<Integer, HashMap<CoordinateState, Integer>>fold(new ExclusiveRange(0, Launcher.max_value_small, true), map1, _function);
  }));

  public static void main(final String[] args) {
    final long timer = System.currentTimeMillis();
    CoordinateState _coordinateState = new CoordinateState(0, 0);
    InputOutput.<Integer>println(new AStar(_coordinateState).run().getMinDistance());
    long _currentTimeMillis = System.currentTimeMillis();
    long _minus = (_currentTimeMillis - timer);
    String _plus = ("Result computed in " + Long.valueOf(_minus));
    String _plus_1 = (_plus + "ms");
    InputOutput.<String>println(_plus_1);
  }
}
