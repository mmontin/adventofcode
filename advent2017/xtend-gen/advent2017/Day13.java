package advent2017;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

import adventutils.input.InputLoader;

@SuppressWarnings("all")
public class Day13 {
  private static final Map<Integer, Integer> firewalls = IterableExtensions.<String, HashMap<Integer, Integer>>fold(new InputLoader(Integer.valueOf(2017), Integer.valueOf(13)).getInputs(), CollectionLiterals.<Integer, Integer>newHashMap(), new Function2<HashMap<Integer, Integer>, String, HashMap<Integer, Integer>>() {
    public HashMap<Integer, Integer> apply(final HashMap<Integer, Integer> acc, final String line) {
      HashMap<Integer, Integer> _xblockexpression = null;
      {
        final Function1<String, Integer> _function = new Function1<String, Integer>() {
          public Integer apply(final String it) {
            return Integer.valueOf(Integer.parseInt(it));
          }
        };
        final List<Integer> split = ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray(line.split(": "))), _function);
        acc.put(split.get(0), split.get(1));
        _xblockexpression = acc;
      }
      return _xblockexpression;
    }
  });

  private static final int last_layer = (int) IterableExtensions.<Integer>max(Day13.firewalls.keySet());

  public static void main(final String[] args) {
    int score = 0;
    int position = 0;
    while ((position <= Day13.last_layer)) {
      {
        boolean _containsKey = Day13.firewalls.containsKey(Integer.valueOf(position));
        if (_containsKey) {
          final Integer current_size = Day13.firewalls.get(Integer.valueOf(position));
          int _scanner_depth = Day13.scanner_depth((current_size).intValue(), position);
          boolean _equals = (_scanner_depth == 0);
          if (_equals) {
            int _score = score;
            score = (_score + (position * (current_size).intValue()));
          }
        }
        position++;
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(score));
    int delay = 0;
    while ((!Day13.valid(delay))) {
      delay++;
    }
    InputOutput.<Integer>println(Integer.valueOf(delay));
  }

  public static int scanner_depth(final int depth, final int time) {
    int _xblockexpression = (int) 0;
    {
      final int possible_depths = ((depth - 1) * 2);
      int scanner_depth = (time % possible_depths);
      if ((scanner_depth >= depth)) {
        scanner_depth = (possible_depths - scanner_depth);
      }
      _xblockexpression = scanner_depth;
    }
    return _xblockexpression;
  }

  public static boolean valid(final int delay) {
    final Function2<Boolean, Map.Entry<Integer, Integer>, Boolean> _function = new Function2<Boolean, Map.Entry<Integer, Integer>, Boolean>() {
      public Boolean apply(final Boolean acc, final Map.Entry<Integer, Integer> firewall) {
        return Boolean.valueOf(((acc).booleanValue() && (Day13.scanner_depth((firewall.getValue()).intValue(), (delay + (firewall.getKey()).intValue())) != 0)));
      }
    };
    return (boolean) IterableExtensions.<Map.Entry<Integer, Integer>, Boolean>fold(Day13.firewalls.entrySet(), Boolean.valueOf(true), _function);
  }
}
