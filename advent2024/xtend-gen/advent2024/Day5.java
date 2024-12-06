package advent2024;

import adventutils.input.InputLoader;
import com.google.common.collect.Iterables;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day5 {
  public static void main(final String[] args) {
    final List<String> inputs = new InputLoader(Integer.valueOf(2024), Integer.valueOf(5)).getInputs();
    final int emptyInput = inputs.indexOf("");
    final List<String> rules = inputs.subList(0, emptyInput);
    final HashMap<Integer, HashSet<Integer>> ruleMap = CollectionLiterals.<Integer, HashSet<Integer>>newHashMap();
    final Consumer<String> _function = (String it) -> {
      final String[] split = it.split("\\|");
      final int left = Integer.parseInt(split[0]);
      final int right = Integer.parseInt(split[1]);
      final HashSet<Integer> present = ruleMap.getOrDefault(Integer.valueOf(left), CollectionLiterals.<Integer>newHashSet());
      present.add(Integer.valueOf(right));
      ruleMap.put(Integer.valueOf(left), present);
    };
    rules.forEach(_function);
    final Function1<String, List<Integer>> _function_1 = (String it) -> {
      final Function1<String, Integer> _function_2 = (String el) -> {
        return Integer.valueOf(Integer.parseInt(el));
      };
      return ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray(it.split(","))), _function_2);
    };
    final List<List<Integer>> changes = ListExtensions.<String, List<Integer>>map(inputs.subList((emptyInput + 1), inputs.size()), _function_1);
    HashSet<List<Integer>> _newHashSet = CollectionLiterals.<List<Integer>>newHashSet();
    Pair<Integer, HashSet<List<Integer>>> _mappedTo = Pair.<Integer, HashSet<List<Integer>>>of(Integer.valueOf(0), _newHashSet);
    final Function2<Pair<Integer, HashSet<List<Integer>>>, List<Integer>, Pair<Integer, HashSet<List<Integer>>>> _function_2 = (Pair<Integer, HashSet<List<Integer>>> acc, List<Integer> el) -> {
      Pair<Integer, HashSet<List<Integer>>> _xifexpression = null;
      int _size = el.size();
      final Function2<Boolean, Integer, Boolean> _function_3 = (Boolean acc1, Integer i) -> {
        return Boolean.valueOf(((acc1).booleanValue() && (IterableExtensions.<Integer, Boolean>fold(new ExclusiveRange(((i).intValue() + 1), el.size(), true), Boolean.valueOf(true), ((Function2<Boolean, Integer, Boolean>) (Boolean acc2, Integer j) -> {
          return Boolean.valueOf(((acc2).booleanValue() && ruleMap.get(el.get((i).intValue())).contains(el.get((j).intValue()))));
        }))).booleanValue()));
      };
      Boolean _fold = IterableExtensions.<Integer, Boolean>fold(new ExclusiveRange(0, _size, true), Boolean.valueOf(true), _function_3);
      if ((boolean) _fold) {
        Integer _key = acc.getKey();
        int _size_1 = el.size();
        int _divide = (_size_1 / 2);
        Integer _get = el.get(_divide);
        int _plus = ((_key).intValue() + (_get).intValue());
        HashSet<List<Integer>> _value = acc.getValue();
        _xifexpression = Pair.<Integer, HashSet<List<Integer>>>of(Integer.valueOf(_plus), _value);
      } else {
        Pair<Integer, HashSet<List<Integer>>> _xblockexpression = null;
        {
          acc.getValue().add(el);
          _xblockexpression = acc;
        }
        _xifexpression = _xblockexpression;
      }
      return _xifexpression;
    };
    final Pair<Integer, HashSet<List<Integer>>> sum1AndIncorrect = IterableExtensions.<List<Integer>, Pair<Integer, HashSet<List<Integer>>>>fold(changes, _mappedTo, _function_2);
    InputOutput.<Integer>println(sum1AndIncorrect.getKey());
    final Function2<Integer, List<Integer>, Integer> _function_3 = (Integer acc, List<Integer> el) -> {
      int _xblockexpression = (int) 0;
      {
        final HashSet<Integer> toOrder = CollectionLiterals.<Integer>newHashSet();
        Iterables.<Integer>addAll(toOrder, el);
        final ArrayList<Integer> ordered = CollectionLiterals.<Integer>newArrayList();
        while ((!toOrder.isEmpty())) {
          {
            final Function1<Integer, Boolean> _function_4 = (Integer el1) -> {
              boolean _xblockexpression_1 = false;
              {
                final HashSet<Integer> currentMap = ruleMap.get(el1);
                final Function1<Integer, Boolean> _function_5 = (Integer el2) -> {
                  return Boolean.valueOf((Objects.equals(el1, el2) || currentMap.contains(el2)));
                };
                _xblockexpression_1 = IterableExtensions.<Integer>forall(toOrder, _function_5);
              }
              return Boolean.valueOf(_xblockexpression_1);
            };
            final Integer next = IterableExtensions.<Integer>findFirst(toOrder, _function_4);
            ordered.add(next);
            toOrder.remove(next);
          }
        }
        int _size = ordered.size();
        int _divide = (_size / 2);
        Integer _get = ordered.get(_divide);
        _xblockexpression = ((acc).intValue() + (_get).intValue());
      }
      return Integer.valueOf(_xblockexpression);
    };
    InputOutput.<Integer>println(IterableExtensions.<List<Integer>, Integer>fold(sum1AndIncorrect.getValue(), Integer.valueOf(0), _function_3));
  }
}
