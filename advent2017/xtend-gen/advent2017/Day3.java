package advent2017;

import adventutils.geometry.Coordinate;
import java.util.HashMap;
import java.util.HashSet;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Day3 {
  public enum Direction {
    UP,

    DOWN,

    LEFT,

    RIGHT;
  }

  private static final int input = 361527;

  public static void main(final String[] args) {
    int layer = 0;
    int blocks = 0;
    while ((Day3.input > blocks)) {
      int _plusPlus = layer++;
      int _multiply = (2 * _plusPlus);
      int _plus = (_multiply + 1);
      double _pow = Math.pow(_plus, 2);
      blocks = ((int) _pow);
    }
    layer--;
    final int prev = (((2 * (layer - 1)) + 1) * ((2 * (layer - 1)) + 1));
    final int dist1 = Math.abs((Day3.input - (prev + layer)));
    final int dist2 = Math.abs((Day3.input - (prev + (3 * layer))));
    final int dist3 = Math.abs((Day3.input - (prev + (5 * layer))));
    final int dist4 = Math.abs((Day3.input - (prev + (7 * layer))));
    int _min = Math.min(dist1, Math.min(dist2, Math.min(dist3, dist4)));
    int _plus = (_min + layer);
    InputOutput.<Integer>println(Integer.valueOf(_plus));
    final HashMap<Coordinate, Integer> coordinates = CollectionLiterals.<Coordinate, Integer>newHashMap();
    Coordinate currentPosition = new Coordinate();
    coordinates.put(currentPosition, Integer.valueOf(1));
    Day3.Direction currentDirection = Day3.Direction.RIGHT;
    do {
      {
        currentPosition = Day3.move(currentPosition, currentDirection);
        final HashSet<Coordinate> neighbours = currentPosition.allAroundFilteredNeighbours(coordinates.keySet());
        final Function2<Integer, Coordinate, Integer> _function = new Function2<Integer, Coordinate, Integer>() {
          public Integer apply(final Integer acc, final Coordinate e) {
            Integer _get = coordinates.get(e);
            return Integer.valueOf(((acc).intValue() + (_get).intValue()));
          }
        };
        coordinates.put(currentPosition, IterableExtensions.<Coordinate, Integer>fold(neighbours, Integer.valueOf(0), _function));
        int _size = neighbours.size();
        boolean _lessEqualsThan = (_size <= 2);
        if (_lessEqualsThan) {
          currentDirection = Day3.next(currentDirection);
        }
      }
    } while(((coordinates.get(currentPosition)).intValue() < Day3.input));
    InputOutput.<Integer>print(coordinates.get(currentPosition));
  }

  public static Day3.Direction next(final Day3.Direction d) {
    Day3.Direction _switchResult = null;
    if (d != null) {
      switch (d) {
        case UP:
          _switchResult = Day3.Direction.LEFT;
          break;
        case LEFT:
          _switchResult = Day3.Direction.DOWN;
          break;
        case DOWN:
          _switchResult = Day3.Direction.RIGHT;
          break;
        case RIGHT:
          _switchResult = Day3.Direction.UP;
          break;
        default:
          break;
      }
    }
    return _switchResult;
  }

  public static Coordinate move(final Coordinate c, final Day3.Direction d) {
    Coordinate _switchResult = null;
    if (d != null) {
      switch (d) {
        case UP:
          _switchResult = c.addY(1);
          break;
        case DOWN:
          _switchResult = c.addY((-1));
          break;
        case RIGHT:
          _switchResult = c.addX(1);
          break;
        case LEFT:
          _switchResult = c.addX((-1));
          break;
        default:
          break;
      }
    }
    return _switchResult;
  }
}
