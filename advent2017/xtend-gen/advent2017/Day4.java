package advent2017;

import adventutils.input.InputLoader;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Day4 {
  public static void main(final String[] args) {
    final List<String> inputs = new InputLoader(Integer.valueOf(2017), Integer.valueOf(4)).getInputs();
    final Function1<String, Boolean> _function = (String it) -> {
      boolean _xblockexpression = false;
      {
        final String[] words = it.split(" ");
        int _size = IterableExtensions.<String>toSet(((Iterable<String>)Conversions.doWrapArray(words))).size();
        int _size_1 = ((List<String>)Conversions.doWrapArray(words)).size();
        _xblockexpression = (_size == _size_1);
      }
      return Boolean.valueOf(_xblockexpression);
    };
    InputOutput.<Integer>println(
      Integer.valueOf(IterableExtensions.size(IterableExtensions.<String>filter(inputs, _function))));
    final Function1<String, Boolean> _function_1 = (String it) -> {
      boolean _xblockexpression = false;
      {
        final Function1<String, List<Character>> _function_2 = (String it_1) -> {
          return IterableExtensions.<Character>sort(((Iterable<Character>)Conversions.doWrapArray(it_1.toCharArray())));
        };
        final List<List<Character>> words = ListExtensions.<String, List<Character>>map(((List<String>)Conversions.doWrapArray(it.split(" "))), _function_2);
        int _size = IterableExtensions.<List<Character>>toSet(words).size();
        int _size_1 = words.size();
        _xblockexpression = (_size == _size_1);
      }
      return Boolean.valueOf(_xblockexpression);
    };
    InputOutput.<Integer>println(
      Integer.valueOf(IterableExtensions.size(IterableExtensions.<String>filter(inputs, _function_1))));
  }
}
