package advent2024;

import adventutils.input.InputLoader;
import java.util.HashSet;
import java.util.List;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day7 {
  public static void main(final String[] args) {
    final Function1<String, List<Long>> _function = (String it) -> {
      final Function1<String, Long> _function_1 = (String it_1) -> {
        return Long.valueOf(Long.parseLong(it_1));
      };
      return ListExtensions.<String, Long>map(((List<String>)Conversions.doWrapArray(it.split(":? "))), _function_1);
    };
    final List<List<Long>> inputs = ListExtensions.<String, List<Long>>map(new InputLoader(Integer.valueOf(2024), Integer.valueOf(7)).getInputs(), _function);
    Pair<Long, Long> _mappedTo = Pair.<Long, Long>of(Long.valueOf(0L), Long.valueOf(0L));
    final Function2<Pair<Long, Long>, List<Long>, Pair<Long, Long>> _function_1 = (Pair<Long, Long> acc, List<Long> el) -> {
      Pair<Long, Long> _xblockexpression = null;
      {
        final Long target = el.get(0);
        final Long seed = el.get(1);
        final Iterable<Long> numbers = IterableExtensions.<Long>drop(el, 2);
        final Function2<HashSet<Long>, Long, HashSet<Long>> _function_2 = (HashSet<Long> total, Long current) -> {
          HashSet<Long> _xblockexpression_1 = null;
          {
            final HashSet<Long> res = CollectionLiterals.<Long>newHashSet();
            final Consumer<Long> _function_3 = (Long it) -> {
              res.add(Long.valueOf(((it).longValue() + (current).longValue())));
              res.add(Long.valueOf(((it).longValue() * (current).longValue())));
            };
            total.forEach(_function_3);
            _xblockexpression_1 = res;
          }
          return _xblockexpression_1;
        };
        HashSet<Long> candidates = IterableExtensions.<Long, HashSet<Long>>fold(numbers, CollectionLiterals.<Long>newHashSet(seed), _function_2);
        Pair<Long, Long> _xifexpression = null;
        boolean _contains = candidates.contains(target);
        if (_contains) {
          Long _key = acc.getKey();
          long _plus = ((_key).longValue() + (target).longValue());
          Long _value = acc.getValue();
          _xifexpression = Pair.<Long, Long>of(Long.valueOf(_plus), _value);
        } else {
          Pair<Long, Long> _xblockexpression_1 = null;
          {
            final Function2<HashSet<Long>, Long, HashSet<Long>> _function_3 = (HashSet<Long> total, Long current) -> {
              HashSet<Long> _xblockexpression_2 = null;
              {
                final HashSet<Long> res = CollectionLiterals.<Long>newHashSet();
                final Consumer<Long> _function_4 = (Long it) -> {
                  res.add(Long.valueOf(((it).longValue() + (current).longValue())));
                  res.add(Long.valueOf(((it).longValue() * (current).longValue())));
                  res.add(Long.valueOf(Long.parseLong((("" + it) + current))));
                };
                total.forEach(_function_4);
                _xblockexpression_2 = res;
              }
              return _xblockexpression_2;
            };
            candidates = IterableExtensions.<Long, HashSet<Long>>fold(numbers, CollectionLiterals.<Long>newHashSet(seed), _function_3);
            Long _key_1 = acc.getKey();
            Long _value_1 = acc.getValue();
            Long _xifexpression_1 = null;
            boolean _contains_1 = candidates.contains(target);
            if (_contains_1) {
              _xifexpression_1 = target;
            } else {
              _xifexpression_1 = Long.valueOf(0L);
            }
            long _plus_1 = ((_value_1).longValue() + (_xifexpression_1).longValue());
            _xblockexpression_1 = Pair.<Long, Long>of(_key_1, Long.valueOf(_plus_1));
          }
          _xifexpression = _xblockexpression_1;
        }
        _xblockexpression = _xifexpression;
      }
      return _xblockexpression;
    };
    final Pair<Long, Long> res1 = IterableExtensions.<List<Long>, Pair<Long, Long>>fold(inputs, _mappedTo, _function_1);
    InputOutput.<Long>println(res1.getKey());
    Long _key = res1.getKey();
    Long _value = res1.getValue();
    long _plus = ((_key).longValue() + (_value).longValue());
    InputOutput.<Long>println(Long.valueOf(_plus));
  }
}
