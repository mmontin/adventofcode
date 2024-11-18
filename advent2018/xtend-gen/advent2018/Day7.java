package advent2018;

import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day7 {
  public static void main(final String[] args) {
    final Function1<String, Pair<String, String>> _function = (String it) -> {
      Pair<String, String> _xblockexpression = null;
      {
        final String[] split = it.split(" ");
        String _get = split[1];
        String _get_1 = split[7];
        _xblockexpression = Pair.<String, String>of(_get, _get_1);
      }
      return _xblockexpression;
    };
    final List<Pair<String, String>> dependencies = new InputLoader(Integer.valueOf(2018), Integer.valueOf(7)).<Pair<String, String>>getInputs(_function);
    final Function2<HashSet<String>, Pair<String, String>, HashSet<String>> _function_1 = (HashSet<String> acc, Pair<String, String> v) -> {
      HashSet<String> _xblockexpression = null;
      {
        acc.add(v.getKey());
        acc.add(v.getValue());
        _xblockexpression = acc;
      }
      return _xblockexpression;
    };
    final HashSet<String> letters = IterableExtensions.<Pair<String, String>, HashSet<String>>fold(dependencies, CollectionLiterals.<String>newHashSet(), _function_1);
    final ArrayList<Object> completed = CollectionLiterals.<Object>newArrayList();
    while ((!letters.isEmpty())) {
      {
        final Function1<String, Boolean> _function_2 = (String step) -> {
          final Function1<Pair<String, String>, Boolean> _function_3 = (Pair<String, String> it) -> {
            String _value = it.getValue();
            return Boolean.valueOf(Objects.equals(_value, step));
          };
          final Function2<Boolean, Pair<String, String>, Boolean> _function_4 = (Boolean acc, Pair<String, String> v) -> {
            return Boolean.valueOf(((acc).booleanValue() && completed.contains(v.getKey())));
          };
          return IterableExtensions.<Pair<String, String>, Boolean>fold(IterableExtensions.<Pair<String, String>>filter(dependencies, _function_3), Boolean.valueOf(true), _function_4);
        };
        String next = IterableExtensions.<String>head(IterableExtensions.<String>sort(IterableExtensions.<String>filter(letters, _function_2)));
        letters.remove(next);
        completed.add(next);
      }
    }
    InputOutput.<String>println(IterableExtensions.join(completed));
    final Function2<HashSet<String>, Pair<String, String>, HashSet<String>> _function_2 = (HashSet<String> acc, Pair<String, String> v) -> {
      HashSet<String> _xblockexpression = null;
      {
        acc.add(v.getKey());
        acc.add(v.getValue());
        _xblockexpression = acc;
      }
      return _xblockexpression;
    };
    final HashSet<String> letters_2 = IterableExtensions.<Pair<String, String>, HashSet<String>>fold(dependencies, CollectionLiterals.<String>newHashSet(), _function_2);
    final ArrayList<String> completed_2 = CollectionLiterals.<String>newArrayList();
    final HashMap<String, Integer> inProgress = CollectionLiterals.<String, Integer>newHashMap();
    int time = 0;
    while ((!letters_2.isEmpty())) {
      {
        final Function1<String, Boolean> _function_3 = (String step) -> {
          final Function1<Pair<String, String>, Boolean> _function_4 = (Pair<String, String> it) -> {
            String _value = it.getValue();
            return Boolean.valueOf(Objects.equals(_value, step));
          };
          final Function2<Boolean, Pair<String, String>, Boolean> _function_5 = (Boolean acc, Pair<String, String> v) -> {
            return Boolean.valueOf(((acc).booleanValue() && completed_2.contains(v.getKey())));
          };
          return IterableExtensions.<Pair<String, String>, Boolean>fold(IterableExtensions.<Pair<String, String>>filter(dependencies, _function_4), Boolean.valueOf(true), _function_5);
        };
        List<String> _sort = IterableExtensions.<String>sort(IterableExtensions.<String>filter(letters_2, _function_3));
        int _size = inProgress.size();
        int _minus = (5 - _size);
        final Consumer<String> _function_4 = (String it) -> {
          letters_2.remove(it);
          char _charAt = it.charAt(0);
          int _minus_1 = (((int) _charAt) - 4);
          inProgress.put(it, Integer.valueOf(_minus_1));
        };
        IterableExtensions.<String>take(_sort, _minus).forEach(_function_4);
        final Function1<Map.Entry<String, Integer>, Integer> _function_5 = (Map.Entry<String, Integer> it) -> {
          return it.getValue();
        };
        final Function1<Map.Entry<Integer, List<Map.Entry<String, Integer>>>, Integer> _function_6 = (Map.Entry<Integer, List<Map.Entry<String, Integer>>> it) -> {
          return it.getKey();
        };
        final Map.Entry<Integer, List<Map.Entry<String, Integer>>> next_craftables = IterableExtensions.<Map.Entry<Integer, List<Map.Entry<String, Integer>>>, Integer>minBy(IterableExtensions.<Integer, Map.Entry<String, Integer>>groupBy(inProgress.entrySet(), _function_5).entrySet(), _function_6);
        int _time = time;
        Integer _key = next_craftables.getKey();
        time = (_time + (_key).intValue());
        final Consumer<Map.Entry<String, Integer>> _function_7 = (Map.Entry<String, Integer> it) -> {
          completed_2.add(it.getKey());
          inProgress.remove(it.getKey());
        };
        next_craftables.getValue().forEach(_function_7);
        final Consumer<String> _function_8 = (String it) -> {
          Integer _get = inProgress.get(it);
          Integer _key_1 = next_craftables.getKey();
          int _minus_1 = ((_get).intValue() - (_key_1).intValue());
          inProgress.put(it, Integer.valueOf(_minus_1));
        };
        inProgress.keySet().forEach(_function_8);
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(time));
  }
}
