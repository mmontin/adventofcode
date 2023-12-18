package advent2022;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.function.Consumer;

import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

import adventutils.input.InputLoader;

@SuppressWarnings("all")
public class Day11 {
  public static class Monkey {
    private List<Long> items;

    private boolean isMultiply;

    private Optional<Long> adjustment;

    private int divisibility;

    private int ifTrue;

    private int ifFalse;

    private long inspected;

    public Monkey(final List<String> strings) {
      final Function1<String, Long> _function = new Function1<String, Long>() {
        public Long apply(final String it) {
          return Long.valueOf(Long.parseLong(it));
        }
      };
      List<Long> _map = ListExtensions.<String, Long>map(((List<String>)Conversions.doWrapArray((strings.get(0).split(": ")[1]).split(", "))), _function);
      ArrayList<Long> _arrayList = new ArrayList<Long>(_map);
      this.items = _arrayList;
      final String[] split2 = (strings.get(1).split(": ")[1]).split(" ");
      this.isMultiply = (split2[3]).equals("*");
      Optional<Long> _xtrycatchfinallyexpression = null;
      try {
        _xtrycatchfinallyexpression = Optional.<Long>of(Long.valueOf(Long.parseLong(split2[4])));
      } catch (final Throwable _t) {
        if (_t instanceof NumberFormatException) {
          _xtrycatchfinallyexpression = Optional.<Long>empty();
        } else {
          throw Exceptions.sneakyThrow(_t);
        }
      }
      this.adjustment = _xtrycatchfinallyexpression;
      this.divisibility = Integer.parseInt((strings.get(2).split(": ")[1]).split(" ")[2]);
      this.ifTrue = Integer.parseInt((strings.get(3).split(": ")[1]).split(" ")[3]);
      this.ifFalse = Integer.parseInt((strings.get(4).split(": ")[1]).split(" ")[3]);
      this.inspected = 0;
    }

    public void play() {
      int _size = this.items.size();
      final Consumer<Integer> _function = new Consumer<Integer>() {
        public void accept(final Integer it) {
          Monkey.this.inspected++;
          long current_item = (Monkey.this.items.remove(0)).longValue();
          Long _xifexpression = null;
          boolean _isPresent = Monkey.this.adjustment.isPresent();
          if (_isPresent) {
            _xifexpression = Monkey.this.adjustment.get();
          } else {
            _xifexpression = Long.valueOf(current_item);
          }
          final long toTamperWith = (_xifexpression).longValue();
          if (Monkey.this.isMultiply) {
            long _current_item = current_item;
            current_item = (_current_item * toTamperWith);
          } else {
            long _current_item_1 = current_item;
            current_item = (_current_item_1 + toTamperWith);
          }
          long _current_item_2 = current_item;
          current_item = (_current_item_2 / 3);
          int _xifexpression_1 = (int) 0;
          if (((current_item % Monkey.this.divisibility) == 0)) {
            _xifexpression_1 = Monkey.this.ifTrue;
          } else {
            _xifexpression_1 = Monkey.this.ifFalse;
          }
          Day11.monkeys.get(_xifexpression_1).items.add(Long.valueOf(current_item));
        }
      };
      new ExclusiveRange(0, _size, true).forEach(_function);
    }

    public void playSmart() {
      final ArrayList<HashMap<Integer, Long>> myItems = Day11.congruences.get(Day11.monkeys.indexOf(this));
      int _size = myItems.size();
      final Consumer<Integer> _function = new Consumer<Integer>() {
        public void accept(final Integer it) {
          Monkey.this.inspected++;
          final HashMap<Integer, Long> current_item = myItems.remove(0);
          Set<Map.Entry<Integer, Long>> _entrySet = current_item.entrySet();
          final Consumer<Map.Entry<Integer, Long>> _function = new Consumer<Map.Entry<Integer, Long>>() {
            public void accept(final Map.Entry<Integer, Long> entry) {
              Long _xifexpression = null;
              boolean _isPresent = Monkey.this.adjustment.isPresent();
              if (_isPresent) {
                _xifexpression = Monkey.this.adjustment.get();
              } else {
                _xifexpression = entry.getValue();
              }
              Long toTamperWith = _xifexpression;
              long _xifexpression_1 = (long) 0;
              if (Monkey.this.isMultiply) {
                Long _value = entry.getValue();
                _xifexpression_1 = ((_value).longValue() * (toTamperWith).longValue());
              } else {
                Long _value_1 = entry.getValue();
                _xifexpression_1 = ((_value_1).longValue() + (toTamperWith).longValue());
              }
              Integer _key = entry.getKey();
              long newValue = (_xifexpression_1 % (_key).intValue());
              current_item.put(entry.getKey(), Long.valueOf(newValue));
            }
          };
          new HashSet<Map.Entry<Integer, Long>>(_entrySet).forEach(_function);
          int _xifexpression = (int) 0;
          Long _get = current_item.get(Integer.valueOf(Monkey.this.divisibility));
          boolean _equals = ((_get).longValue() == 0);
          if (_equals) {
            _xifexpression = Monkey.this.ifTrue;
          } else {
            _xifexpression = Monkey.this.ifFalse;
          }
          Day11.congruences.get(_xifexpression).add(current_item);
        }
      };
      new ExclusiveRange(0, _size, true).forEach(_function);
    }

    public String toString() {
      return (((("Items " + this.items) + "(") + Long.valueOf(this.inspected)) + ")\n");
    }
  }

  private static final List<String> inputs = new InputLoader(Integer.valueOf(2022), Integer.valueOf(11)).getInputs();

  private static final List<Day11.Monkey> monkeys = new Function0<List<Day11.Monkey>>() {
    public List<Day11.Monkey> apply() {
      ArrayList<Day11.Monkey> _xblockexpression = null;
      {
        final ArrayList<Day11.Monkey> output = CollectionLiterals.<Day11.Monkey>newArrayList();
        final Consumer<Integer> _function = new Consumer<Integer>() {
          public void accept(final Integer it) {
            List<String> _subList = Day11.inputs.subList((((it).intValue() * 7) + 1), (((it).intValue() * 7) + 6));
            Day11.Monkey _monkey = new Day11.Monkey(_subList);
            output.add(_monkey);
          }
        };
        new IntegerRange(0, 7).forEach(_function);
        _xblockexpression = output;
      }
      return _xblockexpression;
    }
  }.apply();

  private static final ArrayList<ArrayList<HashMap<Integer, Long>>> congruences = new Function0<ArrayList<ArrayList<HashMap<Integer, Long>>>>() {
    public ArrayList<ArrayList<HashMap<Integer, Long>>> apply() {
      ArrayList<ArrayList<HashMap<Integer, Long>>> _xblockexpression = null;
      {
        final ArrayList<ArrayList<HashMap<Integer, Long>>> output = CollectionLiterals.<ArrayList<HashMap<Integer, Long>>>newArrayList();
        final Consumer<Integer> _function = new Consumer<Integer>() {
          public void accept(final Integer i) {
            final ArrayList<HashMap<Integer, Long>> newOne = CollectionLiterals.<HashMap<Integer, Long>>newArrayList();
            output.add(newOne);
            final Day11.Monkey currentMonkey = Day11.monkeys.get((i).intValue());
            final Consumer<Long> _function = new Consumer<Long>() {
              public void accept(final Long item) {
                final HashMap<Integer, Long> newCongruences = CollectionLiterals.<Integer, Long>newHashMap();
                newOne.add(newCongruences);
                final Function1<Day11.Monkey, Integer> _function = new Function1<Day11.Monkey, Integer>() {
                  public Integer apply(final Day11.Monkey it) {
                    return Integer.valueOf(it.divisibility);
                  }
                };
                final Consumer<Integer> _function_1 = new Consumer<Integer>() {
                  public void accept(final Integer div) {
                    newCongruences.put(div, Long.valueOf(((item).longValue() % (div).intValue())));
                  }
                };
                ListExtensions.<Day11.Monkey, Integer>map(Day11.monkeys, _function).forEach(_function_1);
              }
            };
            currentMonkey.items.forEach(_function);
          }
        };
        new IntegerRange(0, 7).forEach(_function);
        _xblockexpression = output;
      }
      return _xblockexpression;
    }
  }.apply();

  public static void main(final String[] args) {
    final Consumer<Integer> _function = new Consumer<Integer>() {
      public void accept(final Integer it) {
        final Consumer<Day11.Monkey> _function = new Consumer<Day11.Monkey>() {
          public void accept(final Day11.Monkey it_1) {
            it_1.play();
          }
        };
        Day11.monkeys.forEach(_function);
      }
    };
    new ExclusiveRange(0, 20, true).forEach(_function);
    final Function1<Day11.Monkey, Long> _function_1 = new Function1<Day11.Monkey, Long>() {
      public Long apply(final Day11.Monkey it) {
        return Long.valueOf((-it.inspected));
      }
    };
    List<Day11.Monkey> sorted = IterableExtensions.<Day11.Monkey, Long>sortBy(Day11.monkeys, _function_1);
    InputOutput.<Long>println(Long.valueOf((sorted.get(0).inspected * sorted.get(1).inspected)));
    final Consumer<Day11.Monkey> _function_2 = new Consumer<Day11.Monkey>() {
      public void accept(final Day11.Monkey it) {
        it.inspected = 0;
      }
    };
    Day11.monkeys.forEach(_function_2);
    final Consumer<Integer> _function_3 = new Consumer<Integer>() {
      public void accept(final Integer it) {
        final Consumer<Day11.Monkey> _function = new Consumer<Day11.Monkey>() {
          public void accept(final Day11.Monkey it_1) {
            it_1.playSmart();
          }
        };
        Day11.monkeys.forEach(_function);
      }
    };
    new ExclusiveRange(0, 10000, true).forEach(_function_3);
    final Function1<Day11.Monkey, Long> _function_4 = new Function1<Day11.Monkey, Long>() {
      public Long apply(final Day11.Monkey it) {
        return Long.valueOf((-it.inspected));
      }
    };
    sorted = IterableExtensions.<Day11.Monkey, Long>sortBy(Day11.monkeys, _function_4);
    InputOutput.<Long>println(Long.valueOf((sorted.get(0).inspected * sorted.get(1).inspected)));
  }
}
