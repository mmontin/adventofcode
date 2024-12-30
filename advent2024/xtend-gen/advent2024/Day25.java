package advent2024;

import adventutils.collection.ListUtils;
import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Day25 {
  private static List<List<Integer>> keys = CollectionLiterals.<List<Integer>>newArrayList();

  private static List<List<Integer>> locks = CollectionLiterals.<List<Integer>>newArrayList();

  public static void main(final String[] args) {
    final Function1<String, List<String>> _function = (String it) -> {
      final Function1<Character, String> _function_1 = (Character it_1) -> {
        return (it_1 + "");
      };
      return ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray(it.toCharArray())), _function_1);
    };
    final List<List<String>> input = ListExtensions.<String, List<String>>map(new InputLoader(Integer.valueOf(2024), Integer.valueOf(25)).getInputs(), _function);
    {
      int i = 0;
      int _size = input.size();
      boolean _lessThan = (i < _size);
      boolean _while = _lessThan;
      while (_while) {
        {
          final List<List<String>> subl = input.subList(i, (i + 7));
          List<List<Integer>> _xifexpression = null;
          String _join = IterableExtensions.join(subl.get(0));
          boolean _equals = Objects.equals(_join, ".....");
          if (_equals) {
            _xifexpression = Day25.locks;
          } else {
            _xifexpression = Day25.keys;
          }
          final Function2<ArrayList<Integer>, Integer, ArrayList<Integer>> _function_1 = (ArrayList<Integer> acc, Integer j) -> {
            final Function1<Integer, Boolean> _function_2 = (Integer it) -> {
              String _get = subl.get((it).intValue()).get((j).intValue());
              return Boolean.valueOf(Objects.equals(_get, "#"));
            };
            return ListUtils.<Integer, ArrayList<Integer>>cons(Integer.valueOf(IterableExtensions.size(IterableExtensions.<Integer>filter(new IntegerRange(0, 6), _function_2))), acc);
          };
          _xifexpression.add(IterableExtensions.<Integer, ArrayList<Integer>>fold(new IntegerRange(0, 4), CollectionLiterals.<Integer>newArrayList(), _function_1));
        }
        int _i = i;
        i = (_i + 8);
        int _size_1 = input.size();
        boolean _lessThan_1 = (i < _size_1);
        _while = _lessThan_1;
      }
    }
    final Function2<Integer, List<Integer>, Integer> _function_1 = (Integer acc, List<Integer> key) -> {
      final Function1<List<Integer>, Boolean> _function_2 = (List<Integer> lock) -> {
        final Function2<Boolean, Integer, Boolean> _function_3 = (Boolean acc1, Integer el) -> {
          return Boolean.valueOf(((acc1).booleanValue() && (((key.get((el).intValue())).intValue() + (lock.get((el).intValue())).intValue()) <= 7)));
        };
        return IterableExtensions.<Integer, Boolean>fold(new IntegerRange(0, 4), Boolean.valueOf(true), _function_3);
      };
      int _size = IterableExtensions.size(IterableExtensions.<List<Integer>>filter(Day25.locks, _function_2));
      return Integer.valueOf(((acc).intValue() + _size));
    };
    InputOutput.<Integer>println(IterableExtensions.<List<Integer>, Integer>fold(Day25.keys, Integer.valueOf(0), _function_1));
  }
}
