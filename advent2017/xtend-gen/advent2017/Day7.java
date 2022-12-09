package advent2017;

import adventutils.input.InputLoader;
import com.google.common.base.Objects;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Day7 {
  public static class Tower {
    private String name;

    private int own_weight;

    private int total_weight;

    private Map<String, Day7.Tower> content;

    public Tower(final String s) {
      final String[] split = s.split(" -> ");
      this.content = CollectionLiterals.<String, Day7.Tower>newHashMap();
      int _size = ((List<String>)Conversions.doWrapArray(split)).size();
      boolean _greaterThan = (_size > 1);
      if (_greaterThan) {
        final Consumer<String> _function = new Consumer<String>() {
          public void accept(final String it) {
            Tower.this.content.put(it, null);
          }
        };
        ((List<String>)Conversions.doWrapArray((split[1]).split(", "))).forEach(_function);
      }
      final String[] split1 = (split[0]).split(" ");
      this.name = split1[0];
      final String sown_weight = split1[1];
      int _length = sown_weight.length();
      int _minus = (_length - 1);
      this.own_weight = Integer.parseInt(sown_weight.substring(1, _minus));
      this.total_weight = this.own_weight;
    }

    public boolean resolved() {
      final Function1<Day7.Tower, Boolean> _function = new Function1<Day7.Tower, Boolean>() {
        public Boolean apply(final Day7.Tower it) {
          return Boolean.valueOf((it != null));
        }
      };
      return IterableExtensions.<Day7.Tower>forall(this.content.values(), _function);
    }

    public int hashCode() {
      return this.name.hashCode();
    }

    public boolean equals(final Object other) {
      return Objects.equal(((Day7.Tower) other).name, this.name);
    }

    public int update(final Day7.Tower toPileUp) {
      int _xblockexpression = (int) 0;
      {
        this.content.put(toPileUp.name, toPileUp);
        int _tal_weight = this.total_weight;
        _xblockexpression = this.total_weight = (_tal_weight + toPileUp.total_weight);
      }
      return _xblockexpression;
    }
  }

  public static void main(final String[] args) {
    final HashSet<Day7.Tower> towers = CollectionLiterals.<Day7.Tower>newHashSet();
    final Consumer<String> _function = new Consumer<String>() {
      public void accept(final String it) {
        Day7.Tower _tower = new Day7.Tower(it);
        towers.add(_tower);
      }
    };
    new InputLoader(Integer.valueOf(2017), Integer.valueOf(7)).getInputs().forEach(_function);
    while ((towers.size() != 1)) {
      {
        final Function1<Day7.Tower, Boolean> _function_1 = new Function1<Day7.Tower, Boolean>() {
          public Boolean apply(final Day7.Tower it) {
            return Boolean.valueOf(it.resolved());
          }
        };
        final Day7.Tower toPileUp = IterableExtensions.<Day7.Tower>findFirst(towers, _function_1);
        towers.remove(toPileUp);
        final Function1<Day7.Tower, Boolean> _function_2 = new Function1<Day7.Tower, Boolean>() {
          public Boolean apply(final Day7.Tower it) {
            return Boolean.valueOf(it.content.containsKey(toPileUp.name));
          }
        };
        final Day7.Tower container = IterableExtensions.<Day7.Tower>findFirst(towers, _function_2);
        container.update(toPileUp);
      }
    }
    InputOutput.<String>println(IterableExtensions.<Day7.Tower>head(towers).name);
    Day7.Tower wrong = IterableExtensions.<Day7.Tower>head(towers);
    int should_be = 0;
    while ((IterableExtensions.<Integer, Day7.Tower>groupBy(wrong.content.values(), new Function1<Day7.Tower, Integer>() {
      public Integer apply(final Day7.Tower it) {
        return Integer.valueOf(it.total_weight);
      }
    }).size() == 2)) {
      {
        final Function1<Day7.Tower, Integer> _function_1 = new Function1<Day7.Tower, Integer>() {
          public Integer apply(final Day7.Tower it) {
            return Integer.valueOf(it.total_weight);
          }
        };
        final Map<Integer, List<Day7.Tower>> groups = IterableExtensions.<Integer, Day7.Tower>groupBy(wrong.content.values(), _function_1);
        final Function1<Map.Entry<Integer, List<Day7.Tower>>, Boolean> _function_2 = new Function1<Map.Entry<Integer, List<Day7.Tower>>, Boolean>() {
          public Boolean apply(final Map.Entry<Integer, List<Day7.Tower>> it) {
            int _size = it.getValue().size();
            return Boolean.valueOf((_size > 1));
          }
        };
        should_be = (IterableExtensions.<Map.Entry<Integer, List<Day7.Tower>>>findFirst(groups.entrySet(), _function_2).getKey()).intValue();
        final Function1<List<Day7.Tower>, Boolean> _function_3 = new Function1<List<Day7.Tower>, Boolean>() {
          public Boolean apply(final List<Day7.Tower> it) {
            int _size = it.size();
            return Boolean.valueOf((_size == 1));
          }
        };
        wrong = IterableExtensions.<Day7.Tower>head(IterableExtensions.<List<Day7.Tower>>findFirst(groups.values(), _function_3));
      }
    }
    final Function2<Integer, Day7.Tower, Integer> _function_1 = new Function2<Integer, Day7.Tower, Integer>() {
      public Integer apply(final Integer acc, final Day7.Tower v) {
        return Integer.valueOf(((acc).intValue() + v.total_weight));
      }
    };
    Integer _fold = IterableExtensions.<Day7.Tower, Integer>fold(wrong.content.values(), Integer.valueOf(0), _function_1);
    int _minus = (should_be - (_fold).intValue());
    InputOutput.<Integer>println(Integer.valueOf(_minus));
  }
}
