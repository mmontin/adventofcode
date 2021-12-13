package advent2021.puzzle13;

import advent2021.Utils;
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
    final List<String> input = Utils.getInputs(13);
    final int index = input.indexOf("");
    final Function1<String, Coordinates> _function = new Function1<String, Coordinates>() {
      public Coordinates apply(final String it) {
        return new Coordinates(it);
      }
    };
    final Set<Coordinates> dots = IterableExtensions.<Coordinates>toSet(IterableExtensions.<String, Coordinates>map(IterableExtensions.<String>take(input, index), _function));
    final Consumer<String> _function_1 = new Consumer<String>() {
      public void accept(final String it) {
        String[] split = (it.split(" ")[2]).split("=");
        final String ch = split[0];
        final int offset = Integer.parseInt(split[1]);
        final HashSet<Coordinates> duplicates = new HashSet<Coordinates>(dots);
        final Consumer<Coordinates> _function = new Consumer<Coordinates>() {
          public void accept(final Coordinates it) {
            if ((ch.equals("x") && (it.getX() > offset))) {
              dots.add(it.symByX(offset));
              dots.remove(it);
            } else {
              if ((ch.equals("y") && (it.getY() > offset))) {
                dots.add(it.symByY(offset));
                dots.remove(it);
              }
            }
          }
        };
        duplicates.forEach(_function);
      }
    };
    IterableExtensions.<String>drop(input, (index + 1)).forEach(_function_1);
    final Function1<Coordinates, Integer> _function_2 = new Function1<Coordinates, Integer>() {
      public Integer apply(final Coordinates it) {
        return Integer.valueOf(it.getY());
      }
    };
    int _y = IterableExtensions.<Coordinates, Integer>maxBy(dots, _function_2).getY();
    IntegerRange _upTo = new IntegerRange(0, _y);
    for (final Integer j : _upTo) {
      {
        final Function1<Coordinates, Integer> _function_3 = new Function1<Coordinates, Integer>() {
          public Integer apply(final Coordinates it) {
            return Integer.valueOf(it.getX());
          }
        };
        int _x = IterableExtensions.<Coordinates, Integer>maxBy(dots, _function_3).getX();
        IntegerRange _upTo_1 = new IntegerRange(0, _x);
        for (final Integer i : _upTo_1) {
          String _xifexpression = null;
          Coordinates _coordinates = new Coordinates((i).intValue(), (j).intValue());
          boolean _contains = dots.contains(_coordinates);
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
