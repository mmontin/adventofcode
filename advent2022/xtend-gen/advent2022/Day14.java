package advent2022;

import adventutils.geometry.Coordinate;
import adventutils.geometry.Direction;
import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.function.Consumer;
import java.util.function.Predicate;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Day14 {
  private static final List<String> inputs = new InputLoader(Integer.valueOf(2022), Integer.valueOf(14)).getInputs();

  private static final Set<Coordinate> rocks = CollectionLiterals.<Coordinate>newHashSet();

  private static final int max_depth = new Function0<Integer>() {
    @Override
    public Integer apply() {
      int _xblockexpression = (int) 0;
      {
        Day14.init();
        final Function1<Coordinate, Integer> _function = (Coordinate it) -> {
          return Integer.valueOf(it.getY());
        };
        _xblockexpression = IterableExtensions.<Coordinate, Integer>maxBy(Day14.rocks, _function).getY();
      }
      return _xblockexpression;
    }
  }.apply().intValue();

  private static final Coordinate source = new Coordinate(500, 0);

  public static void init() {
    Day14.rocks.clear();
    final Consumer<String> _function = (String line) -> {
      final Function1<String, Coordinate> _function_1 = (String it) -> {
        return new Coordinate(it);
      };
      final List<Coordinate> coords = ListExtensions.<String, Coordinate>map(((List<String>)Conversions.doWrapArray(line.split(" -> "))), _function_1);
      int _size = coords.size();
      int _minus = (_size - 2);
      final Consumer<Integer> _function_2 = (Integer it) -> {
        Day14.rocks.addAll(Coordinate.getAllCoordsOnLine(coords.get((it).intValue()), coords.get(((it).intValue() + 1))));
      };
      new IntegerRange(0, _minus).forEach(_function_2);
    };
    Day14.inputs.forEach(_function);
  }

  public static void main(final String[] args) {
    int i = 0;
    while (Day14.flow()) {
      i++;
    }
    InputOutput.<Integer>println(Integer.valueOf(i));
    Day14.init();
    i = 0;
    while ((!Day14.rocks.contains(Day14.source))) {
      {
        Day14.flow_with_floor();
        i++;
      }
    }
    InputOutput.<Integer>print(Integer.valueOf(i));
  }

  public static boolean flow() {
    boolean _xblockexpression = false;
    {
      Coordinate current = Day14.source;
      do {
        {
          final Coordinate down = current.move(Direction.UP);
          final ArrayList<Coordinate> possibilities = CollectionLiterals.<Coordinate>newArrayList(down, down.move(Direction.LEFT), down.move(Direction.RIGHT));
          possibilities.removeAll(Day14.rocks);
          int _size = possibilities.size();
          boolean _equals = (_size == 0);
          if (_equals) {
            Day14.rocks.add(current);
            return true;
          } else {
            current = possibilities.get(0);
          }
        }
      } while((current.getY() < Day14.max_depth));
      _xblockexpression = false;
    }
    return _xblockexpression;
  }

  public static void flow_with_floor() {
    Coordinate current = Day14.source;
    do {
      {
        final Coordinate down = current.move(Direction.UP);
        final ArrayList<Coordinate> possibilities = CollectionLiterals.<Coordinate>newArrayList(down, down.move(Direction.LEFT), down.move(Direction.RIGHT));
        possibilities.removeAll(Day14.rocks);
        final Predicate<Coordinate> _function = (Coordinate it) -> {
          int _y = it.getY();
          return (_y > (Day14.max_depth + 1));
        };
        possibilities.removeIf(_function);
        int _size = possibilities.size();
        boolean _equals = (_size == 0);
        if (_equals) {
          Day14.rocks.add(current);
        } else {
          current = possibilities.get(0);
        }
      }
    } while((!Day14.rocks.contains(current)));
  }
}
