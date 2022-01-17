package advent2016.puzzle12;

import adventutils.input.InputLoader;
import java.util.List;
import java.util.Map;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Launcher {
  private static final Map<String, Integer> registers = CollectionLiterals.<String, Integer>newHashMap(Pair.<String, Integer>of("a", Integer.valueOf(0)), Pair.<String, Integer>of("b", Integer.valueOf(0)), Pair.<String, Integer>of("c", Integer.valueOf(0)), Pair.<String, Integer>of("d", Integer.valueOf(0)));
  
  private static final List<String> input = new InputLoader(Integer.valueOf(2016), Integer.valueOf(12)).getInputs();
  
  public static void main(final String[] args) {
    int pos = 0;
    while ((pos < Launcher.input.size())) {
      {
        final String[] split = Launcher.input.get(pos).split(" ");
        int _length = split.length;
        boolean _equals = (_length == 2);
        if (_equals) {
          Integer _get = Launcher.registers.get(split[1]);
          int _xifexpression = (int) 0;
          boolean _equals_1 = (split[0]).equals("inc");
          if (_equals_1) {
            _xifexpression = 1;
          } else {
            _xifexpression = (-1);
          }
          int _plus = ((_get).intValue() + _xifexpression);
          Launcher.registers.replace(split[1], Integer.valueOf(_plus));
          pos++;
        } else {
          int value = 0;
          try {
            value = Integer.parseInt(split[1]);
          } catch (final Throwable _t) {
            if (_t instanceof NumberFormatException) {
              value = (Launcher.registers.get(split[1])).intValue();
            } else {
              throw Exceptions.sneakyThrow(_t);
            }
          }
          boolean _equals_2 = (split[0]).equals("cpy");
          if (_equals_2) {
            Launcher.registers.replace(split[2], Integer.valueOf(value));
            pos++;
          } else {
            int _pos = pos;
            int _xifexpression_1 = (int) 0;
            if ((value == 0)) {
              _xifexpression_1 = 1;
            } else {
              _xifexpression_1 = Integer.parseInt(split[2]);
            }
            pos = (_pos + _xifexpression_1);
          }
        }
      }
    }
    InputOutput.<Integer>println(Launcher.registers.get("a"));
  }
}
