package advent2017;

import adventutils.input.InputLoader;
import com.google.common.base.Objects;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Stack;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day18 {
  private static final List<List<String>> commands = ListExtensions.<String, List<String>>map(new InputLoader(Integer.valueOf(2017), Integer.valueOf(18)).getInputs(), new Function1<String, List<String>>() {
    public List<String> apply(final String it) {
      return IterableExtensions.<String>toList(((Iterable<String>)Conversions.doWrapArray(it.split(" "))));
    }
  });

  public static void main(final String[] args) {
    final HashMap<String, Long> registers = CollectionLiterals.<String, Long>newHashMap();
    final Stack<Long> sent = new Stack<Long>();
    int position = 0;
    boolean finished = false;
    do {
      {
        final Pair<Boolean, Integer> output = Day18.executeThisCommand(Day18.commands.get(position), registers, Integer.valueOf(position), sent);
        finished = (output.getKey()).booleanValue();
        position = (output.getValue()).intValue();
      }
    } while((!finished));
    InputOutput.<Long>println(sent.peek());
    final HashMap<String, Long> registersZero = CollectionLiterals.<String, Long>newHashMap();
    Pair<String, Long> _mappedTo = Pair.<String, Long>of("p", Long.valueOf(1L));
    final HashMap<String, Long> registersOne = CollectionLiterals.<String, Long>newHashMap(_mappedTo);
    List<Long> zeroSends = CollectionLiterals.<Long>newArrayList();
    List<Long> oneSends = CollectionLiterals.<Long>newArrayList();
    int positionZero = 0;
    int positionOne = 1;
    boolean idleZero = false;
    boolean idleOne = false;
    int nbSentByOne = 0;
    do {
      {
        final int resZero = Day18.executeThisDifferently(Day18.commands.get(positionZero), registersZero, Integer.valueOf(positionZero), zeroSends, oneSends);
        idleZero = (resZero == positionZero);
        positionZero = resZero;
        final int currentSize = oneSends.size();
        final int resOne = Day18.executeThisDifferently(Day18.commands.get(positionOne), registersOne, Integer.valueOf(positionOne), oneSends, zeroSends);
        int _size = oneSends.size();
        boolean _greaterThan = (_size > currentSize);
        if (_greaterThan) {
          nbSentByOne++;
        }
        idleOne = (resOne == positionOne);
        positionOne = resOne;
      }
    } while(((!idleZero) || (!idleOne)));
    InputOutput.<Integer>println(Integer.valueOf(nbSentByOne));
  }

  public static Pair<Boolean, Integer> executeThisCommand(final List<String> l, final Map<String, Long> registers, final Integer position, final Stack<Long> sent) {
    Pair<Boolean, Integer> _xblockexpression = null;
    {
      boolean finished = false;
      int new_position = (position).intValue();
      String _get = l.get(0);
      boolean _matched = false;
      if (Objects.equal(_get, "snd")) {
        _matched=true;
        sent.push(registers.getOrDefault(l.get(1), Long.valueOf(0L)));
      }
      if (!_matched) {
        if (Objects.equal(_get, "set")) {
          _matched=true;
          registers.put(l.get(1), Day18.getMeAValue(registers, l.get(2)));
        }
      }
      if (!_matched) {
        if (Objects.equal(_get, "add")) {
          _matched=true;
          String _get_1 = l.get(1);
          Long _meAValue = Day18.getMeAValue(registers, l.get(1));
          Long _meAValue_1 = Day18.getMeAValue(registers, l.get(2));
          long _plus = ((_meAValue).longValue() + (_meAValue_1).longValue());
          registers.put(_get_1, Long.valueOf(_plus));
        }
      }
      if (!_matched) {
        if (Objects.equal(_get, "mul")) {
          _matched=true;
          String _get_2 = l.get(1);
          Long _meAValue_2 = Day18.getMeAValue(registers, l.get(1));
          Long _meAValue_3 = Day18.getMeAValue(registers, l.get(2));
          long _multiply = ((_meAValue_2).longValue() * (_meAValue_3).longValue());
          registers.put(_get_2, Long.valueOf(_multiply));
        }
      }
      if (!_matched) {
        if (Objects.equal(_get, "mod")) {
          _matched=true;
          String _get_3 = l.get(1);
          Long _meAValue_4 = Day18.getMeAValue(registers, l.get(1));
          Long _meAValue_5 = Day18.getMeAValue(registers, l.get(2));
          long _modulo = ((_meAValue_4).longValue() % (_meAValue_5).longValue());
          registers.put(_get_3, Long.valueOf(_modulo));
        }
      }
      if (!_matched) {
        if (Objects.equal(_get, "rcv")) {
          _matched=true;
          Long _peek = sent.peek();
          boolean _notEquals = ((_peek).longValue() != 0);
          if (_notEquals) {
            finished = true;
          }
        }
      }
      if (!_matched) {
        Long _meAValue_6 = Day18.getMeAValue(registers, l.get(1));
        boolean _greaterThan = ((_meAValue_6).longValue() > 0);
        if (_greaterThan) {
          int _new_position = new_position;
          Long _meAValue_7 = Day18.getMeAValue(registers, l.get(2));
          long _minus = ((_meAValue_7).longValue() - 1);
          new_position = (_new_position + ((int) _minus));
        }
      }
      _xblockexpression = Pair.<Boolean, Integer>of(Boolean.valueOf(finished), Integer.valueOf((new_position + 1)));
    }
    return _xblockexpression;
  }

  public static int executeThisDifferently(final List<String> l, final Map<String, Long> registers, final Integer position, final List<Long> sends, final List<Long> receives) {
    int _xblockexpression = (int) 0;
    {
      int new_position = (position).intValue();
      String _get = l.get(0);
      boolean _matched = false;
      if (Objects.equal(_get, "snd")) {
        _matched=true;
        sends.add(registers.getOrDefault(l.get(1), Long.valueOf(0L)));
      }
      if (!_matched) {
        if (Objects.equal(_get, "set")) {
          _matched=true;
          registers.put(l.get(1), Day18.getMeAValue(registers, l.get(2)));
        }
      }
      if (!_matched) {
        if (Objects.equal(_get, "add")) {
          _matched=true;
          String _get_1 = l.get(1);
          Long _meAValue = Day18.getMeAValue(registers, l.get(1));
          Long _meAValue_1 = Day18.getMeAValue(registers, l.get(2));
          long _plus = ((_meAValue).longValue() + (_meAValue_1).longValue());
          registers.put(_get_1, Long.valueOf(_plus));
        }
      }
      if (!_matched) {
        if (Objects.equal(_get, "mul")) {
          _matched=true;
          String _get_2 = l.get(1);
          Long _meAValue_2 = Day18.getMeAValue(registers, l.get(1));
          Long _meAValue_3 = Day18.getMeAValue(registers, l.get(2));
          long _multiply = ((_meAValue_2).longValue() * (_meAValue_3).longValue());
          registers.put(_get_2, Long.valueOf(_multiply));
        }
      }
      if (!_matched) {
        if (Objects.equal(_get, "mod")) {
          _matched=true;
          String _get_3 = l.get(1);
          Long _meAValue_4 = Day18.getMeAValue(registers, l.get(1));
          Long _meAValue_5 = Day18.getMeAValue(registers, l.get(2));
          long _modulo = ((_meAValue_4).longValue() % (_meAValue_5).longValue());
          registers.put(_get_3, Long.valueOf(_modulo));
        }
      }
      if (!_matched) {
        if (Objects.equal(_get, "rcv")) {
          _matched=true;
          int _size = receives.size();
          boolean _equals = (_size == 0);
          if (_equals) {
            new_position--;
          } else {
            registers.put(l.get(1), receives.remove(0));
          }
        }
      }
      if (!_matched) {
        Long _meAValue_6 = Day18.getMeAValue(registers, l.get(1));
        boolean _greaterThan = ((_meAValue_6).longValue() > 0);
        if (_greaterThan) {
          int _new_position = new_position;
          Long _meAValue_7 = Day18.getMeAValue(registers, l.get(2));
          long _minus = ((_meAValue_7).longValue() - 1);
          new_position = (_new_position + ((int) _minus));
        }
      }
      _xblockexpression = (new_position + 1);
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
