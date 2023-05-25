package advent2018;

import adventutils.geometry.Coordinate;
import adventutils.geometry.CoordinateSet;
import adventutils.input.InputLoader;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.InputOutput;

@SuppressWarnings("all")
public class Day17 {
  private static final Set<Coordinate> walls = new Function0<Set<Coordinate>>() {
    @Override
    public Set<Coordinate> apply() {
      CoordinateSet _xblockexpression = null;
      {
        final CoordinateSet output = new CoordinateSet();
        InputOutput.<Integer>println(Integer.valueOf(new InputLoader(Integer.valueOf(2018), Integer.valueOf(17)).getInputs().size()));
        final Consumer<String> _function = (String it) -> {
          final String[] split1 = it.split(", ");
          final String[] split2 = (split1[0]).split("=");
          final String[] split3 = (split1[1]).split("=");
          final String[] split4 = (split3[1]).split("\\.\\.");
          final String first = split2[0];
          final int firstValue = Integer.parseInt(split2[1]);
          final int secondValue1 = Integer.parseInt(split4[0]);
          final int secondValue2 = Integer.parseInt(split4[1]);
          Coordinate _xifexpression = null;
          boolean _equals = first.equals("x");
          if (_equals) {
            _xifexpression = new Coordinate(firstValue, secondValue1);
          } else {
            _xifexpression = new Coordinate(secondValue1, firstValue);
          }
          final Coordinate coord1 = _xifexpression;
          Coordinate _xifexpression_1 = null;
          boolean _equals_1 = first.equals("x");
          if (_equals_1) {
            _xifexpression_1 = new Coordinate(firstValue, secondValue2);
          } else {
            _xifexpression_1 = new Coordinate(secondValue2, firstValue);
          }
          final Coordinate coord2 = _xifexpression_1;
          output.addAll(
            Coordinate.getAllCoordsOnLine(coord1, coord2));
        };
        new InputLoader(Integer.valueOf(2018), Integer.valueOf(17)).getInputs().forEach(_function);
        _xblockexpression = output;
      }
      return _xblockexpression;
    }
  }.apply();

  public static void main(final String[] args) {
    InputOutput.<Set<Coordinate>>println(Day17.walls);
  }
}
