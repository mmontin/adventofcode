package advent2015.puzzle16;

import advent2015.Utils;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.InputOutput;

@SuppressWarnings("all")
public class Launcher {
  public static void main(final String[] args) {
    try {
      final Consumer<String> _function = new Consumer<String>() {
        public void accept(final String s) {
          final Sue sue = new Sue(s);
          boolean _valid = sue.valid();
          if (_valid) {
            InputOutput.<Integer>println(sue.number);
          }
        }
      };
      Utils.getInputs(16).forEach(_function);
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
}
