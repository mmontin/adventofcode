package advent2021.puzzle6;

import adventutils.input.InputLoader;
import java.math.BigInteger;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.function.BiFunction;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Launcher {
  public static void main(final String[] args) {
    String[] _split = new InputLoader(Integer.valueOf(2021), Integer.valueOf(6)).getInputs().get(0).split(",");
    HashMap<Integer, BigInteger> _hashMap = new HashMap<Integer, BigInteger>();
    final Function2<HashMap<Integer, BigInteger>, String, HashMap<Integer, BigInteger>> _function = (HashMap<Integer, BigInteger> fishes, String v) -> {
      HashMap<Integer, BigInteger> _xblockexpression = null;
      {
        final BiFunction<BigInteger, BigInteger, BigInteger> _function_1 = (BigInteger v1, BigInteger v2) -> {
          return v1.add(v2);
        };
        fishes.merge(Integer.valueOf(Integer.parseInt(v)), BigInteger.valueOf(1), _function_1);
        _xblockexpression = fishes;
      }
      return _xblockexpression;
    };
    HashMap<Integer, BigInteger> input = IterableExtensions.<String, HashMap<Integer, BigInteger>>fold(((Iterable<String>)Conversions.doWrapArray(_split)), _hashMap, _function);
    ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, 256, true);
    for (final Integer k : _doubleDotLessThan) {
      Set<Map.Entry<Integer, BigInteger>> _entrySet = input.entrySet();
      HashMap<Integer, BigInteger> _hashMap_1 = new HashMap<Integer, BigInteger>();
      final Function2<HashMap<Integer, BigInteger>, Map.Entry<Integer, BigInteger>, HashMap<Integer, BigInteger>> _function_1 = (HashMap<Integer, BigInteger> output, Map.Entry<Integer, BigInteger> e) -> {
        HashMap<Integer, BigInteger> _xblockexpression = null;
        {
          Integer _key = e.getKey();
          boolean _equals = ((_key).intValue() == 0);
          if (_equals) {
            output.put(Integer.valueOf(6), e.getValue());
            output.put(Integer.valueOf(8), e.getValue());
          } else {
            Integer _key_1 = e.getKey();
            int _minus = ((_key_1).intValue() - 1);
            final BiFunction<BigInteger, BigInteger, BigInteger> _function_2 = (BigInteger v1, BigInteger v2) -> {
              return v1.add(v2);
            };
            output.merge(Integer.valueOf(_minus), e.getValue(), _function_2);
          }
          _xblockexpression = output;
        }
        return _xblockexpression;
      };
      input = IterableExtensions.<Map.Entry<Integer, BigInteger>, HashMap<Integer, BigInteger>>fold(_entrySet, _hashMap_1, _function_1);
    }
    final Function2<BigInteger, BigInteger, BigInteger> _function_2 = (BigInteger x, BigInteger y) -> {
      return x.add(y);
    };
    InputOutput.<BigInteger>println(IterableExtensions.<BigInteger, BigInteger>fold(input.values(), BigInteger.valueOf(0), _function_2));
  }
}
