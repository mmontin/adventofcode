package advent2021.puzzle5;

import adventutils.input.InputLoader;
import java.util.HashMap;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Launcher {
  public static void main(final String[] args) {
    final HashMap<Point, Integer> points = new HashMap<Point, Integer>();
    final Function1<String, Segment> _function = new Function1<String, Segment>() {
      public Segment apply(final String s) {
        return new Segment(s);
      }
    };
    final Consumer<Segment> _function_1 = new Consumer<Segment>() {
      public void accept(final Segment s) {
        s.addPointsOnGrid(points);
      }
    };
    new InputLoader(Integer.valueOf(2021), Integer.valueOf(5)).<Segment>getInputs(_function).forEach(_function_1);
    final Function2<Integer, Integer, Integer> _function_2 = new Function2<Integer, Integer, Integer>() {
      public Integer apply(final Integer v, final Integer n) {
        Integer _xifexpression = null;
        if (((n).intValue() >= 2)) {
          _xifexpression = Integer.valueOf(((v).intValue() + 1));
        } else {
          _xifexpression = v;
        }
        return _xifexpression;
      }
    };
    InputOutput.<Integer>println(IterableExtensions.<Integer, Integer>fold(points.values(), Integer.valueOf(0), _function_2));
  }
}
