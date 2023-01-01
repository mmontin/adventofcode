package advent2017;

import adventutils.input.InputLoader;
import com.google.common.base.Objects;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day23 {
  private static final List<List<String>> commands = ListExtensions.<String, List<String>>map(new InputLoader(Integer.valueOf(2017), Integer.valueOf(23)).getInputs(), new Function1<String, List<String>>() {
    public List<String> apply(final String it) {
      return IterableExtensions.<String>toList(((Iterable<String>)Conversions.doWrapArray(it.split(" "))));
    }
  });

  public static void main(final String[] args) {
    final HashMap<String, Long> registers = CollectionLiterals.<String, Long>newHashMap();
    int position = 0;
    int nb_of_mul = 0;
    while (((position >= 0) && (position < Day23.commands.size()))) {
      {
        Pair<Boolean, Integer> current = Day23.executeThisCommand(Day23.commands.get(position), registers, Integer.valueOf(position));
        position = (current.getValue()).intValue();
        Boolean _key = current.getKey();
        if ((_key).booleanValue()) {
          nb_of_mul++;
        }
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(nb_of_mul));
    int x = 108400;
    int non_prime = 0;
    int f = 0;
    do {
      {
        f = 1;
        double _sqrt = Math.sqrt(x);
        IntegerRange _upTo = new IntegerRange(2, ((int) _sqrt));
        for (final Integer d : _upTo) {
          if (((x % (d).intValue()) == 0)) {
            f = 0;
          }
        }
        if ((f == 0)) {
          non_prime++;
        }
        x = (x + 17);
      }
    } while((x <= 125400));
    InputOutput.<Integer>println(Integer.valueOf(non_prime));
  }

  public static Pair<Boolean, Integer> executeThisCommand(final List<String> l, final Map<String, Long> registers, final Integer position) {
    Pair<Boolean, Integer> _xblockexpression = null;
    {
      int new_position = (position).intValue();
      boolean is_mul = false;
      String _get = l.get(0);
      boolean _matched = false;
      if (Objects.equal(_get, "set")) {
        _matched=true;
        registers.put(l.get(1), Day23.getMeAValue(registers, l.get(2)));
      }
      if (!_matched) {
        if (Objects.equal(_get, "sub")) {
          _matched=true;
          String _get_1 = l.get(1);
          Long _meAValue = Day23.getMeAValue(registers, l.get(1));
          Long _meAValue_1 = Day23.getMeAValue(registers, l.get(2));
          long _minus = ((_meAValue).longValue() - (_meAValue_1).longValue());
          registers.put(_get_1, Long.valueOf(_minus));
        }
      }
      if (!_matched) {
        if (Objects.equal(_get, "mul")) {
          _matched=true;
          is_mul = true;
          String _get_2 = l.get(1);
          Long _meAValue_2 = Day23.getMeAValue(registers, l.get(1));
          Long _meAValue_3 = Day23.getMeAValue(registers, l.get(2));
          long _multiply = ((_meAValue_2).longValue() * (_meAValue_3).longValue());
          registers.put(_get_2, Long.valueOf(_multiply));
        }
      }
      if (!_matched) {
        Long _meAValue_4 = Day23.getMeAValue(registers, l.get(1));
        boolean _notEquals = ((_meAValue_4).longValue() != 0);
        if (_notEquals) {
          int _new_position = new_position;
          Long _meAValue_5 = Day23.getMeAValue(registers, l.get(2));
          long _minus_1 = ((_meAValue_5).longValue() - 1);
          new_position = (_new_position + ((int) _minus_1));
        }
      }
      _xblockexpression = Pair.<Boolean, Integer>of(Boolean.valueOf(is_mul), Integer.valueOf((new_position + 1)));
    }
    return _xblockexpression;
  }

  public static Long getMeAValue(final Map<String, Long> registers, final String s) {
    Long _xtrycatchfinallyexpression = null;
    try {
      long _parseLong = Long.parseLong(s);
      _xtrycatchfinallyexpression = Long.valueOf(_parseLong);
    } catch (final Throwable _t) {
      if (_t instanceof NumberFormatException) {
        Long _xifexpression = null;
        boolean _containsKey = registers.containsKey(s);
        if (_containsKey) {
          _xifexpression = registers.get(s);
        } else {
          long _xblockexpression = (long) 0;
          {
            registers.put(s, Long.valueOf(0L));
            _xblockexpression = 0L;
          }
          _xifexpression = Long.valueOf(_xblockexpression);
        }
        _xtrycatchfinallyexpression = _xifexpression;
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
    return _xtrycatchfinallyexpression;
  }
}
