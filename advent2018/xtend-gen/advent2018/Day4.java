package advent2018;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.BiFunction;

import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

import adventutils.input.InputLoader;

@SuppressWarnings("all")
public class Day4 {
  public static void main(final String[] args) {
    final SimpleDateFormat my_parser = new SimpleDateFormat("[yyyy-MM-dd HH:mm]");
    final Calendar calendar = GregorianCalendar.getInstance();
    final Function1<String, Pair<Date, List<String>>> _function = (String it) -> {
      try {
        Pair<Date, List<String>> _xblockexpression = null;
        {
          final String[] split = it.split(" ");
          Date _parse = my_parser.parse((split[0]).concat(" ").concat(split[1]));
          List<String> _subList = ((List<String>)Conversions.doWrapArray(split)).subList(2, ((List<String>)Conversions.doWrapArray(split)).size());
          _xblockexpression = Pair.<Date, List<String>>of(_parse, _subList);
        }
        return _xblockexpression;
      } catch (Throwable _e) {
        throw Exceptions.sneakyThrow(_e);
      }
    };
    final Function1<Pair<Date, List<String>>, Date> _function_1 = (Pair<Date, List<String>> it) -> {
      return it.getKey();
    };
    final List<Pair<Date, List<String>>> input = IterableExtensions.<Pair<Date, List<String>>, Date>sortBy(ListExtensions.<String, Pair<Date, List<String>>>map(new InputLoader(Integer.valueOf(2018), Integer.valueOf(4)).getInputs(), _function), _function_1);
    final HashMap<Integer, ArrayList<Integer>> sleeping_time = CollectionLiterals.<Integer, ArrayList<Integer>>newHashMap();
    int current_guard = 0;
    int previous_time = 0;
    int current_time = 0;
    for (final Pair<Date, List<String>> p : input) {
      {
        calendar.setTime(p.getKey());
        current_time = calendar.get(Calendar.MINUTE);
        String _get = p.getValue().get(0);
        if (_get != null) {
          switch (_get) {
            case "Guard":
              current_guard = Integer.parseInt(p.getValue().get(1).replace("#", ""));
              break;
            case "falls":
              previous_time = current_time;
              break;
            default:
              {
                final ArrayList<Integer> new_list = CollectionLiterals.<Integer>newArrayList();
                ExclusiveRange _doubleDotLessThan = new ExclusiveRange(previous_time, current_time, true);
                for (final Integer i : _doubleDotLessThan) {
                  new_list.add(i);
                }
                final BiFunction<ArrayList<Integer>, ArrayList<Integer>, ArrayList<Integer>> _function_2 = (ArrayList<Integer> o, ArrayList<Integer> n) -> {
                  ArrayList<Integer> _xblockexpression = null;
                  {
                    o.addAll(n);
                    _xblockexpression = o;
                  }
                  return _xblockexpression;
                };
                sleeping_time.merge(Integer.valueOf(current_guard), new_list, _function_2);
              }
              break;
          }
        } else {
          {
            final ArrayList<Integer> new_list = CollectionLiterals.<Integer>newArrayList();
            ExclusiveRange _doubleDotLessThan = new ExclusiveRange(previous_time, current_time, true);
            for (final Integer i : _doubleDotLessThan) {
              new_list.add(i);
            }
            final BiFunction<ArrayList<Integer>, ArrayList<Integer>, ArrayList<Integer>> _function_2 = (ArrayList<Integer> o, ArrayList<Integer> n) -> {
              ArrayList<Integer> _xblockexpression = null;
              {
                o.addAll(n);
                _xblockexpression = o;
              }
              return _xblockexpression;
            };
            sleeping_time.merge(Integer.valueOf(current_guard), new_list, _function_2);
          }
        }
      }
    }
    final Function1<Map.Entry<Integer, ArrayList<Integer>>, Integer> _function_2 = (Map.Entry<Integer, ArrayList<Integer>> it) -> {
      return Integer.valueOf(it.getValue().size());
    };
    final Map.Entry<Integer, ArrayList<Integer>> more_sleep = IterableExtensions.<Map.Entry<Integer, ArrayList<Integer>>, Integer>maxBy(sleeping_time.entrySet(), _function_2);
    final Integer id_more_sleep = more_sleep.getKey();
    final Function1<Integer, Integer> _function_3 = (Integer it) -> {
      return it;
    };
    final Function1<Map.Entry<Integer, List<Integer>>, Integer> _function_4 = (Map.Entry<Integer, List<Integer>> it) -> {
      return Integer.valueOf(it.getValue().size());
    };
    final Integer max_minute_more_sleep = IterableExtensions.<Map.Entry<Integer, List<Integer>>, Integer>maxBy(IterableExtensions.<Integer, Integer>groupBy(more_sleep.getValue(), _function_3).entrySet(), _function_4).getKey();
    InputOutput.<Integer>println(Integer.valueOf(((id_more_sleep).intValue() * (max_minute_more_sleep).intValue())));
    final Function1<Map.Entry<Integer, ArrayList<Integer>>, Pair<Integer, Map.Entry<Integer, List<Integer>>>> _function_5 = (Map.Entry<Integer, ArrayList<Integer>> it) -> {
      Integer _key = it.getKey();
      final Function1<Integer, Integer> _function_6 = (Integer it_1) -> {
        return it_1;
      };
      final Function1<Map.Entry<Integer, List<Integer>>, Integer> _function_7 = (Map.Entry<Integer, List<Integer>> it_1) -> {
        return Integer.valueOf(it_1.getValue().size());
      };
      Map.Entry<Integer, List<Integer>> _maxBy = IterableExtensions.<Map.Entry<Integer, List<Integer>>, Integer>maxBy(IterableExtensions.<Integer, Integer>groupBy(it.getValue(), _function_6).entrySet(), _function_7);
      return Pair.<Integer, Map.Entry<Integer, List<Integer>>>of(_key, _maxBy);
    };
    final Function1<Pair<Integer, Map.Entry<Integer, List<Integer>>>, Integer> _function_6 = (Pair<Integer, Map.Entry<Integer, List<Integer>>> it) -> {
      return Integer.valueOf(it.getValue().getValue().size());
    };
    final Pair<Integer, Map.Entry<Integer, List<Integer>>> golden_entry = IterableExtensions.<Pair<Integer, Map.Entry<Integer, List<Integer>>>, Integer>maxBy(IterableExtensions.<Map.Entry<Integer, ArrayList<Integer>>, Pair<Integer, Map.Entry<Integer, List<Integer>>>>map(sleeping_time.entrySet(), _function_5), _function_6);
    Integer _key = golden_entry.getKey();
    Integer _key_1 = golden_entry.getValue().getKey();
    int _multiply = ((_key).intValue() * (_key_1).intValue());
    InputOutput.<Integer>println(Integer.valueOf(_multiply));
  }
}
