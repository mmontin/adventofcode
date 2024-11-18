package advent2021.puzzle12;

import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.BiFunction;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Launcher {
  private static Map<String, Set<String>> graph = CollectionLiterals.<String, Set<String>>newHashMap();

  private static Set<List<String>> paths = CollectionLiterals.<List<String>>newHashSet();

  public static void main(final String[] args) {
    final Function1<String, String[]> _function = (String it) -> {
      return it.split("-");
    };
    final Consumer<String[]> _function_1 = (String[] it) -> {
      final BiFunction<Set<String>, Set<String>, Set<String>> _function_2 = (Set<String> v, Set<String> w) -> {
        Set<String> _xblockexpression = null;
        {
          v.addAll(w);
          _xblockexpression = v;
        }
        return _xblockexpression;
      };
      Launcher.graph.merge(it[0], CollectionLiterals.<String>newHashSet(it[1]), _function_2);
      final BiFunction<Set<String>, Set<String>, Set<String>> _function_3 = (Set<String> v, Set<String> w) -> {
        Set<String> _xblockexpression = null;
        {
          v.addAll(w);
          _xblockexpression = v;
        }
        return _xblockexpression;
      };
      Launcher.graph.merge(it[1], CollectionLiterals.<String>newHashSet(it[0]), _function_3);
    };
    new InputLoader(Integer.valueOf(2021), Integer.valueOf(12)).<String[]>getInputs(_function).forEach(_function_1);
    Launcher.paths(CollectionLiterals.<String>newArrayList("start"), "start");
    InputOutput.<Integer>println(Integer.valueOf(Launcher.paths.size()));
    Launcher.paths.clear();
    Launcher.paths(CollectionLiterals.<String>newArrayList(), "start");
    InputOutput.<Integer>println(Integer.valueOf(Launcher.paths.size()));
  }

  public static void paths(final List<String> visited, final String current) {
    boolean _equals = current.equals("end");
    if (_equals) {
      Launcher.paths.add(visited);
    } else {
      visited.add(current);
      final Function1<String, Boolean> _function = (String it) -> {
        boolean _equals_1 = it.equals("start");
        return Boolean.valueOf((!_equals_1));
      };
      final Function1<String, Boolean> _function_1 = (String it) -> {
        return Boolean.valueOf((Character.isUpperCase(it.charAt(0)) || ((!Launcher.hasDuplicates(visited)) || (!visited.contains(it)))));
      };
      final Consumer<String> _function_2 = (String it) -> {
        ArrayList<String> _arrayList = new ArrayList<String>(visited);
        Launcher.paths(_arrayList, it);
      };
      IterableExtensions.<String>filter(IterableExtensions.<String>filter(Launcher.graph.get(current), _function), _function_1).forEach(_function_2);
    }
  }

  public static boolean hasDuplicates(final List<String> l) {
    boolean _xblockexpression = false;
    {
      final Function1<String, Boolean> _function = (String it) -> {
        return Boolean.valueOf(Character.isLowerCase(it.charAt(0)));
      };
      final Iterable<String> trim = IterableExtensions.<String>filter(l, _function);
      int _size = IterableExtensions.size(trim);
      int _size_1 = IterableExtensions.<String>toSet(trim).size();
      _xblockexpression = (_size != _size_1);
    }
    return _xblockexpression;
  }
}
