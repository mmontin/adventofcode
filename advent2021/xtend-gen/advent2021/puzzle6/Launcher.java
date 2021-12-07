package advent2021.puzzle6;

import advent2021.Utils;
import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.BiFunction;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Launcher {
  public static void main(final String[] args) {
    final Map<Integer, BigInteger> fishes = new HashMap<Integer, BigInteger>();
    final Consumer<String> _function = new Consumer<String>() {
      public void accept(final String v) {
        final BiFunction<BigInteger, BigInteger, BigInteger> _function = new BiFunction<BigInteger, BigInteger, BigInteger>() {
          public BigInteger apply(final BigInteger v1, final BigInteger v2) {
            return v1.add(v2);
          }
        };
        fishes.merge(Integer.valueOf(Integer.parseInt(v)), BigInteger.valueOf(1), _function);
      }
    };
    ((List<String>)Conversions.doWrapArray(Utils.getInputs(6).get(0).split(","))).forEach(_function);
    Map<Integer, BigInteger> input = fishes;
    ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, 256, true);
    for (final Integer k : _doubleDotLessThan) {
      input = Launcher.step(input);
    }
    final Function2<BigInteger, BigInteger, BigInteger> _function_1 = new Function2<BigInteger, BigInteger, BigInteger>() {
      public BigInteger apply(final BigInteger x, final BigInteger y) {
        return x.add(y);
      }
    };
    InputOutput.<BigInteger>println(IterableExtensions.<BigInteger, BigInteger>fold(input.values(), BigInteger.valueOf(0), _function_1));
  }
  
  public static Map<Integer, BigInteger> step(final Map<Integer, BigInteger> input) {
    Map<Integer, BigInteger> _xblockexpression = null;
    {
      final Map<Integer, BigInteger> output = new HashMap<Integer, BigInteger>();
      final Consumer<Map.Entry<Integer, BigInteger>> _function = new Consumer<Map.Entry<Integer, BigInteger>>() {
        public void accept(final Map.Entry<Integer, BigInteger> e) {
          Integer _key = e.getKey();
          boolean _equals = ((_key).intValue() == 0);
          if (_equals) {
            final BiFunction<BigInteger, BigInteger, BigInteger> _function = new BiFunction<BigInteger, BigInteger, BigInteger>() {
              public BigInteger apply(final BigInteger v1, final BigInteger v2) {
                return v1.add(v2);
              }
            };
            output.merge(Integer.valueOf(6), e.getValue(), _function);
            final BiFunction<BigInteger, BigInteger, BigInteger> _function_1 = new BiFunction<BigInteger, BigInteger, BigInteger>() {
              public BigInteger apply(final BigInteger v1, final BigInteger v2) {
                return v1.add(v2);
              }
            };
            output.merge(Integer.valueOf(8), e.getValue(), _function_1);
          } else {
            Integer _key_1 = e.getKey();
            Integer _valueOf = Integer.valueOf(1);
            int _minus = ((_key_1).intValue() - (_valueOf).intValue());
            final BiFunction<BigInteger, BigInteger, BigInteger> _function_2 = new BiFunction<BigInteger, BigInteger, BigInteger>() {
              public BigInteger apply(final BigInteger v1, final BigInteger v2) {
                return v1.add(v2);
              }
            };
            output.merge(Integer.valueOf(_minus), e.getValue(), _function_2);
          }
        }
      };
      input.entrySet().forEach(_function);
      _xblockexpression = output;
    }
    return _xblockexpression;
  }
}
