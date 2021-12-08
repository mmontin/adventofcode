package advent2021.puzzle8;

import advent2021.Utils;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Launcher {
  public static void main(final String[] args) {
    final Function2<Integer, String, Integer> _function = new Function2<Integer, String, Integer>() {
      public Integer apply(final Integer v, final String x) {
        int _decode1 = new Decoder(x).decode1();
        return Integer.valueOf(((v).intValue() + _decode1));
      }
    };
    InputOutput.<Integer>println(IterableExtensions.<String, Integer>fold(Utils.getInputs(8), Integer.valueOf(0), _function));
    final Function2<Double, String, Double> _function_1 = new Function2<Double, String, Double>() {
      public Double apply(final Double v, final String x) {
        double _decode2 = new Decoder(x).decode2();
        return Double.valueOf(((v).doubleValue() + _decode2));
      }
    };
    InputOutput.<Double>println(IterableExtensions.<String, Double>fold(Utils.getInputs(8), Double.valueOf(0), _function_1));
  }
}
