package advent2021.puzzle8;

import adventutils.input.InputLoader;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Launcher {
  public static void main(final String[] args) {
    final InputLoader il = new InputLoader(Integer.valueOf(2021), Integer.valueOf(8));
    final Function2<Integer, String, Integer> _function = (Integer v, String x) -> {
      int _decode1 = new Decoder(x).decode1();
      return Integer.valueOf(((v).intValue() + _decode1));
    };
    InputOutput.<Integer>println(IterableExtensions.<String, Integer>fold(il.getInputs(), Integer.valueOf(0), _function));
    final Function2<Double, String, Double> _function_1 = (Double v, String x) -> {
      double _decode2 = new Decoder(x).decode2();
      return Double.valueOf(((v).doubleValue() + _decode2));
    };
    InputOutput.<Double>println(IterableExtensions.<String, Double>fold(il.getInputs(), Double.valueOf(0), _function_1));
  }
}
