package advent2018;

import java.util.HashSet;
import java.util.List;

import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

import adventutils.input.InputLoader;

@SuppressWarnings("all")
public class Day1 {
  public static void main(final String[] args) {
    final Function1<String, Integer> _function = (String it) -> {
      return Integer.valueOf(Integer.parseInt(it));
    };
    final List<Integer> frequencies = ListExtensions.<String, Integer>map(new InputLoader(Integer.valueOf(2018), Integer.valueOf(1)).getInputs(), _function);
    final Function2<Integer, Integer, Integer> _function_1 = (Integer x, Integer y) -> {
      return Integer.valueOf(((x).intValue() + (y).intValue()));
    };
    InputOutput.<Integer>println(IterableExtensions.<Integer>reduce(frequencies, _function_1));
    final HashSet<Integer> visited = CollectionLiterals.<Integer>newHashSet();
    int i = 0;
    int current = 0;
    do {
      {
        visited.add(Integer.valueOf(current));
        int _current = current;
        int _size = frequencies.size();
        int _modulo = (i % _size);
        Integer _get = frequencies.get(_modulo);
        current = (_current + (_get).intValue());
        i++;
      }
    } while((!visited.contains(Integer.valueOf(current))));
    InputOutput.<Integer>println(Integer.valueOf(current));
  }
}
