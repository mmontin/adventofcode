package advent2021.puzzle9;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Launcher {
  public static void main(final String[] args) {
    final Function2<ArrayList<List<Integer>>, String, ArrayList<List<Integer>>> _function = (ArrayList<List<Integer>> l, String v) -> {
      ArrayList<List<Integer>> _xblockexpression = null;
      {
        final Function1<Character, Integer> _function_1 = (Character it) -> {
          String _plus = (it + "");
          return Integer.valueOf(Integer.parseInt(_plus));
        };
        l.add(ListExtensions.<Character, Integer>map(IterableExtensions.<Character>toList(((Iterable<Character>)Conversions.doWrapArray(v.toCharArray()))), _function_1));
        _xblockexpression = l;
      }
      return _xblockexpression;
    };
    ArrayList<List<Integer>> _fold = IterableExtensions.<String, ArrayList<List<Integer>>>fold(new InputLoader(Integer.valueOf(2021), Integer.valueOf(9)).getInputs(), CollectionLiterals.<List<Integer>>newArrayList(), _function);
    final Area m = new Area(_fold);
    final Function2<Integer, Coordinate, Integer> _function_1 = (Integer v, Coordinate e) -> {
      Integer _get = m.get(e);
      return Integer.valueOf((((v).intValue() + 1) + (_get).intValue()));
    };
    InputOutput.<Integer>println(IterableExtensions.<Coordinate, Integer>fold(m.lowPoints(), Integer.valueOf(0), _function_1));
    final Function2<ArrayList<Integer>, Coordinate, ArrayList<Integer>> _function_2 = (ArrayList<Integer> l, Coordinate c) -> {
      ArrayList<Integer> _xblockexpression = null;
      {
        l.add(Integer.valueOf(m.floodUpToMaximum(c)));
        _xblockexpression = l;
      }
      return _xblockexpression;
    };
    final List<Integer> basins = ListExtensions.<Integer>reverse(IterableExtensions.<Integer>sort(IterableExtensions.<Coordinate, ArrayList<Integer>>fold(m.lowPoints(), CollectionLiterals.<Integer>newArrayList(), _function_2)));
    Integer _get = basins.get(0);
    Integer _get_1 = basins.get(1);
    int _multiply = ((_get).intValue() * (_get_1).intValue());
    Integer _get_2 = basins.get(2);
    int _multiply_1 = (_multiply * (_get_2).intValue());
    InputOutput.<Integer>println(Integer.valueOf(_multiply_1));
  }
}
