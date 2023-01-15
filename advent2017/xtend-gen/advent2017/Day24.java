package advent2017;

import adventutils.input.InputLoader;
import adventutils.pathfinding.AStar;
import adventutils.pathfinding.State;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day24 {
  public static class Element {
    private int left;

    private int right;

    public Element(final int _left, final int _right) {
      this.left = _left;
      this.right = _right;
    }

    public int weight() {
      return (this.left + this.right);
    }

    public boolean connectsWithPort(final int port) {
      return ((this.left == port) || (this.right == port));
    }

    public boolean connectsWithOther(final Day24.Element other) {
      return (this.connectsWithPort(other.left) || this.connectsWithPort(other.right));
    }

    public boolean accessibleFrom(final Set<Day24.Element> others) {
      final Function1<Day24.Element, Boolean> _function = new Function1<Day24.Element, Boolean>() {
        public Boolean apply(final Day24.Element it) {
          return Boolean.valueOf(it.connectsWithOther(Element.this));
        }
      };
      return IterableExtensions.<Day24.Element>exists(others, _function);
    }

    public int otherPort(final int port) {
      int _xifexpression = (int) 0;
      if ((this.left == port)) {
        _xifexpression = this.right;
      } else {
        _xifexpression = this.left;
      }
      return _xifexpression;
    }

    public int hashCode() {
      return (this.left * this.right);
    }

    public boolean equals(final Object other) {
      boolean _switchResult = false;
      boolean _matched = false;
      if (other instanceof Day24.Element) {
        _matched=true;
        _switchResult = ((((Day24.Element)other).left == this.left) && (((Day24.Element)other).right == this.right));
      }
      if (!_matched) {
        _switchResult = false;
      }
      return _switchResult;
    }

    public String toString() {
      return (((("[ " + Integer.valueOf(this.left)) + " , ") + Integer.valueOf(this.right)) + " ]");
    }
  }

  public static class Bridge implements State {
    private final Set<Day24.Element> remaining;

    private final int last_plug;

    private final List<Pair<State, Integer>> neighbours;

    private final boolean isGoal;

    private final int minToGoal;

    private final int hashCode;

    public Bridge() {
      this(new HashSet<Day24.Element>(Day24.elements), 0);
    }

    public Bridge(final Set<Day24.Element> _remaining, final int _last_plug) {
      this.remaining = _remaining;
      this.last_plug = _last_plug;
      this.neighbours = CollectionLiterals.<Pair<State, Integer>>newArrayList();
      final Function1<Day24.Element, Boolean> _function = new Function1<Day24.Element, Boolean>() {
        public Boolean apply(final Day24.Element it) {
          return Boolean.valueOf(it.connectsWithPort(Bridge.this.last_plug));
        }
      };
      final Consumer<Day24.Element> _function_1 = new Consumer<Day24.Element>() {
        public void accept(final Day24.Element it) {
          HashSet<Day24.Element> _xblockexpression = null;
          {
            final HashSet<Day24.Element> output = new HashSet<Day24.Element>(Bridge.this.remaining);
            output.remove(it);
            _xblockexpression = output;
          }
          int _otherPort = it.otherPort(Bridge.this.last_plug);
          Day24.Bridge _bridge = new Day24.Bridge(_xblockexpression, _otherPort);
          Pair<State, Integer> _mappedTo = Pair.<State, Integer>of(((State) _bridge), Integer.valueOf(0));
          Bridge.this.neighbours.add(_mappedTo);
        }
      };
      IterableExtensions.<Day24.Element>filter(this.remaining, _function).forEach(_function_1);
      this.isGoal = this.neighbours.isEmpty();
      Day24.Element _element = new Day24.Element(this.last_plug, this.last_plug);
      final HashSet<Day24.Element> accessible = CollectionLiterals.<Day24.Element>newHashSet(_element);
      final HashSet<Day24.Element> to_try = new HashSet<Day24.Element>(this.remaining);
      final Function1<Day24.Element, Boolean> _function_2 = new Function1<Day24.Element, Boolean>() {
        public Boolean apply(final Day24.Element it) {
          return Boolean.valueOf(it.accessibleFrom(accessible));
        }
      };
      Day24.Element next_accessible = IterableExtensions.<Day24.Element>findFirst(to_try, _function_2);
      while ((next_accessible != null)) {
        {
          accessible.add(next_accessible);
          to_try.remove(next_accessible);
          final Function1<Day24.Element, Boolean> _function_3 = new Function1<Day24.Element, Boolean>() {
            public Boolean apply(final Day24.Element it) {
              return Boolean.valueOf(it.accessibleFrom(accessible));
            }
          };
          next_accessible = IterableExtensions.<Day24.Element>findFirst(to_try, _function_3);
        }
      }
      final Function2<Integer, Day24.Element, Integer> _function_3 = new Function2<Integer, Day24.Element, Integer>() {
        public Integer apply(final Integer acc, final Day24.Element v) {
          int _weight = v.weight();
          return Integer.valueOf(((acc).intValue() + _weight));
        }
      };
      Integer _fold = IterableExtensions.<Day24.Element, Integer>fold(to_try, Integer.valueOf(0), _function_3);
      int _xifexpression = (int) 0;
      if (Day24.round1) {
        _xifexpression = 0;
      } else {
        int _size = to_try.size();
        _xifexpression = (_size * 1000);
      }
      int _plus = ((_fold).intValue() + _xifexpression);
      this.minToGoal = _plus;
      this.hashCode = this.remaining.hashCode();
    }

    public boolean isGoal() {
      return this.isGoal;
    }

    public int minToGoal() {
      return this.minToGoal;
    }

    public Iterable<Pair<State, Integer>> neighbours() {
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

  private static final List<Day24.Element> elements = new InputLoader(Integer.valueOf(2017), Integer.valueOf(24)).<Day24.Element>getInputs(new Function1<String, Day24.Element>() {
    public Day24.Element apply(final String it) {
      Day24.Element _xblockexpression = null;
      {
        final String[] split = it.split("/");
        int _parseInt = Integer.parseInt(split[0]);
        int _parseInt_1 = Integer.parseInt(split[1]);
        _xblockexpression = new Day24.Element(_parseInt, _parseInt_1);
      }
      return _xblockexpression;
    }
  });

  private static boolean round1 = true;

  public static void main(final String[] args) {
    Day24.Bridge _bridge = new Day24.Bridge();
    final AStar computation = new AStar(_bridge).run();
    final Function1<Day24.Element, Boolean> _function = new Function1<Day24.Element, Boolean>() {
      public Boolean apply(final Day24.Element it) {
        State _last = IterableExtensions.<State>last(computation.minPath());
        boolean _contains = ((Day24.Bridge) _last).remaining.contains(it);
        return Boolean.valueOf((!_contains));
      }
    };
    final Function2<Integer, Day24.Element, Integer> _function_1 = new Function2<Integer, Day24.Element, Integer>() {
      public Integer apply(final Integer acc, final Day24.Element v) {
        int _weight = v.weight();
        return Integer.valueOf(((acc).intValue() + _weight));
      }
    };
    InputOutput.<Integer>println(IterableExtensions.<Day24.Element, Integer>fold(IterableExtensions.<Day24.Element>filter(Day24.elements, _function), Integer.valueOf(0), _function_1));
    Day24.round1 = false;
    Day24.Bridge _bridge_1 = new Day24.Bridge();
    computation.initialize(_bridge_1);
    computation.run();
    final Function1<Day24.Element, Boolean> _function_2 = new Function1<Day24.Element, Boolean>() {
      public Boolean apply(final Day24.Element it) {
        State _last = IterableExtensions.<State>last(computation.minPath());
        boolean _contains = ((Day24.Bridge) _last).remaining.contains(it);
        return Boolean.valueOf((!_contains));
      }
    };
    final Function2<Integer, Day24.Element, Integer> _function_3 = new Function2<Integer, Day24.Element, Integer>() {
      public Integer apply(final Integer acc, final Day24.Element v) {
        int _weight = v.weight();
        return Integer.valueOf(((acc).intValue() + _weight));
      }
    };
    InputOutput.<Integer>println(IterableExtensions.<Day24.Element, Integer>fold(IterableExtensions.<Day24.Element>filter(Day24.elements, _function_2), Integer.valueOf(0), _function_3));
  }
}
