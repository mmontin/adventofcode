package advent2022;

import adventutils.input.InputLoader;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Day6 {
  private static final List<Character> input = (List<Character>)Conversions.doWrapArray(IterableExtensions.<String>head(new InputLoader(Integer.valueOf(2022), Integer.valueOf(6)).getInputs()).toCharArray());

  public static void main(final String[] args) {
    Day6.compute(4);
    Day6.compute(14);
  }

  public static void compute(final int nb) {
    int i = nb;
    while ((IterableExtensions.<Character>toSet(Day6.input.subList((i - nb), i)).size() < nb)) {
      i++;
    }
    InputOutput.<Integer>println(Integer.valueOf(i));
  }
}
