package advent2018;

import adventutils.input.InputLoader;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.function.Consumer;
import java.util.function.Predicate;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Day24 {
  public static class Unit {
    private int id;

    private int count;

    private int hp;

    private Set<String> weaknesses;

    private Set<String> immunities;

    private int damage;

    private String damage_type;

    private int initiative;

    private boolean is_infection;

    public Unit(final int id_, final List<String> input, final int index, final boolean is_infection_) {
      this.id = id_;
      this.count = Integer.parseInt(input.get(index));
      this.hp = Integer.parseInt(input.get((index + 1)));
      this.weaknesses = IterableExtensions.<String>toSet(((Iterable<String>)Conversions.doWrapArray(input.get((index + 2)).split(", "))));
      this.immunities = IterableExtensions.<String>toSet(((Iterable<String>)Conversions.doWrapArray(input.get((index + 3)).split(", "))));
      this.damage = Integer.parseInt(input.get((index + 4)));
      this.damage_type = input.get((index + 5));
      this.initiative = Integer.parseInt(input.get((index + 6)));
      this.is_infection = is_infection_;
    }

    public int effective_power() {
      return (this.count * this.damage);
    }

    @Override
    public String toString() {
      String _xifexpression = null;
      if (this.is_infection) {
        _xifexpression = "infection";
      } else {
        _xifexpression = "immune";
      }
      String _join = IterableExtensions.join(Collections.<Object>unmodifiableList(CollectionLiterals.<Object>newArrayList(Integer.valueOf(this.id), _xifexpression, ("hp : " + Integer.valueOf(this.hp)), Integer.valueOf(this.count))), ",");
      String _plus = ("[" + _join);
      return (_plus + "]");
    }

    public int simulate_damage(final Day24.Unit other) {
      int _switchResult = (int) 0;
      boolean _matched = false;
      if ((other.is_infection == this.is_infection)) {
        _matched=true;
        _switchResult = 0;
      }
      if (!_matched) {
        boolean _contains = other.immunities.contains(this.damage_type);
        if (_contains) {
          _matched=true;
          _switchResult = 0;
        }
      }
      if (!_matched) {
        boolean _contains_1 = other.weaknesses.contains(this.damage_type);
        if (_contains_1) {
          _matched=true;
          int _effective_power = this.effective_power();
          _switchResult = (2 * _effective_power);
        }
      }
      if (!_matched) {
        _switchResult = this.effective_power();
      }
      return _switchResult;
    }

    public boolean deal_damage(final Day24.Unit other) {
      boolean _xblockexpression = false;
      {
        int _simulate_damage = this.simulate_damage(other);
        final int death_count = (_simulate_damage / other.hp);
        int _count = other.count;
        other.count = (_count - death_count);
        _xblockexpression = (death_count > 0);
      }
      return _xblockexpression;
    }

    @Override
    public int hashCode() {
      int _xifexpression = (int) 0;
      if (this.is_infection) {
        _xifexpression = (-this.id);
      } else {
        _xifexpression = this.id;
      }
      return _xifexpression;
    }

    @Override
    public boolean equals(final Object other) {
      boolean _switchResult = false;
      boolean _matched = false;
      if (other instanceof Day24.Unit) {
        _matched=true;
        _switchResult = ((((Day24.Unit)other).id == this.id) && (((Day24.Unit)other).is_infection == this.is_infection));
      }
      if (!_matched) {
        _switchResult = false;
      }
      return _switchResult;
    }

    public Optional<Day24.Unit> select_target(final Collection<Day24.Unit> already_selected) {
      Optional<Day24.Unit> _xblockexpression = null;
      {
        final Function1<Day24.Unit, Boolean> _function = (Day24.Unit it) -> {
          boolean _contains = already_selected.contains(it);
          return Boolean.valueOf((!_contains));
        };
        final Function1<Day24.Unit, Integer> _function_1 = (Day24.Unit it) -> {
          return Integer.valueOf(this.simulate_damage(it));
        };
        final Function1<Map.Entry<Integer, List<Day24.Unit>>, Integer> _function_2 = (Map.Entry<Integer, List<Day24.Unit>> it) -> {
          return it.getKey();
        };
        final Function1<Day24.Unit, Integer> _function_3 = (Day24.Unit it) -> {
          return Integer.valueOf(it.effective_power());
        };
        final Function1<Map.Entry<Integer, List<Day24.Unit>>, Integer> _function_4 = (Map.Entry<Integer, List<Day24.Unit>> it) -> {
          return it.getKey();
        };
        final Function1<Day24.Unit, Integer> _function_5 = (Day24.Unit it) -> {
          return Integer.valueOf(it.initiative);
        };
        final Function1<Map.Entry<Integer, List<Day24.Unit>>, Integer> _function_6 = (Map.Entry<Integer, List<Day24.Unit>> it) -> {
          return it.getKey();
        };
        final Day24.Unit candidate = IterableExtensions.<Day24.Unit>head(IterableExtensions.<Map.Entry<Integer, List<Day24.Unit>>, Integer>maxBy(IterableExtensions.<Integer, Day24.Unit>groupBy(IterableExtensions.<Map.Entry<Integer, List<Day24.Unit>>, Integer>maxBy(IterableExtensions.<Integer, Day24.Unit>groupBy(IterableExtensions.<Map.Entry<Integer, List<Day24.Unit>>, Integer>maxBy(IterableExtensions.<Integer, Day24.Unit>groupBy(IterableExtensions.<Day24.Unit>filter(Day24.groups, _function), _function_1).entrySet(), _function_2).getValue(), _function_3).entrySet(), _function_4).getValue(), _function_5).entrySet(), _function_6).getValue());
        Optional<Day24.Unit> _xifexpression = null;
        int _simulate_damage = this.simulate_damage(candidate);
        boolean _greaterThan = (_simulate_damage > 0);
        if (_greaterThan) {
          _xifexpression = Optional.<Day24.Unit>of(candidate);
        } else {
          _xifexpression = Optional.<Day24.Unit>empty();
        }
        _xblockexpression = _xifexpression;
      }
      return _xblockexpression;
    }
  }

  private static final int size = 10;

  private static final List<Day24.Unit> groups = CollectionLiterals.<Day24.Unit>newArrayList();

  private static List<String> input = new InputLoader(Integer.valueOf(2018), Integer.valueOf(24)).getInputs();

  public static void main(final String[] args) {
    Day24.play(0);
    final Function2<Integer, Day24.Unit, Integer> _function = (Integer acc, Day24.Unit el) -> {
      return Integer.valueOf(((acc).intValue() + el.count));
    };
    InputOutput.<Integer>println(IterableExtensions.<Day24.Unit, Integer>fold(Day24.groups, Integer.valueOf(0), _function));
    int min = 1;
    int max = 1000;
    int res = 0;
    while (((max - min) > 0)) {
      {
        final int middle = (min + ((max - min) / 2));
        boolean _play = Day24.play(middle);
        if (_play) {
          min = (middle + 1);
        } else {
          max = middle;
          final Function2<Integer, Day24.Unit, Integer> _function_1 = (Integer acc, Day24.Unit el) -> {
            return Integer.valueOf(((acc).intValue() + el.count));
          };
          res = (IterableExtensions.<Day24.Unit, Integer>fold(Day24.groups, Integer.valueOf(0), _function_1)).intValue();
        }
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(res));
  }

  public static boolean play(final int inflation) {
    boolean _xblockexpression = false;
    {
      Day24.groups.clear();
      IntegerRange _upTo = new IntegerRange(0, ((2 * Day24.size) - 1));
      for (final Integer i : _upTo) {
        Day24.Unit _unit = new Day24.Unit((((i).intValue() % Day24.size) + 1), Day24.input, (8 * (i).intValue()), ((i).intValue() >= Day24.size));
        Day24.groups.add(_unit);
      }
      final Function1<Day24.Unit, Boolean> _function = (Day24.Unit it) -> {
        return Boolean.valueOf((!it.is_infection));
      };
      final Consumer<Day24.Unit> _function_1 = (Day24.Unit it) -> {
        int _damage = it.damage;
        it.damage = (_damage + inflation);
      };
      IterableExtensions.<Day24.Unit>filter(Day24.groups, _function).forEach(_function_1);
      boolean damage_dealt = true;
      while (((IterableExtensions.<Day24.Unit>exists(Day24.groups, ((Function1<Day24.Unit, Boolean>) (Day24.Unit it) -> {
        return Boolean.valueOf(it.is_infection);
      })) && IterableExtensions.<Day24.Unit>exists(Day24.groups, ((Function1<Day24.Unit, Boolean>) (Day24.Unit it) -> {
        return Boolean.valueOf((!it.is_infection));
      }))) && damage_dealt)) {
        {
          final HashMap<Day24.Unit, Day24.Unit> targets = CollectionLiterals.<Day24.Unit, Day24.Unit>newHashMap();
          final Function1<Day24.Unit, Integer> _function_2 = (Day24.Unit it) -> {
            int _effective_power = it.effective_power();
            int _multiply = (_effective_power * 100);
            int _plus = (_multiply + it.initiative);
            return Integer.valueOf((-_plus));
          };
          final Consumer<Day24.Unit> _function_3 = (Day24.Unit it) -> {
            final Optional<Day24.Unit> selected = it.select_target(targets.values());
            boolean _isEmpty = selected.isEmpty();
            boolean _not = (!_isEmpty);
            if (_not) {
              targets.put(it, selected.get());
            }
          };
          IterableExtensions.<Day24.Unit, Integer>sortBy(Day24.groups, _function_2).forEach(_function_3);
          final Function1<Day24.Unit, Integer> _function_4 = (Day24.Unit it) -> {
            return Integer.valueOf((-it.initiative));
          };
          final Function2<Boolean, Day24.Unit, Boolean> _function_5 = (Boolean acc, Day24.Unit el) -> {
            Boolean _xifexpression = null;
            if (((el.count > 0) && targets.containsKey(el))) {
              _xifexpression = Boolean.valueOf((el.deal_damage(targets.get(el)) || (acc).booleanValue()));
            } else {
              _xifexpression = acc;
            }
            return _xifexpression;
          };
          damage_dealt = (IterableExtensions.<Day24.Unit, Boolean>fold(IterableExtensions.<Day24.Unit, Integer>sortBy(Day24.groups, _function_4), Boolean.valueOf(false), _function_5)).booleanValue();
          final Predicate<Day24.Unit> _function_6 = (Day24.Unit it) -> {
            return (it.count <= 0);
          };
          Day24.groups.removeIf(_function_6);
        }
      }
      _xblockexpression = ((!damage_dealt) || IterableExtensions.<Day24.Unit>head(Day24.groups).is_infection);
    }
    return _xblockexpression;
  }
}
