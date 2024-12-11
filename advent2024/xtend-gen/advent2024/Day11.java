package advent2024;

import adventutils.input.InputLoader;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.function.BiFunction;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day11 {
  public static void main(final String[] args) {
    final Function1<String, Long> _function = (String it) -> {
      return Long.valueOf(Long.parseLong((it + "")));
    };
    final List<Long> input = ListExtensions.<String, Long>map(((List<String>)Conversions.doWrapArray(new InputLoader(Integer.valueOf(2024), Integer.valueOf(11)).getInputs().get(0).split(" "))), _function);
    final Function1<Long, Pair<Long, Long>> _function_1 = (Long it) -> {
      return Pair.<Long, Long>of(it, Long.valueOf(1L));
    };
    HashMap<Long, Long> list = CollectionLiterals.<Long, Long>newHashMap(((Pair<? extends Long, ? extends Long>[])Conversions.unwrapArray(ListExtensions.<Long, Pair<Long, Long>>map(input, _function_1), Pair.class)));
    IntegerRange _upTo = new IntegerRange(1, 75);
    for (final Integer i : _upTo) {
      {
        final Function2<HashMap<Long, Long>, Map.Entry<Long, Long>, HashMap<Long, Long>> _function_2 = (HashMap<Long, Long> acc, Map.Entry<Long, Long> el) -> {
          HashMap<Long, Long> _xblockexpression = null;
          {
            final Consumer<Long> _function_3 = (Long it) -> {
              final BiFunction<Long, Long, Long> _function_4 = (Long x, Long y) -> {
                return Long.valueOf(((x).longValue() + (y).longValue()));
              };
              acc.merge(it, el.getValue(), _function_4);
            };
            Day11.next((el.getKey()).longValue()).forEach(_function_3);
            _xblockexpression = acc;
          }
          return _xblockexpression;
        };
        list = IterableExtensions.<Map.Entry<Long, Long>, HashMap<Long, Long>>fold(list.entrySet(), CollectionLiterals.<Long, Long>newHashMap(), _function_2);
        if (((i).intValue() == 25)) {
          final Function2<Long, Long, Long> _function_3 = (Long x, Long y) -> {
            return Long.valueOf(((x).longValue() + (y).longValue()));
          };
          InputOutput.<Long>println(IterableExtensions.<Long>reduce(list.values(), _function_3));
        }
      }
    }
    final Function2<Long, Long, Long> _function_2 = (Long x, Long y) -> {
      return Long.valueOf(((x).longValue() + (y).longValue()));
    };
    InputOutput.<Long>println(IterableExtensions.<Long>reduce(list.values(), _function_2));
  }

  public static List<Long> next(final long l) {
    List<Long> _switchResult = null;
    String _string = Long.valueOf(l).toString();
    final String s = _string;
    boolean _matched = false;
    if (Objects.equals(s, "0")) {
      _matched=true;
      _switchResult = Collections.<Long>unmodifiableList(CollectionLiterals.<Long>newArrayList(Long.valueOf(1L)));
    }
    if (!_matched) {
      int _length = s.length();
      int _modulo = (_length % 2);
      boolean _equals = (_modulo == 0);
      if (_equals) {
        _matched=true;
        List<Long> _xblockexpression = null;
        {
          int _length_1 = s.length();
          final int middle = (_length_1 / 2);
          long _parseLong = Long.parseLong(s.substring(0, middle));
          long _parseLong_1 = Long.parseLong(s.substring(middle, s.length()));
          _xblockexpression = Collections.<Long>unmodifiableList(CollectionLiterals.<Long>newArrayList(Long.valueOf(_parseLong), Long.valueOf(_parseLong_1)));
        }
        _switchResult = _xblockexpression;
      }
    }
    if (!_matched) {
      _switchResult = Collections.<Long>unmodifiableList(CollectionLiterals.<Long>newArrayList(Long.valueOf((l * 2024))));
    }
    return _switchResult;
  }
}
