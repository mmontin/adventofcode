package advent2024;

import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Day1 {
  public static void main(final String[] args) {
    final List<String> lines = new InputLoader(Integer.valueOf(2024), Integer.valueOf(1)).getInputs();
    final ArrayList<Integer> lefts = CollectionLiterals.<Integer>newArrayList();
    final ArrayList<Integer> rights = CollectionLiterals.<Integer>newArrayList();
    final Consumer<String> _function = (String it) -> {
      final String[] splitted = it.split("   ");
      lefts.add(Integer.valueOf(Integer.parseInt(splitted[0])));
      rights.add(Integer.valueOf(Integer.parseInt(splitted[1])));
    };
    lines.forEach(_function);
    final List<Integer> lefts_sorted = IterableExtensions.<Integer>toList(IterableExtensions.<Integer>sort(lefts));
    final List<Integer> rights_sorted = IterableExtensions.<Integer>toList(IterableExtensions.<Integer>sort(rights));
    int ans = 0;
    int _size = lines.size();
    int _minus = (_size - 1);
    IntegerRange _upTo = new IntegerRange(0, _minus);
    for (final Integer i : _upTo) {
      int _ans = ans;
      Integer _get = lefts_sorted.get((i).intValue());
      Integer _get_1 = rights_sorted.get((i).intValue());
      int _minus_1 = ((_get).intValue() - (_get_1).intValue());
      int _abs = Math.abs(_minus_1);
      ans = (_ans + _abs);
    }
    InputOutput.<Integer>println(Integer.valueOf(ans));
    final Function2<Integer, Integer, Integer> _function_1 = (Integer acc, Integer el) -> {
      int _frequency = Collections.frequency(rights_sorted, el);
      int _multiply = ((el).intValue() * _frequency);
      return Integer.valueOf(((acc).intValue() + _multiply));
    };
    InputOutput.<Integer>println(IterableExtensions.<Integer, Integer>fold(lefts_sorted, Integer.valueOf(0), _function_1));
  }
}
