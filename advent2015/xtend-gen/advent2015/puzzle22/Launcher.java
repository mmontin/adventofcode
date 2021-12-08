package advent2015.puzzle22;

import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Launcher {
  public static void main(final String[] args) {
    final Board b = new Board();
    final Function2<Integer, Spells, Integer> _function = new Function2<Integer, Spells, Integer>() {
      public Integer apply(final Integer v, final Spells s) {
        return Integer.valueOf(Math.min((v).intValue(), new Board(b).step(true, s)));
      }
    };
    InputOutput.<Integer>println(IterableExtensions.<Spells, Integer>fold(b.availableSpells(), Integer.valueOf(Integer.MAX_VALUE), _function));
  }
}
