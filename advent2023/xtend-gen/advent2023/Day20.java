package advent2023;

import adventutils.input.InputLoader;
import com.google.common.base.Objects;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Queue;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionExtensions;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day20 {
  protected static Map<String, advent2023.Module> modules = CollectionLiterals.<String, advent2023.Module>newHashMap(Pair.<String, advent2023.Module>of("button", new Button()));

  private static Queue<Pair<String, Pair<Boolean, String>>> messages = CollectionLiterals.<Pair<String, Pair<Boolean, String>>>newLinkedList();

  private static int low_pulses = 0;

  private static int high_pulses = 0;

  public static void main(final String[] args) {
    final Set<String> all_receivers = CollectionLiterals.<String>newHashSet();
    final Function1<String, Boolean> _function = new Function1<String, Boolean>() {
      public Boolean apply(final String it) {
        boolean _isBlank = it.isBlank();
        return Boolean.valueOf((!_isBlank));
      }
    };
    final Consumer<String> _function_1 = new Consumer<String>() {
      public void accept(final String it) {
        final String[] split = it.split(" -> ");
        final String[] receivers = (split[1]).split(", ");
        CollectionExtensions.<String>addAll(all_receivers, receivers);
        String _get = split[0];
        final String x = _get;
        boolean _matched = false;
        if (Objects.equal(x, "broadcaster")) {
          _matched=true;
          BroadCaster _broadCaster = new BroadCaster((List<String>)Conversions.doWrapArray(receivers));
          Day20.modules.put("broadcaster", _broadCaster);
        }
        if (!_matched) {
          boolean _startsWith = x.startsWith("&");
          if (_startsWith) {
            _matched=true;
            String _substring = x.substring(1);
            Conjunction _conjunction = new Conjunction((List<String>)Conversions.doWrapArray(receivers));
            Day20.modules.put(_substring, _conjunction);
          }
        }
        if (!_matched) {
          String _substring_1 = x.substring(1);
          FlipFlop _flipFlop = new FlipFlop((List<String>)Conversions.doWrapArray(receivers));
          Day20.modules.put(_substring_1, _flipFlop);
        }
      }
    };
    IterableExtensions.<String>filter(new InputLoader(Integer.valueOf(2023), Integer.valueOf(20)).getInputs(), _function).forEach(_function_1);
    final Consumer<String> _function_2 = new Consumer<String>() {
      public void accept(final String it) {
        boolean _containsKey = Day20.modules.containsKey(it);
        boolean _not = (!_containsKey);
        if (_not) {
          ArrayList<String> _newArrayList = CollectionLiterals.<String>newArrayList();
          BroadCaster _broadCaster = new BroadCaster(_newArrayList);
          Day20.modules.put(it, _broadCaster);
        }
      }
    };
    all_receivers.forEach(_function_2);
    final Consumer<Map.Entry<String, advent2023.Module>> _function_3 = new Consumer<Map.Entry<String, advent2023.Module>>() {
      public void accept(final Map.Entry<String, advent2023.Module> it) {
        final List<String> targets = it.getValue().targets;
        final Function1<String, advent2023.Module> _function = new Function1<String, advent2023.Module>() {
          public advent2023.Module apply(final String it_1) {
            return Day20.modules.get(it_1);
          }
        };
        final Consumer<advent2023.Module> _function_1 = new Consumer<advent2023.Module>() {
          public void accept(final advent2023.Module tar) {
            if ((tar instanceof Conjunction)) {
              ((Conjunction) tar).addSource(it.getKey());
            }
          }
        };
        ListExtensions.<String, advent2023.Module>map(targets, _function).forEach(_function_1);
      }
    };
    Day20.modules.entrySet().forEach(_function_3);
    Day20.printState();
    final Consumer<Integer> _function_4 = new Consumer<Integer>() {
      public void accept(final Integer it) {
        try {
          Day20.pushButton();
          Day20.printState();
          Thread.sleep(200);
        } catch (Throwable _e) {
          throw Exceptions.sneakyThrow(_e);
        }
      }
    };
    new IntegerRange(1, 1000).forEach(_function_4);
    InputOutput.<Integer>println(Integer.valueOf((Day20.low_pulses * Day20.high_pulses)));
  }

  public static String printState() {
    String _xblockexpression = null;
    {
      InputOutput.<String>println("---------------------------------------");
      final Function1<Map.Entry<String, advent2023.Module>, Boolean> _function = new Function1<Map.Entry<String, advent2023.Module>, Boolean>() {
        public Boolean apply(final Map.Entry<String, advent2023.Module> it) {
          advent2023.Module _value = it.getValue();
          return Boolean.valueOf((_value instanceof Conjunction));
        }
      };
      final Function1<Map.Entry<String, advent2023.Module>, String> _function_1 = new Function1<Map.Entry<String, advent2023.Module>, String>() {
        public String apply(final Map.Entry<String, advent2023.Module> it) {
          String _key = it.getKey();
          String _plus = (_key + " : ");
          advent2023.Module _value = it.getValue();
          final Function1<Map.Entry<String, Boolean>, String> _function = new Function1<Map.Entry<String, Boolean>, String>() {
            public String apply(final Map.Entry<String, Boolean> it_1) {
              return it_1.getKey();
            }
          };
          final Function1<Map.Entry<String, Boolean>, Boolean> _function_1 = new Function1<Map.Entry<String, Boolean>, Boolean>() {
            public Boolean apply(final Map.Entry<String, Boolean> it_1) {
              return it_1.getValue();
            }
          };
          final Function1<Boolean, String> _function_2 = new Function1<Boolean, String>() {
            public String apply(final Boolean it_1) {
              String _xifexpression = null;
              if ((it_1).booleanValue()) {
                _xifexpression = "1";
              } else {
                _xifexpression = "0";
              }
              return _xifexpression;
            }
          };
          final Function2<String, String, String> _function_3 = new Function2<String, String, String>() {
            public String apply(final String x, final String y) {
              return (x + y);
            }
          };
          String _reduce = IterableExtensions.<String>reduce(ListExtensions.<Boolean, String>map(ListExtensions.<Map.Entry<String, Boolean>, Boolean>map(IterableExtensions.<Map.Entry<String, Boolean>, String>sortBy(((Conjunction) _value).sources.entrySet(), _function), _function_1), _function_2), _function_3);
          return (_plus + _reduce);
        }
      };
      _xblockexpression = InputOutput.<String>println(IterableExtensions.join(IterableExtensions.<Map.Entry<String, advent2023.Module>, String>map(IterableExtensions.<Map.Entry<String, advent2023.Module>>filter(Day20.modules.entrySet(), _function), _function_1), "; "));
    }
    return _xblockexpression;
  }

  public static void pushButton() {
    final Consumer<Pair<Boolean, String>> _function = new Consumer<Pair<Boolean, String>>() {
      public void accept(final Pair<Boolean, String> it) {
        Pair<String, Pair<Boolean, String>> _mappedTo = Pair.<String, Pair<Boolean, String>>of("button", it);
        Day20.messages.add(_mappedTo);
      }
    };
    Day20.modules.get("button").receiveAndSend(null, false).forEach(_function);
    while ((!Day20.messages.isEmpty())) {
      Day20.processMessage(Day20.messages.poll());
    }
  }

  public static int processMessage(final Pair<String, Pair<Boolean, String>> message) {
    int _xblockexpression = (int) 0;
    {
      final String source = message.getKey();
      final Boolean signal = message.getValue().getKey();
      final String target = message.getValue().getValue();
      final List<Pair<Boolean, String>> response = Day20.modules.get(target).receiveAndSend(source, (signal).booleanValue());
      final Function1<Pair<Boolean, String>, Pair<String, Pair<Boolean, String>>> _function = new Function1<Pair<Boolean, String>, Pair<String, Pair<Boolean, String>>>() {
        public Pair<String, Pair<Boolean, String>> apply(final Pair<Boolean, String> it) {
          return Pair.<String, Pair<Boolean, String>>of(target, it);
        }
      };
      Day20.messages.addAll(ListExtensions.<Pair<Boolean, String>, Pair<String, Pair<Boolean, String>>>map(response, _function));
      int _xifexpression = (int) 0;
      if ((signal).booleanValue()) {
        _xifexpression = Day20.high_pulses++;
      } else {
        _xifexpression = Day20.low_pulses++;
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }
}
