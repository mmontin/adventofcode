package advent2022;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;

import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

import adventutils.input.InputLoader;

@SuppressWarnings("all")
public class Day20 {
  public static class MyLong {
    private int position;

    private long value;

    public MyLong(final int _position, final long _value) {
      this.position = _position;
      this.value = _value;
    }

    public long multiplyBy(final long l) {
      return this.value = (this.value * l);
    }

    public int hashCode() {
      int _hashCode = Long.valueOf(this.value).hashCode();
      return (this.position * _hashCode);
    }

    public boolean equals(final Object other) {
      boolean _switchResult = false;
      boolean _matched = false;
      if (other instanceof Day20.MyLong) {
        _matched=true;
        _switchResult = ((((Day20.MyLong)other).position == this.position) && (((Day20.MyLong)other).value == this.value));
      }
      if (!_matched) {
        _switchResult = false;
      }
      return _switchResult;
    }
  }

  private static final List<Long> raw_inputs = ListExtensions.<String, Long>map(new InputLoader(Integer.valueOf(2022), Integer.valueOf(20)).getInputs(), new Function1<String, Long>() {
    public Long apply(final String it) {
      return Long.valueOf(Long.parseLong(it));
    }
  });

  private static List<Day20.MyLong> inputs = new Function0<List<Day20.MyLong>>() {
    public List<Day20.MyLong> apply() {
      ArrayList<Day20.MyLong> _xblockexpression = null;
      {
        final ArrayList<Day20.MyLong> output = CollectionLiterals.<Day20.MyLong>newArrayList();
        int _size = Day20.raw_inputs.size();
        final Consumer<Integer> _function = new Consumer<Integer>() {
          public void accept(final Integer it) {
            Long _get = Day20.raw_inputs.get((it).intValue());
            Day20.MyLong _myLong = new Day20.MyLong((it).intValue(), (_get).longValue());
            output.add(_myLong);
          }
        };
        new ExclusiveRange(0, _size, true).forEach(_function);
        _xblockexpression = output;
      }
      return _xblockexpression;
    }
  }.apply();

  private static final int inputs_size = Day20.inputs.size();

  public static void main(final String[] args) {
    ArrayList<Day20.MyLong> current = new ArrayList<Day20.MyLong>(Day20.inputs);
    Day20.oneRound(current);
    Day20.printResult(current);
    final Function1<Day20.MyLong, Day20.MyLong> _function = new Function1<Day20.MyLong, Day20.MyLong>() {
      public Day20.MyLong apply(final Day20.MyLong it) {
        return new Day20.MyLong(it.position, (it.value * 811589153));
      }
    };
    Day20.inputs = ListExtensions.<Day20.MyLong, Day20.MyLong>map(Day20.inputs, _function);
    ArrayList<Day20.MyLong> _arrayList = new ArrayList<Day20.MyLong>(Day20.inputs);
    current = _arrayList;
    ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, 10, true);
    for (final Integer i : _doubleDotLessThan) {
      Day20.oneRound(current);
    }
    Day20.printResult(current);
  }

  public static void oneRound(final List<Day20.MyLong> _current) {
    final Consumer<Day20.MyLong> _function = new Consumer<Day20.MyLong>() {
      public void accept(final Day20.MyLong it) {
        final int current_position = _current.indexOf(it);
        _current.remove(current_position);
        long new_position = ((current_position + it.value) % (Day20.inputs_size - 1));
        if ((new_position < 0)) {
          new_position = ((Day20.inputs_size - 1) + new_position);
        }
        _current.add(((int) new_position), it);
      }
    };
    Day20.inputs.forEach(_function);
  }

  public static Long printResult(final List<Day20.MyLong> _current) {
    Long _xblockexpression = null;
    {
      final Function1<Day20.MyLong, Boolean> _function = new Function1<Day20.MyLong, Boolean>() {
        public Boolean apply(final Day20.MyLong it) {
          return Boolean.valueOf((it.value == 0));
        }
      };
      final int index = _current.indexOf(IterableExtensions.<Day20.MyLong>findFirst(_current, _function));
      final Day20.MyLong value1 = _current.get(((index + 1000) % Day20.inputs_size));
      final Day20.MyLong value2 = _current.get(((index + 2000) % Day20.inputs_size));
      final Day20.MyLong value3 = _current.get(((index + 3000) % Day20.inputs_size));
      _xblockexpression = InputOutput.<Long>println(Long.valueOf(((value1.value + value2.value) + value3.value)));
    }
    return _xblockexpression;
  }
}
