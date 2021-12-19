package advent2016.puzzle20;

import advent2016.Utils;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.InputOutput;

@SuppressWarnings("all")
public class Launcher {
  public static void main(final String[] args) {
    final Constellation c = new Constellation();
    final Consumer<String> _function = new Consumer<String>() {
      public void accept(final String it) {
        Interval _interval = new Interval(it);
        c.addInterval(_interval);
      }
    };
    Utils.getInputs(20).forEach(_function);
    InputOutput.<Long>println(Long.valueOf(c.firstValid()));
    InputOutput.<Long>println(c.nb_of_valids());
  }
}
