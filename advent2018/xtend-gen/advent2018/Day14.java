package advent2018;

import java.util.List;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Day14 {
  private static final int index = 513401;

  private static List<Integer> recipes = CollectionLiterals.<Integer>newArrayList(Integer.valueOf(3), Integer.valueOf(7));

  private static int elf_1 = 0;

  private static int elf_2 = 1;

  public static void main(final String[] args) {
    while ((Day14.recipes.size() < (Day14.index + 10))) {
      Day14.step();
    }
    InputOutput.<String>println(IterableExtensions.join(Day14.recipes.subList(Day14.index, (Day14.index + 10))));
    IntegerRange _upTo = new IntegerRange(0, 25000000);
    for (final Integer i : _upTo) {
      Day14.step();
    }
    int _size = Day14.recipes.size();
    int _minus = (_size - 6);
    final Function1<Integer, Boolean> _function = (Integer it) -> {
      return Boolean.valueOf(IterableExtensions.join(Day14.recipes.subList((it).intValue(), ((it).intValue() + 6))).equals(Integer.valueOf(Day14.index).toString()));
    };
    InputOutput.<Integer>println(IterableExtensions.<Integer>findFirst(new ExclusiveRange(0, _minus, true), _function));
  }

  public static void step() {
    Integer _get = Day14.recipes.get(Day14.elf_1);
    Integer _get_1 = Day14.recipes.get(Day14.elf_2);
    final int sum = ((_get).intValue() + (_get_1).intValue());
    final Function1<Character, Integer> _function = (Character it) -> {
      return Integer.valueOf(Integer.parseInt(it.toString()));
    };
    Day14.recipes.addAll(ListExtensions.<Character, Integer>map(((List<Character>)Conversions.doWrapArray(Integer.valueOf(sum).toString().toCharArray())), _function));
    Integer _get_2 = Day14.recipes.get(Day14.elf_1);
    int _plus = ((_get_2).intValue() + Day14.elf_1);
    int _plus_1 = (_plus + 1);
    int _size = Day14.recipes.size();
    int _modulo = (_plus_1 % _size);
    Day14.elf_1 = _modulo;
    Integer _get_3 = Day14.recipes.get(Day14.elf_2);
    int _plus_2 = ((_get_3).intValue() + Day14.elf_2);
    int _plus_3 = (_plus_2 + 1);
    int _size_1 = Day14.recipes.size();
    int _modulo_1 = (_plus_3 % _size_1);
    Day14.elf_2 = _modulo_1;
  }
}
