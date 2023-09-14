package advent2018;

import adventutils.Either;
import adventutils.geometry.Coordinate;
import adventutils.geometry.CoordinateSet;
import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Optional;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Day17 {
  private static final Set<Coordinate> walls = new Function0<Set<Coordinate>>() {
    @Override
    public Set<Coordinate> apply() {
      CoordinateSet _xblockexpression = null;
      {
        final CoordinateSet output = new CoordinateSet();
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
            _xifexpression = new Coordinate(secondValue1, firstValue);
          } else {
            _xifexpression = new Coordinate(firstValue, secondValue1);
          }
          final Coordinate coord1 = _xifexpression;
          Coordinate _xifexpression_1 = null;
          boolean _equals_1 = first.equals("x");
          if (_equals_1) {
            _xifexpression_1 = new Coordinate(secondValue2, firstValue);
          } else {
            _xifexpression_1 = new Coordinate(firstValue, secondValue2);
          }
          final Coordinate coord2 = _xifexpression_1;
          output.addAll(Coordinate.getAllCoordsOnLine(coord1, coord2));
        };
        new InputLoader(Integer.valueOf(2018), Integer.valueOf(17)).getInputs().forEach(_function);
        _xblockexpression = output;
      }
      return _xblockexpression;
    }
  }.apply();

  private static int flows = 0;

  private static final int maxX = IterableExtensions.<Coordinate, Integer>maxBy(Day17.walls, ((Function1<Coordinate, Integer>) (Coordinate it) -> {
    return Integer.valueOf(it.getX());
  })).getX();

  private static final Set<Coordinate> water = new CoordinateSet();

  private static final Coordinate source = new Coordinate(0, 500);

  public static void main(final String[] args) {
    Day17.flowDown(Day17.source);
    int _size = Day17.water.size();
    int _minus = (_size - 2);
    InputOutput.<Integer>println(Integer.valueOf(_minus));
    Day17.walls.retainAll(Day17.water);
    InputOutput.<Integer>println(Integer.valueOf(Day17.walls.size()));
  }

  public static String myPrint() {
    String _xblockexpression = null;
    {
      final Function1<Coordinate, Integer> _function = (Coordinate it) -> {
        return Integer.valueOf(it.getX());
      };
      final int minX = IterableExtensions.<Coordinate, Integer>minBy(Day17.water, _function).getX();
      final Function1<Coordinate, Integer> _function_1 = (Coordinate it) -> {
        return Integer.valueOf(it.getX());
      };
      final int maxX = IterableExtensions.<Coordinate, Integer>maxBy(Day17.water, _function_1).getX();
      final Function1<Coordinate, Integer> _function_2 = (Coordinate it) -> {
        return Integer.valueOf(it.getY());
      };
      final int minY = IterableExtensions.<Coordinate, Integer>minBy(Day17.water, _function_2).getY();
      final Function1<Coordinate, Integer> _function_3 = (Coordinate it) -> {
        return Integer.valueOf(it.getY());
      };
      final int maxY = IterableExtensions.<Coordinate, Integer>maxBy(Day17.water, _function_3).getY();
      String output = "";
      IntegerRange _upTo = new IntegerRange((minX - 1), (maxX + 1));
      for (final Integer i : _upTo) {
        {
          IntegerRange _upTo_1 = new IntegerRange((minY - 1), (maxY + 1));
          for (final Integer j : _upTo_1) {
            {
              final Coordinate newCoord = new Coordinate((i).intValue(), (j).intValue());
              String _output = output;
              String _xblockexpression_1 = null;
              {
                final boolean isWall = Day17.walls.contains(newCoord);
                final boolean isWater = Day17.water.contains(newCoord);
                String _xifexpression = null;
                if ((isWall && isWater)) {
                  _xifexpression = "~";
                } else {
                  String _xifexpression_1 = null;
                  boolean _equals = newCoord.equals(Day17.source);
                  if (_equals) {
                    _xifexpression_1 = "+";
                  } else {
                    String _xifexpression_2 = null;
                    if (isWall) {
                      _xifexpression_2 = "#";
                    } else {
                      String _xifexpression_3 = null;
                      if (isWater) {
                        _xifexpression_3 = "|";
                      } else {
                        _xifexpression_3 = ".";
                      }
                      _xifexpression_2 = _xifexpression_3;
                    }
                    _xifexpression_1 = _xifexpression_2;
                  }
                  _xifexpression = _xifexpression_1;
                }
                _xblockexpression_1 = _xifexpression;
              }
              output = (_output + _xblockexpression_1);
            }
          }
          String _output = output;
          output = (_output + "\n");
        }
      }
      _xblockexpression = InputOutput.<String>println(output);
    }
    return _xblockexpression;
  }

  public static boolean flowDown(final Coordinate source) {
    boolean _xblockexpression = false;
    {
      final Optional<ArrayList<Coordinate>> downs = Day17.goDown(source);
      boolean _xifexpression = false;
      boolean _isPresent = downs.isPresent();
      boolean _not = (!_isPresent);
      if (_not) {
        _xifexpression = false;
      } else {
        boolean _xblockexpression_1 = false;
        {
          final ArrayList<Coordinate> downStream = downs.get();
          int i = 0;
          boolean finished = false;
          while (((i < downStream.size()) && (!finished))) {
            int _plusPlus = i++;
            boolean _flowBothSides = Day17.flowBothSides(downStream.get(_plusPlus));
            boolean _not_1 = (!_flowBothSides);
            finished = _not_1;
          }
          boolean _xifexpression_1 = false;
          int _size = downStream.size();
          boolean _greaterEqualsThan = (i >= _size);
          if (_greaterEqualsThan) {
            _xifexpression_1 = true;
          } else {
            _xifexpression_1 = (!finished);
          }
          _xblockexpression_1 = _xifexpression_1;
        }
        _xifexpression = _xblockexpression_1;
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }

  public static Optional<ArrayList<Coordinate>> goDown(final Coordinate source) {
    Optional<ArrayList<Coordinate>> _xblockexpression = null;
    {
      final ArrayList<Coordinate> output = CollectionLiterals.<Coordinate>newArrayList();
      Coordinate next = source.otherMove(Coordinate.Direction.DOWN);
      while (((!Day17.walls.contains(next)) && (next.getX() < Day17.maxX))) {
        {
          output.add(0, next);
          next = next.otherMove(Coordinate.Direction.DOWN);
        }
      }
      Optional<ArrayList<Coordinate>> _xifexpression = null;
      boolean _contains = Day17.walls.contains(next);
      if (_contains) {
        Optional<ArrayList<Coordinate>> _xblockexpression_1 = null;
        {
          final boolean alreadyHandled = Day17.water.contains(output.get(0));
          Day17.water.addAll(output);
          Optional<ArrayList<Coordinate>> _xifexpression_1 = null;
          if (alreadyHandled) {
            _xifexpression_1 = Optional.<ArrayList<Coordinate>>empty();
          } else {
            _xifexpression_1 = Optional.<ArrayList<Coordinate>>of(output);
          }
          _xblockexpression_1 = _xifexpression_1;
        }
        _xifexpression = _xblockexpression_1;
      } else {
        Optional<ArrayList<Coordinate>> _xblockexpression_2 = null;
        {
          Day17.water.addAll(output);
          Day17.water.add(next);
          _xblockexpression_2 = Optional.<ArrayList<Coordinate>>empty();
        }
        _xifexpression = _xblockexpression_2;
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }

  public static Either<Coordinate, Set<Coordinate>> getOneSide(final Coordinate source, final boolean left) {
    Either<Coordinate, Set<Coordinate>> _xblockexpression = null;
    {
      final HashSet<Coordinate> reached = CollectionLiterals.<Coordinate>newHashSet();
      Coordinate.Direction _xifexpression = null;
      if (left) {
        _xifexpression = Coordinate.Direction.LEFT;
      } else {
        _xifexpression = Coordinate.Direction.RIGHT;
      }
      Coordinate next = source.otherMove(_xifexpression);
      while (((!Day17.walls.contains(next)) && Day17.walls.contains(next.otherMove(Coordinate.Direction.DOWN)))) {
        {
          reached.add(next);
          Coordinate.Direction _xifexpression_1 = null;
          if (left) {
            _xifexpression_1 = Coordinate.Direction.LEFT;
          } else {
            _xifexpression_1 = Coordinate.Direction.RIGHT;
          }
          next = next.otherMove(_xifexpression_1);
        }
      }
      Day17.water.addAll(reached);
      Either<Coordinate, Set<Coordinate>> _xifexpression_1 = null;
      boolean _contains = Day17.walls.contains(next);
      if (_contains) {
        _xifexpression_1 = Either.<Coordinate, Set<Coordinate>>fromRight(reached);
      } else {
        Either<Coordinate, Set<Coordinate>> _xblockexpression_1 = null;
        {
          Day17.water.add(next);
          _xblockexpression_1 = Either.<Coordinate, Set<Coordinate>>fromLeft(next);
        }
        _xifexpression_1 = _xblockexpression_1;
      }
      _xblockexpression = _xifexpression_1;
    }
    return _xblockexpression;
  }

  public static Optional<Set<Coordinate>> flowOneSide(final Coordinate source, final boolean left) {
    Optional<Set<Coordinate>> _xblockexpression = null;
    {
      Either<Coordinate, Set<Coordinate>> reached = Day17.getOneSide(source, left);
      Optional<Set<Coordinate>> _xifexpression = null;
      boolean _isRight = reached.isRight();
      if (_isRight) {
        _xifexpression = Optional.<Set<Coordinate>>of(reached.getRight());
      } else {
        Optional<Set<Coordinate>> _xifexpression_1 = null;
        boolean _flowDown = Day17.flowDown(reached.getLeft());
        if (_flowDown) {
          _xifexpression_1 = Day17.flowOneSide(source, left);
        } else {
          _xifexpression_1 = Optional.<Set<Coordinate>>empty();
        }
        _xifexpression = _xifexpression_1;
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }

  public static boolean flowBothSides(final Coordinate source) {
    boolean _xblockexpression = false;
    {
      Optional<Set<Coordinate>> leftFlow = Day17.flowOneSide(source, true);
      Optional<Set<Coordinate>> rightFlow = Day17.flowOneSide(source, false);
      boolean _xifexpression = false;
      if ((leftFlow.isPresent() && rightFlow.isPresent())) {
        boolean _xblockexpression_1 = false;
        {
          Day17.walls.addAll(leftFlow.get());
          Day17.walls.addAll(rightFlow.get());
          Day17.walls.add(source);
          _xblockexpression_1 = true;
        }
        _xifexpression = _xblockexpression_1;
      } else {
        _xifexpression = false;
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }
}
