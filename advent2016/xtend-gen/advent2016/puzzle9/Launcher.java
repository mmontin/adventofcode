package advent2016.puzzle9;

import adventutils.input.InputLoader;
import java.util.Map;
import java.util.Set;
import java.util.function.BiFunction;
import java.util.function.Consumer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Launcher {
  public static void main(final String[] args) {
    String toProcess = new InputLoader(Integer.valueOf(2016), Integer.valueOf(9)).getInputs().get(0);
    final Pattern pattern = Pattern.compile("\\([^\\)]*\\)");
    final Matcher matcher = pattern.matcher(toProcess);
    final Set<Integer> indexes_to_ignore = CollectionLiterals.<Integer>newHashSet();
    final Map<Integer, Integer> multipliers = CollectionLiterals.<Integer, Integer>newHashMap();
    while (matcher.find()) {
      {
        final String[] split = toProcess.substring(matcher.start(), matcher.end()).split("x");
        int length = Integer.parseInt((split[0]).substring(1));
        int _start = matcher.start();
        int _end = matcher.end();
        final Consumer<Integer> _function = new Consumer<Integer>() {
          public void accept(final Integer it) {
            indexes_to_ignore.add(it);
          }
        };
        new ExclusiveRange(_start, _end, true).forEach(_function);
        int _end_1 = matcher.end();
        int _end_2 = matcher.end();
        int _plus = (_end_2 + length);
        final Consumer<Integer> _function_1 = new Consumer<Integer>() {
          public void accept(final Integer it) {
            int _length = (split[1]).length();
            int _minus = (_length - 1);
            final BiFunction<Integer, Integer, Integer> _function = new BiFunction<Integer, Integer, Integer>() {
              public Integer apply(final Integer u, final Integer v) {
                return Integer.valueOf(((u).intValue() * (v).intValue()));
              }
            };
            multipliers.merge(it, Integer.valueOf(Integer.parseInt((split[1]).substring(0, _minus))), _function);
          }
        };
        new ExclusiveRange(_end_1, _plus, true).forEach(_function_1);
      }
    }
    int _length = toProcess.length();
    final Function2<Long, Integer, Long> _function = new Function2<Long, Integer, Long>() {
      public Long apply(final Long sum, final Integer i) {
        Integer _xifexpression = null;
        boolean _contains = indexes_to_ignore.contains(i);
        if (_contains) {
          _xifexpression = Integer.valueOf(0);
        } else {
          _xifexpression = multipliers.getOrDefault(i, Integer.valueOf(1));
        }
        return Long.valueOf(((sum).longValue() + (_xifexpression).intValue()));
      }
    };
    InputOutput.<Long>println(IterableExtensions.<Integer, Long>fold(new ExclusiveRange(0, _length, true), Long.valueOf(0L), _function));
  }
}
