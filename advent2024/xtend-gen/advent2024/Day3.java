package advent2024;

import adventutils.input.InputLoader;
import java.util.List;
import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Day3 {
  public static void main(final String[] args) {
    final String input = IterableExtensions.join(new InputLoader(Integer.valueOf(2024), Integer.valueOf(3)).getInputs());
    final Matcher matcher = Pattern.compile("mul\\([0-9]+,[0-9]+\\)").matcher(input);
    int total = 0;
    while (matcher.find()) {
      {
        String current = matcher.group();
        int _length = current.length();
        int _minus = (_length - 1);
        current = current.substring(4, _minus);
        final Function1<String, Integer> _function = (String it) -> {
          return Integer.valueOf(Integer.parseInt(it));
        };
        final List<Integer> pair = ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray(current.split(","))), _function);
        int _tal = total;
        Integer _get = pair.get(0);
        Integer _get_1 = pair.get(1);
        int _multiply = ((_get).intValue() * (_get_1).intValue());
        total = (_tal + _multiply);
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(total));
    final Matcher matcher2 = Pattern.compile("(mul\\([0-9]+,[0-9]+\\))|(do\\(\\))|(don\'t\\(\\))").matcher(input);
    int total2 = 0;
    boolean enabled = true;
    while (matcher2.find()) {
      {
        String current = matcher2.group();
        boolean _matched = false;
        if (Objects.equals(current, "do()")) {
          _matched=true;
          enabled = true;
        }
        if (!_matched) {
          if (Objects.equals(current, "don\'t()")) {
            _matched=true;
            enabled = false;
          }
        }
        if (!_matched) {
          if (enabled) {
            _matched=true;
            int _length = current.length();
            int _minus = (_length - 1);
            current = current.substring(4, _minus);
            final Function1<String, Integer> _function = (String it) -> {
              return Integer.valueOf(Integer.parseInt(it));
            };
            final List<Integer> pair = ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray(current.split(","))), _function);
            int _tal2 = total2;
            Integer _get = pair.get(0);
            Integer _get_1 = pair.get(1);
            int _multiply = ((_get).intValue() * (_get_1).intValue());
            total2 = (_tal2 + _multiply);
          }
        }
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(total2));
  }
}
