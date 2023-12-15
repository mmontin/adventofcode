package advent2018;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

import adventutils.input.InputLoader;

@SuppressWarnings("all")
public class Day2 {
  public static void main(final String[] args) {
    final Function1<String, List<String>> _function = (String it) -> {
      final Function1<Character, String> _function_1 = (Character it_1) -> {
        return it_1.toString();
      };
      return ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray(it.toCharArray())), _function_1);
    };
    final List<List<String>> input = ListExtensions.<String, List<String>>map(new InputLoader(Integer.valueOf(2018), Integer.valueOf(2)).getInputs(), _function);
    final Function1<List<String>, Map<String, List<String>>> _function_1 = (List<String> it) -> {
      final Function1<String, String> _function_2 = (String it_1) -> {
        return it_1;
      };
      return IterableExtensions.<String, String>groupBy(it, _function_2);
    };
    final List<Map<String, List<String>>> groups = ListExtensions.<List<String>, Map<String, List<String>>>map(input, _function_1);
    final Function1<Map<String, List<String>>, Boolean> _function_2 = (Map<String, List<String>> it) -> {
      final Function1<List<String>, Boolean> _function_3 = (List<String> s) -> {
        int _size = s.size();
        return Boolean.valueOf((_size == 2));
      };
      return Boolean.valueOf(IterableExtensions.<List<String>>exists(it.values(), _function_3));
    };
    final int contains_two = IterableExtensions.size(IterableExtensions.<Map<String, List<String>>>filter(groups, _function_2));
    final Function1<Map<String, List<String>>, Boolean> _function_3 = (Map<String, List<String>> it) -> {
      final Function1<List<String>, Boolean> _function_4 = (List<String> s) -> {
        int _size = s.size();
        return Boolean.valueOf((_size == 3));
      };
      return Boolean.valueOf(IterableExtensions.<List<String>>exists(it.values(), _function_4));
    };
    final int contains_three = IterableExtensions.size(IterableExtensions.<Map<String, List<String>>>filter(groups, _function_3));
    InputOutput.<Integer>println(Integer.valueOf((contains_two * contains_three)));
    int current_pos = 0;
    boolean found = false;
    while ((!found)) {
      {
        final int current_current_pos = current_pos;
        final Function1<List<String>, String> _function_4 = (List<String> it) -> {
          String _xblockexpression = null;
          {
            final ArrayList<String> hm = new ArrayList<String>(it);
            hm.remove(current_current_pos);
            _xblockexpression = IterableExtensions.join(hm);
          }
          return _xblockexpression;
        };
        final Function1<String, String> _function_5 = (String it) -> {
          return it;
        };
        final Function1<List<String>, Boolean> _function_6 = (List<String> it) -> {
          int _size = it.size();
          return Boolean.valueOf((_size == 2));
        };
        final List<String> removed = IterableExtensions.<List<String>>findFirst(IterableExtensions.<String, String>groupBy(ListExtensions.<List<String>, String>map(input, _function_4), _function_5).values(), _function_6);
        if ((removed != null)) {
          found = true;
          InputOutput.<String>println(IterableExtensions.<String>head(removed));
        }
        current_pos++;
      }
    }
  }
}
