package advent2018;

import java.io.BufferedReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
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

import adventutils.input.InputLoader;

@SuppressWarnings("all")
public class Day16 {
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
      ArrayList<Integer> _newArrayList = CollectionLiterals.<Integer>newArrayList(Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0));
      MiniLang engine = new MiniLang(_newArrayList);
      for (final String c : all_commands) {
        {
          final Function1<String, Integer> _function_1 = (String it) -> {
            return Integer.valueOf(Integer.parseInt(it));
          };
          final List<Integer> indices = ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray(c.split(" "))), _function_1);
          engine.execute(IterableExtensions.<String>head(rules.get(indices.get(0))), (indices.get(1)).intValue(), (indices.get(2)).intValue(), (indices.get(3)).intValue());
        }
      }
      InputOutput.<Integer>println(engine.registry.get(0));
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
          final MiniLang engine = new MiniLang(input);
          engine.execute(v, (a).intValue(), (b).intValue(), (c).intValue());
          boolean _equals = engine.registry.equals(after);
          if (_equals) {
            acc.add(v);
          }
          _xblockexpression_1 = acc;
        }
        return _xblockexpression_1;
      };
      _xblockexpression = IterableExtensions.<String, HashSet<String>>fold(MiniLang.instructions, CollectionLiterals.<String>newHashSet(), _function);
    }
    return _xblockexpression;
  }
}
