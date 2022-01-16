package advent2015.puzzle16;

import adventutils.input.InputLoader;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.InputOutput;

@SuppressWarnings("all")
public class Launcher {
  public static void main(final String[] args) {
    final Consumer<String> _function = new Consumer<String>() {
      public void accept(final String s) {
        final Sue sue = new Sue(s);
        boolean _valid = sue.valid();
        if (_valid) {
          InputOutput.<Integer>println(sue.number);
        }
      }
    };
    new InputLoader(Integer.valueOf(2015), Integer.valueOf(16)).getInputs().forEach(_function);
  }
}
