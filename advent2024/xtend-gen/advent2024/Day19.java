package advent2024;

import adventutils.MemoryRunner;
import adventutils.input.InputLoader;
import java.util.List;
import java.util.function.Function;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Day19 {
  private static List<String> inputs = new InputLoader(Integer.valueOf(2024), Integer.valueOf(19)).getInputs();

  private static List<String> patterns = (List<String>)Conversions.doWrapArray(Day19.inputs.get(0).split(", "));

  public static void main(final String[] args) {
    final Function1<String, Long> _function = (String it) -> {
      return Day19.solver.call(it);
    };
    final Function1<Long, Boolean> _function_1 = (Long it) -> {
      return Boolean.valueOf(((it).longValue() != 0));
    };
    final Iterable<Long> res = IterableExtensions.<Long>filter(IterableExtensions.<String, Long>map(IterableExtensions.<String>drop(Day19.inputs, 2), _function), _function_1);
    InputOutput.<Integer>println(Integer.valueOf(IterableExtensions.size(res)));
    final Function2<Long, Long, Long> _function_2 = (Long x, Long y) -> {
      return Long.valueOf(((x).longValue() + (y).longValue()));
    };
    InputOutput.<Long>println(IterableExtensions.<Long>reduce(res, _function_2));
  }

  private static final MemoryRunner<String, Long> solver = new Function0<MemoryRunner<String, Long>>() {
    @Override
    public MemoryRunner<String, Long> apply() {
      MemoryRunner<String, Long> _xblockexpression = null;
      {
        final MemoryRunner<String, Long> res = new MemoryRunner<String, Long>();
        final Function<String, Long> _function = (String s) -> {
          Long _xifexpression = null;
          boolean _isEmpty = s.isEmpty();
          if (_isEmpty) {
            _xifexpression = Long.valueOf(1L);
          } else {
            final Function2<Long, String, Long> _function_1 = (Long acc, String el) -> {
              long _xifexpression_1 = (long) 0;
              boolean _startsWith = s.startsWith(el);
              if (_startsWith) {
                _xifexpression_1 = (res.call(s.substring(el.length()))).longValue();
              } else {
                _xifexpression_1 = 0;
              }
              return Long.valueOf(((acc).longValue() + _xifexpression_1));
            };
            _xifexpression = IterableExtensions.<String, Long>fold(Day19.patterns, Long.valueOf(0L), _function_1);
          }
          return _xifexpression;
        };
        _xblockexpression = res.bind(_function);
      }
      return _xblockexpression;
    }
  }.apply();
}
