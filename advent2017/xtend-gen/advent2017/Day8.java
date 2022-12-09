package advent2017;

import adventutils.input.InputLoader;
import com.google.common.base.Objects;
import java.util.Map;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Day8 {
  private static final Map<String, Integer> registers = CollectionLiterals.<String, Integer>newHashMap();

  private static Integer max = Integer.valueOf(0);

  public static void main(final String[] args) {
    final Consumer<String> _function = new Consumer<String>() {
      public void accept(final String it) {
        final String[] split = it.split(" ");
        boolean _evaluateCondition = Day8.evaluateCondition(split[4], split[5], split[6]);
        if (_evaluateCondition) {
          final Integer currentValue = Day8.registers.getOrDefault(split[0], Integer.valueOf(0));
          final int toChange = Integer.parseInt(split[2]);
          int _xifexpression = (int) 0;
          boolean _equals = (split[1]).equals("inc");
          if (_equals) {
            _xifexpression = toChange;
          } else {
            _xifexpression = (-toChange);
          }
          final int newValue = ((currentValue).intValue() + _xifexpression);
          Day8.max = Integer.valueOf(Math.max((Day8.max).intValue(), newValue));
          Day8.registers.put(split[0], Integer.valueOf(newValue));
        }
      }
    };
    new InputLoader(Integer.valueOf(2017), Integer.valueOf(8)).getInputs().forEach(_function);
    InputOutput.<Integer>println(IterableExtensions.<Integer>max(Day8.registers.values()));
    InputOutput.<Integer>print(Day8.max);
  }

  public static boolean evaluateCondition(final String reg, final String symb, final String value) {
    boolean _xblockexpression = false;
    {
      final int right = Integer.parseInt(value);
      final Integer left = Day8.registers.getOrDefault(reg, Integer.valueOf(0));
      boolean _switchResult = false;
      boolean _matched = false;
      if (Objects.equal(symb, ">")) {
        _matched=true;
        _switchResult = ((left).intValue() > right);
      }
      if (!_matched) {
        if (Objects.equal(symb, "<")) {
          _matched=true;
          _switchResult = ((left).intValue() < right);
        }
      }
      if (!_matched) {
        if (Objects.equal(symb, ">=")) {
          _matched=true;
          _switchResult = ((left).intValue() >= right);
        }
      }
      if (!_matched) {
        if (Objects.equal(symb, "<=")) {
          _matched=true;
          _switchResult = ((left).intValue() <= right);
        }
      }
      if (!_matched) {
        if (Objects.equal(symb, "==")) {
          _matched=true;
          _switchResult = ((left).intValue() == right);
        }
      }
      if (!_matched) {
        if (Objects.equal(symb, "!=")) {
          _matched=true;
          _switchResult = ((left).intValue() != right);
        }
      }
      _xblockexpression = _switchResult;
    }
    return _xblockexpression;
  }
}
