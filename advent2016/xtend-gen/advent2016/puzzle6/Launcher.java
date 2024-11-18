package advent2016.puzzle6;

import adventutils.input.InputLoader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.BiFunction;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Launcher {
  public static void main(final String[] args) {
    String ans1 = "";
    String ans2 = "";
    final Function1<String, char[]> _function = (String it) -> {
      return it.toCharArray();
    };
    final List<char[]> input = new InputLoader(Integer.valueOf(2016), Integer.valueOf(6)).<char[]>getInputs(_function);
    int _size = ((List<Character>)Conversions.doWrapArray(input.get(0))).size();
    ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, _size, true);
    for (final Integer j : _doubleDotLessThan) {
      {
        final HashMap<Character, Integer> map = new HashMap<Character, Integer>();
        int _size_1 = input.size();
        ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(0, _size_1, true);
        for (final Integer i : _doubleDotLessThan_1) {
          final BiFunction<Integer, Integer, Integer> _function_1 = (Integer u, Integer v) -> {
            return Integer.valueOf(((u).intValue() + (v).intValue()));
          };
          map.merge(Character.valueOf(input.get((i).intValue())[(j).intValue()]), Integer.valueOf(1), _function_1);
        }
        final Function1<Map.Entry<Character, Integer>, Integer> _function_2 = (Map.Entry<Character, Integer> it) -> {
          return it.getValue();
        };
        final List<Map.Entry<Character, Integer>> ansTmp = IterableExtensions.<Map.Entry<Character, Integer>, Integer>sortBy(map.entrySet(), _function_2);
        String _ans1 = ans1;
        Character _key = ansTmp.getLast().getKey();
        ans1 = (_ans1 + _key);
        String _ans2 = ans2;
        Character _key_1 = ansTmp.get(0).getKey();
        ans2 = (_ans2 + _key_1);
      }
    }
    InputOutput.<String>println(ans1);
    InputOutput.<String>println(ans2);
  }
}
