package advent2024;

import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.function.BiFunction;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day23 {
  public static void main(final String[] args) {
    List<String> _inputs = new InputLoader(Integer.valueOf(2024), Integer.valueOf(23)).getInputs();
    HashMap<String, HashSet<String>> _newHashMap = CollectionLiterals.<String, HashSet<String>>newHashMap();
    ArrayList<HashSet<String>> _newArrayList = CollectionLiterals.<HashSet<String>>newArrayList();
    Pair<HashMap<String, HashSet<String>>, ArrayList<HashSet<String>>> _mappedTo = Pair.<HashMap<String, HashSet<String>>, ArrayList<HashSet<String>>>of(_newHashMap, _newArrayList);
    final Function2<Pair<HashMap<String, HashSet<String>>, ArrayList<HashSet<String>>>, String, Pair<HashMap<String, HashSet<String>>, ArrayList<HashSet<String>>>> _function = (Pair<HashMap<String, HashSet<String>>, ArrayList<HashSet<String>>> acc, String el) -> {
      Pair<HashMap<String, HashSet<String>>, ArrayList<HashSet<String>>> _xblockexpression = null;
      {
        final String[] split = el.split("-");
        final String e1 = split[0];
        final String e2 = split[1];
        final BiFunction<HashSet<String>, HashSet<String>, HashSet<String>> _function_1 = (HashSet<String> x, HashSet<String> y) -> {
          HashSet<String> _xblockexpression_1 = null;
          {
            x.addAll(y);
            _xblockexpression_1 = x;
          }
          return _xblockexpression_1;
        };
        acc.getKey().merge(e1, CollectionLiterals.<String>newHashSet(e2), _function_1);
        final BiFunction<HashSet<String>, HashSet<String>, HashSet<String>> _function_2 = (HashSet<String> x, HashSet<String> y) -> {
          HashSet<String> _xblockexpression_1 = null;
          {
            x.addAll(y);
            _xblockexpression_1 = x;
          }
          return _xblockexpression_1;
        };
        acc.getKey().merge(e2, CollectionLiterals.<String>newHashSet(e1), _function_2);
        acc.getValue().add(CollectionLiterals.<String>newHashSet(e1, e2));
        _xblockexpression = acc;
      }
      return _xblockexpression;
    };
    final Pair<HashMap<String, HashSet<String>>, ArrayList<HashSet<String>>> pairs = IterableExtensions.<String, Pair<HashMap<String, HashSet<String>>, ArrayList<HashSet<String>>>>fold(_inputs, _mappedTo, _function);
    Set<String> _keySet = pairs.getKey().keySet();
    final ArrayList<String> all_ids = new ArrayList<String>(_keySet);
    final HashSet<Set<String>> all_triplets = CollectionLiterals.<Set<String>>newHashSet();
    int _size = all_ids.size();
    ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, _size, true);
    for (final Integer i : _doubleDotLessThan) {
      {
        final String e1 = all_ids.get((i).intValue());
        int _size_1 = all_ids.size();
        ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(((i).intValue() + 1), _size_1, true);
        for (final Integer j : _doubleDotLessThan_1) {
          {
            final String e2 = all_ids.get((j).intValue());
            int _size_2 = all_ids.size();
            ExclusiveRange _doubleDotLessThan_2 = new ExclusiveRange(((j).intValue() + 1), _size_2, true);
            for (final Integer k : _doubleDotLessThan_2) {
              {
                final String e3 = all_ids.get((k).intValue());
                if (((pairs.getKey().get(e1).contains(e2) && pairs.getKey().get(e1).contains(e3)) && 
                  pairs.getKey().get(e2).contains(e3))) {
                  if (((e1.startsWith("t") || e2.startsWith("t")) || e3.startsWith("t"))) {
                    all_triplets.add(Collections.<String>unmodifiableSet(CollectionLiterals.<String>newHashSet(e1, e2, e3)));
                  }
                }
              }
            }
          }
        }
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(all_triplets.size()));
    int _size_1 = pairs.getValue().size();
    ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(0, _size_1, true);
    for (final Integer i_1 : _doubleDotLessThan_1) {
      int _size_2 = pairs.getValue().size();
      ExclusiveRange _doubleDotLessThan_2 = new ExclusiveRange(((i_1).intValue() + 1), _size_2, true);
      for (final Integer j : _doubleDotLessThan_2) {
        final Function1<String, Boolean> _function_1 = (String e1) -> {
          final Function1<String, Boolean> _function_2 = (String e2) -> {
            return Boolean.valueOf((Objects.equals(e2, e1) || pairs.getKey().get(e1).contains(e2)));
          };
          return Boolean.valueOf(IterableExtensions.<String>forall(pairs.getValue().get((j).intValue()), _function_2));
        };
        boolean _forall = IterableExtensions.<String>forall(pairs.getValue().get((i_1).intValue()), _function_1);
        if (_forall) {
          pairs.getValue().get((j).intValue()).addAll(pairs.getValue().get((i_1).intValue()));
        }
      }
    }
    final Function1<HashSet<String>, Integer> _function_2 = (HashSet<String> it) -> {
      return Integer.valueOf(it.size());
    };
    InputOutput.<String>println(IterableExtensions.join(IterableExtensions.<String>sort(IterableExtensions.<HashSet<String>, Integer>maxBy(pairs.getValue(), _function_2)), ","));
  }
}
