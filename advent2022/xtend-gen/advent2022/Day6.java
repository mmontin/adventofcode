package advent2022;

import adventutils.input.InputLoader;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Day6 {
  private static final List<Character> input = (List<Character>)Conversions.doWrapArray(IterableExtensions.<String>head(new InputLoader(Integer.valueOf(2022), Integer.valueOf(6)).getInputs()).toCharArray());

  public static void main(final String[] args) {
    InputOutput.<Integer>println(Day6.compute(4));
    InputOutput.<Integer>println(Day6.compute(14));
  }

  public static Integer compute(final int nb) {
    int _size = Day6.input.size();
    final Function1<Integer, Boolean> _function = new Function1<Integer, Boolean>() {
      public Boolean apply(final Integer it) {
        int _size = IterableExtensions.<Character>toSet(Day6.input.subList(((it).intValue() - nb), (it).intValue())).size();
        return Boolean.valueOf((_size == nb));
      }
    };
    return IterableExtensions.<Integer>findFirst(new IntegerRange(nb, _size), _function);
  }
}
