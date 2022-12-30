package advent2017;

import adventutils.astar.AStar;
import adventutils.astar.State;
import adventutils.input.InputLoader;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day24 {
  public static class Bridge implements State {
    private final Set<Pair<Integer, Integer>> remaining;

    private final int last_plug;

    private final List<Pair<State, Integer>> neighbours;

    private final boolean isGoal;

    private final int minToGoal;

    private final int hashCode;

    public Bridge() {
      this(new HashSet<Pair<Integer, Integer>>(Day24.elements), 0);
    }

    public Bridge(final Set<Pair<Integer, Integer>> _remaining, final int _last_plug) {
      this.remaining = _remaining;
      this.last_plug = _last_plug;
      this.neighbours = CollectionLiterals.<Pair<State, Integer>>newArrayList();
      final Function1<Pair<Integer, Integer>, Boolean> _function = new Function1<Pair<Integer, Integer>, Boolean>() {
        public Boolean apply(final Pair<Integer, Integer> it) {
          return Boolean.valueOf((((it.getKey()).intValue() == Bridge.this.last_plug) || ((it.getValue()).intValue() == Bridge.this.last_plug)));
        }
      };
      final Consumer<Pair<Integer, Integer>> _function_1 = new Consumer<Pair<Integer, Integer>>() {
        public void accept(final Pair<Integer, Integer> it) {
          HashSet<Pair<Integer, Integer>> _xblockexpression = null;
          {
            final HashSet<Pair<Integer, Integer>> output = new HashSet<Pair<Integer, Integer>>(Bridge.this.remaining);
            output.remove(it);
            _xblockexpression = output;
          }
          Integer _xifexpression = null;
          Integer _key = it.getKey();
          boolean _equals = ((_key).intValue() == Bridge.this.last_plug);
          if (_equals) {
            _xifexpression = it.getValue();
          } else {
            _xifexpression = it.getKey();
          }
          Day24.Bridge _bridge = new Day24.Bridge(_xblockexpression, (_xifexpression).intValue());
          Integer _key_1 = it.getKey();
          Integer _value = it.getValue();
          int _plus = ((_key_1).intValue() + (_value).intValue());
          int _minus = (Day24.MAX_ELEMNT_VALUE - _plus);
          Pair<State, Integer> _mappedTo = Pair.<State, Integer>of(((State) _bridge), Integer.valueOf(_minus));
          Bridge.this.neighbours.add(_mappedTo);
        }
      };
      IterableExtensions.<Pair<Integer, Integer>>filter(this.remaining, _function).forEach(_function_1);
      this.isGoal = this.neighbours.isEmpty();
      final Function2<Integer, Pair<Integer, Integer>, Integer> _function_2 = new Function2<Integer, Pair<Integer, Integer>, Integer>() {
        public Integer apply(final Integer acc, final Pair<Integer, Integer> v) {
          Integer _key = v.getKey();
          Integer _value = v.getValue();
          int _plus = ((_key).intValue() + (_value).intValue());
          return Integer.valueOf((((acc).intValue() + Day24.MAX_ELEMNT_VALUE) - _plus));
        }
      };
      this.minToGoal = (IterableExtensions.<Pair<Integer, Integer>, Integer>fold(this.remaining, Integer.valueOf(0), _function_2)).intValue();
      this.hashCode = this.remaining.hashCode();
    }

    public boolean isGoal() {
      return this.isGoal;
    }

    public int minToGoal() {
      return this.minToGoal;
    }

    public List<Pair<State, Integer>> neighbours() {
      return this.neighbours;
    }

    public int hashCode() {
      return this.hashCode;
    }

    public boolean equals(final Object other) {
      boolean _switchResult = false;
      boolean _matched = false;
      if (other instanceof Day24.Bridge) {
        _matched=true;
        _switchResult = (((Day24.Bridge)other).remaining.equals(this.remaining) && (((Day24.Bridge)other).last_plug == this.last_plug));
      }
      if (!_matched) {
        _switchResult = false;
      }
      return _switchResult;
    }

    public String toString() {
      String _plus = (Integer.valueOf(this.last_plug) + " ; ");
      return (_plus + this.remaining);
    }
  }

  private static final List<Pair<Integer, Integer>> elements = new InputLoader(Integer.valueOf(2017), Integer.valueOf(24)).<Pair<Integer, Integer>>getInputs(new Function1<String, Pair<Integer, Integer>>() {
    public Pair<Integer, Integer> apply(final String it) {
      Pair<Integer, Integer> _xblockexpression = null;
      {
        final String[] split = it.split("/");
        int _parseInt = Integer.parseInt(split[0]);
        int _parseInt_1 = Integer.parseInt(split[1]);
        _xblockexpression = Pair.<Integer, Integer>of(Integer.valueOf(_parseInt), Integer.valueOf(_parseInt_1));
      }
      return _xblockexpression;
    }
  });

  private static final int MAX_ELEMNT_VALUE = (int) IterableExtensions.<Integer>max(ListExtensions.<Pair<Integer, Integer>, Integer>map(Day24.elements, new Function1<Pair<Integer, Integer>, Integer>() {
    public Integer apply(final Pair<Integer, Integer> it) {
      Integer _value = it.getValue();
      Integer _key = it.getKey();
      return Integer.valueOf(((_value).intValue() + (_key).intValue()));
    }
  }));

  public static void main(final String[] args) {
    InputOutput.<Integer>println(Integer.valueOf(Day24.elements.size()));
    Day24.Bridge _bridge = new Day24.Bridge();
    final AStar computation = new AStar(_bridge).run();
    final Consumer<State> _function = new Consumer<State>() {
      public void accept(final State it) {
        InputOutput.<State>println(it);
      }
    };
    computation.minPath().forEach(_function);
    final Function1<Pair<Integer, Integer>, Boolean> _function_1 = new Function1<Pair<Integer, Integer>, Boolean>() {
      public Boolean apply(final Pair<Integer, Integer> it) {
        State _last = IterableExtensions.<State>last(computation.minPath());
        boolean _contains = ((Day24.Bridge) _last).remaining.contains(it);
        return Boolean.valueOf((!_contains));
      }
    };
    final Function2<Integer, Pair<Integer, Integer>, Integer> _function_2 = new Function2<Integer, Pair<Integer, Integer>, Integer>() {
      public Integer apply(final Integer acc, final Pair<Integer, Integer> v) {
        Integer _key = v.getKey();
        int _plus = ((acc).intValue() + (_key).intValue());
        Integer _value = v.getValue();
        return Integer.valueOf((_plus + (_value).intValue()));
      }
    };
    InputOutput.<Integer>println(IterableExtensions.<Pair<Integer, Integer>, Integer>fold(IterableExtensions.<Pair<Integer, Integer>>filter(Day24.elements, _function_1), Integer.valueOf(0), _function_2));
  }
}
