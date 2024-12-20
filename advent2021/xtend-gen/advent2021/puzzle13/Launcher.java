package advent2021.puzzle13;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Launcher {
  public static void main(final String[] args) {
    final List<String> input = new InputLoader(Integer.valueOf(2021), Integer.valueOf(13)).getInputs();
    final int index = input.indexOf("");
    final Function1<String, Coordinate> _function = (String it) -> {
      return new Coordinate(it);
    };
    final Set<Coordinate> dots = IterableExtensions.<Coordinate>toSet(IterableExtensions.<String, Coordinate>map(IterableExtensions.<String>take(input, index), _function));
    final Consumer<String> _function_1 = (String it) -> {
      String[] split = (it.split(" ")[2]).split("=");
      final String ch = split[0];
      final int offset = Integer.parseInt(split[1]);
      final HashSet<Coordinate> duplicates = new HashSet<Coordinate>(dots);
      final Consumer<Coordinate> _function_2 = (Coordinate it_1) -> {
        if ((ch.equals("x") && (it_1.getX() > offset))) {
          dots.add(it_1.symByX(offset));
          dots.remove(it_1);
        } else {
          if ((ch.equals("y") && (it_1.getY() > offset))) {
            dots.add(it_1.symByY(offset));
            dots.remove(it_1);
          }
        }
      };
      duplicates.forEach(_function_2);
    };
    IterableExtensions.<String>drop(input, (index + 1)).forEach(_function_1);
    final Function1<Coordinate, Integer> _function_2 = (Coordinate it) -> {
      return Integer.valueOf(it.getY());
    };
    int _y = IterableExtensions.<Coordinate, Integer>maxBy(dots, _function_2).getY();
    IntegerRange _upTo = new IntegerRange(0, _y);
    for (final Integer j : _upTo) {
      {
        final Function1<Coordinate, Integer> _function_3 = (Coordinate it) -> {
          return Integer.valueOf(it.getX());
        };
        int _x = IterableExtensions.<Coordinate, Integer>maxBy(dots, _function_3).getX();
        IntegerRange _upTo_1 = new IntegerRange(0, _x);
        for (final Integer i : _upTo_1) {
          String _xifexpression = null;
          Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
          boolean _contains = dots.contains(_coordinate);
          if (_contains) {
            _xifexpression = "0";
          } else {
            _xifexpression = " ";
          }
          InputOutput.<String>print(_xifexpression);
        }
        InputOutput.println();
      }
    }
  }
}
