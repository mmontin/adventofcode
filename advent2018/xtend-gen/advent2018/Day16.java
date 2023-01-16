package advent2018;

import adventutils.input.InputLoader;
import com.google.common.base.Objects;
import java.io.BufferedReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.function.BiFunction;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Day16 {
  private static final Set<String> instructions = CollectionLiterals.<String>newHashSet(
    "addr", 
    "addi", 
    "mulr", 
    "muli", 
    "borr", 
    "bori", 
    "banr", 
    "bani", 
    "setr", 
    "seti", 
    "gtir", 
    "gtri", 
    "gtrr", 
    "eqir", 
    "eqri", 
    "eqrr");

  public static void main(final String[] args) {
    try {
      final BufferedReader br = new InputLoader(Integer.valueOf(2018), Integer.valueOf(16)).getInputReader();
      int i = 0;
      String before = br.readLine();
      String command = br.readLine();
      String after = br.readLine();
      br.readLine();
      final HashMap<Integer, HashSet<String>> rules = CollectionLiterals.<Integer, HashSet<String>>newHashMap();
      while ((!before.equals(""))) {
        {
          final Function1<String, Integer> _function = (String it) -> {
            return Integer.valueOf(Integer.parseInt(it));
          };
          final List<Integer> my_command = ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray(command.split(" "))), _function);
          final HashSet<String> possible_instructions = Day16.possible(my_command, 
            Day16.stringToList(before.split("Before: ")[1]), 
            Day16.stringToList(after.split("After:  ")[1]));
          int _size = possible_instructions.size();
          boolean _greaterEqualsThan = (_size >= 3);
          if (_greaterEqualsThan) {
            i++;
          }
          final BiFunction<HashSet<String>, HashSet<String>, HashSet<String>> _function_1 = (HashSet<String> u, HashSet<String> v) -> {
            HashSet<String> _xblockexpression = null;
            {
              u.retainAll(v);
              _xblockexpression = u;
            }
            return _xblockexpression;
          };
          rules.merge(my_command.get(0), possible_instructions, _function_1);
          before = br.readLine();
          command = br.readLine();
          after = br.readLine();
          br.readLine();
        }
      }
      final HashSet<String> assigned = CollectionLiterals.<String>newHashSet();
      final Function1<HashSet<String>, Boolean> _function = (HashSet<String> it) -> {
        int _size = it.size();
        return Boolean.valueOf((_size == 1));
      };
      HashSet<String> next = IterableExtensions.<HashSet<String>>findFirst(rules.values(), _function);
      while ((next != null)) {
        {
          final String current_next = IterableExtensions.<String>head(next);
          final Consumer<HashSet<String>> _function_1 = (HashSet<String> v) -> {
            int _size = v.size();
            boolean _greaterThan = (_size > 1);
            if (_greaterThan) {
              v.remove(current_next);
            }
          };
          rules.values().forEach(_function_1);
          assigned.add(current_next);
          final Function1<HashSet<String>, Boolean> _function_2 = (HashSet<String> it) -> {
            return Boolean.valueOf(((it.size() == 1) && (!assigned.contains(IterableExtensions.<String>head(it)))));
          };
          next = IterableExtensions.<HashSet<String>>findFirst(rules.values(), _function_2);
        }
      }
      InputOutput.<Integer>println(Integer.valueOf(i));
      final ArrayList<String> all_commands = CollectionLiterals.<String>newArrayList(after);
      String current_line = br.readLine();
      while ((current_line != null)) {
        {
          all_commands.add(current_line);
          current_line = br.readLine();
        }
      }
      br.close();
      ArrayList<Integer> initial_state = CollectionLiterals.<Integer>newArrayList(Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0));
      for (final String c : all_commands) {
        {
          final Function1<String, Integer> _function_1 = (String it) -> {
            return Integer.valueOf(Integer.parseInt(it));
          };
          final List<Integer> indices = ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray(c.split(" "))), _function_1);
          Day16.execute(IterableExtensions.<String>head(rules.get(indices.get(0))), (indices.get(1)).intValue(), (indices.get(2)).intValue(), (indices.get(3)).intValue(), initial_state);
        }
      }
      InputOutput.<Integer>println(initial_state.get(0));
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }

  public static List<Integer> stringToList(final String s) {
    int _length = s.length();
    int _minus = (_length - 1);
    final Function1<String, Integer> _function = (String it) -> {
      return Integer.valueOf(Integer.parseInt(it));
    };
    return ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray(s.substring(1, _minus).split(", "))), _function);
  }

  public static HashSet<String> possible(final List<Integer> command, final List<Integer> before, final List<Integer> after) {
    HashSet<String> _xblockexpression = null;
    {
      final Integer a = command.get(1);
      final Integer b = command.get(2);
      final Integer c = command.get(3);
      final Function2<HashSet<String>, String, HashSet<String>> _function = (HashSet<String> acc, String v) -> {
        HashSet<String> _xblockexpression_1 = null;
        {
          final ArrayList<Integer> input = new ArrayList<Integer>(before);
          Day16.execute(v, (a).intValue(), (b).intValue(), (c).intValue(), input);
          boolean _equals = input.equals(after);
          if (_equals) {
            acc.add(v);
          }
          _xblockexpression_1 = acc;
        }
        return _xblockexpression_1;
      };
      _xblockexpression = IterableExtensions.<String, HashSet<String>>fold(Day16.instructions, CollectionLiterals.<String>newHashSet(), _function);
    }
    return _xblockexpression;
  }

  public static Integer execute(final String instr, final int a, final int b, final int c, final List<Integer> registry) {
    Integer _switchResult = null;
    if (instr != null) {
      switch (instr) {
        case "addr":
          Integer _get = registry.get(a);
          Integer _get_1 = registry.get(b);
          int _plus = ((_get).intValue() + (_get_1).intValue());
          _switchResult = registry.set(c, Integer.valueOf(_plus));
          break;
        case "addi":
          Integer _get_2 = registry.get(a);
          int _plus_1 = ((_get_2).intValue() + b);
          _switchResult = registry.set(c, Integer.valueOf(_plus_1));
          break;
        case "mulr":
          Integer _get_3 = registry.get(a);
          Integer _get_4 = registry.get(b);
          int _multiply = ((_get_3).intValue() * (_get_4).intValue());
          _switchResult = registry.set(c, Integer.valueOf(_multiply));
          break;
        case "muli":
          Integer _get_5 = registry.get(a);
          int _multiply_1 = ((_get_5).intValue() * b);
          _switchResult = registry.set(c, Integer.valueOf(_multiply_1));
          break;
        case "borr":
          _switchResult = registry.set(c, Integer.valueOf(((registry.get(a)).intValue() | (registry.get(b)).intValue())));
          break;
        case "bori":
          _switchResult = registry.set(c, Integer.valueOf(((registry.get(a)).intValue() | b)));
          break;
        case "banr":
          _switchResult = registry.set(c, Integer.valueOf(((registry.get(a)).intValue() & (registry.get(b)).intValue())));
          break;
        case "bani":
          _switchResult = registry.set(c, Integer.valueOf(((registry.get(a)).intValue() & b)));
          break;
        case "setr":
          _switchResult = registry.set(c, registry.get(a));
          break;
        case "seti":
          _switchResult = registry.set(c, Integer.valueOf(a));
          break;
        case "gtir":
          int _xifexpression = (int) 0;
          Integer _get_6 = registry.get(b);
          boolean _greaterThan = (a > (_get_6).intValue());
          if (_greaterThan) {
            _xifexpression = 1;
          } else {
            _xifexpression = 0;
          }
          _switchResult = registry.set(c, Integer.valueOf(_xifexpression));
          break;
        case "gtri":
          int _xifexpression_1 = (int) 0;
          Integer _get_7 = registry.get(a);
          boolean _greaterThan_1 = ((_get_7).intValue() > b);
          if (_greaterThan_1) {
            _xifexpression_1 = 1;
          } else {
            _xifexpression_1 = 0;
          }
          _switchResult = registry.set(c, Integer.valueOf(_xifexpression_1));
          break;
        case "gtrr":
          int _xifexpression_2 = (int) 0;
          Integer _get_8 = registry.get(a);
          Integer _get_9 = registry.get(b);
          boolean _greaterThan_2 = (_get_8.compareTo(_get_9) > 0);
          if (_greaterThan_2) {
            _xifexpression_2 = 1;
          } else {
            _xifexpression_2 = 0;
          }
          _switchResult = registry.set(c, Integer.valueOf(_xifexpression_2));
          break;
        case "eqir":
          int _xifexpression_3 = (int) 0;
          Integer _get_10 = registry.get(b);
          boolean _equals = (a == (_get_10).intValue());
          if (_equals) {
            _xifexpression_3 = 1;
          } else {
            _xifexpression_3 = 0;
          }
          _switchResult = registry.set(c, Integer.valueOf(_xifexpression_3));
          break;
        case "eqri":
          int _xifexpression_4 = (int) 0;
          Integer _get_11 = registry.get(a);
          boolean _equals_1 = ((_get_11).intValue() == b);
          if (_equals_1) {
            _xifexpression_4 = 1;
          } else {
            _xifexpression_4 = 0;
          }
          _switchResult = registry.set(c, Integer.valueOf(_xifexpression_4));
          break;
        case "eqrr":
          int _xifexpression_5 = (int) 0;
          Integer _get_12 = registry.get(a);
          Integer _get_13 = registry.get(b);
          boolean _equals_2 = Objects.equal(_get_12, _get_13);
          if (_equals_2) {
            _xifexpression_5 = 1;
          } else {
            _xifexpression_5 = 0;
          }
          _switchResult = registry.set(c, Integer.valueOf(_xifexpression_5));
          break;
      }
    }
    return _switchResult;
  }
}
