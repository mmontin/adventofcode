package advent2018;

import adventutils.geometry.Coordinate;
import adventutils.geometry.CoordinateSet;
import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

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

  private static final int maxX = IterableExtensions.<Coordinate, Integer>maxBy(Day17.walls, ((Function1<Coordinate, Integer>) (Coordinate it) -> {
    return Integer.valueOf(it.getX());
  })).getX();

  private static final Set<Coordinate> water = new CoordinateSet();

  private static final Coordinate source = new Coordinate(0, 500);

  public static void main(final String[] args) {
    Day17.flow(Day17.source);
    InputOutput.<Integer>println(Integer.valueOf(Day17.water.size()));
  }

  public static String myPrint() {
    String _xblockexpression = null;
    {
      final Function1<Coordinate, Integer> _function = (Coordinate it) -> {
        return Integer.valueOf(it.getX());
      };
      final int minX = IterableExtensions.<Coordinate, Integer>minBy(Day17.walls, _function).getX();
      final Function1<Coordinate, Integer> _function_1 = (Coordinate it) -> {
        return Integer.valueOf(it.getX());
      };
      final int maxX = IterableExtensions.<Coordinate, Integer>maxBy(Day17.walls, _function_1).getX();
      final Function1<Coordinate, Integer> _function_2 = (Coordinate it) -> {
        return Integer.valueOf(it.getY());
      };
      final int minY = IterableExtensions.<Coordinate, Integer>minBy(Day17.walls, _function_2).getY();
      final Function1<Coordinate, Integer> _function_3 = (Coordinate it) -> {
        return Integer.valueOf(it.getY());
      };
      final int maxY = IterableExtensions.<Coordinate, Integer>maxBy(Day17.walls, _function_3).getY();
      String output = "";
      IntegerRange _upTo = new IntegerRange(0, 100);
      for (final Integer i : _upTo) {
        {
          IntegerRange _upTo_1 = new IntegerRange(450, 550);
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

  public static boolean flow(final Coordinate source) {
    boolean _xblockexpression = false;
    {
      Day17.myPrint();
      final Pair<Boolean, Coordinate> nextSource = Day17.goDown(source);
      boolean _xifexpression = false;
      boolean _equals = nextSource.getValue().equals(source);
      if (_equals) {
        _xifexpression = true;
      } else {
        boolean _xifexpression_1 = false;
        Boolean _key = nextSource.getKey();
        boolean _not = (!(_key).booleanValue());
        if (_not) {
          _xifexpression_1 = false;
        } else {
          boolean _xblockexpression_1 = false;
          {
            final Pair<Boolean, ArrayList<Coordinate>> left = Day17.goSideways(nextSource.getValue(), true);
            final Pair<Boolean, ArrayList<Coordinate>> right = Day17.goSideways(nextSource.getValue(), false);
            Day17.water.addAll(left.getValue());
            Day17.water.addAll(right.getValue());
            boolean _xifexpression_2 = false;
            if (((left.getKey()).booleanValue() && (right.getKey()).booleanValue())) {
              boolean _xblockexpression_2 = false;
              {
                Day17.walls.addAll(left.getValue());
                Day17.walls.addAll(right.getValue());
                _xblockexpression_2 = Day17.flow(source);
              }
              _xifexpression_2 = _xblockexpression_2;
            } else {
              boolean _xifexpression_3 = false;
              if (((!(left.getKey()).booleanValue()) && (right.getKey()).booleanValue())) {
                boolean _xifexpression_4 = false;
                boolean _flow = Day17.flow(left.getValue().get(0));
                if (_flow) {
                  _xifexpression_4 = Day17.flow(source);
                } else {
                  _xifexpression_4 = false;
                }
                _xifexpression_3 = _xifexpression_4;
              } else {
                boolean _xifexpression_5 = false;
                if (((left.getKey()).booleanValue() && (!(right.getKey()).booleanValue()))) {
                  boolean _xifexpression_6 = false;
                  boolean _flow_1 = Day17.flow(right.getValue().get(0));
                  if (_flow_1) {
                    _xifexpression_6 = Day17.flow(source);
                  } else {
                    _xifexpression_6 = false;
                  }
                  _xifexpression_5 = _xifexpression_6;
                } else {
                  boolean _xblockexpression_3 = false;
                  {
                    final boolean fLeft = Day17.flow(left.getValue().get(0));
                    final boolean fRight = Day17.flow(right.getValue().get(0));
                    boolean _xifexpression_7 = false;
                    if ((fLeft && fRight)) {
                      _xifexpression_7 = Day17.flow(source);
                    } else {
                      _xifexpression_7 = false;
                    }
                    _xblockexpression_3 = _xifexpression_7;
                  }
                  _xifexpression_5 = _xblockexpression_3;
                }
                _xifexpression_3 = _xifexpression_5;
              }
              _xifexpression_2 = _xifexpression_3;
            }
            _xblockexpression_1 = _xifexpression_2;
          }
          _xifexpression_1 = _xblockexpression_1;
        }
        _xifexpression = _xifexpression_1;
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }

  public static Pair<Boolean, Coordinate> goDown(final Coordinate source) {
    Pair<Boolean, Coordinate> _xblockexpression = null;
    {
      Coordinate current = source;
      Coordinate next = current.otherMove(Coordinate.Direction.DOWN);
      while (((!Day17.walls.contains(next)) && (next.getX() < Day17.maxX))) {
        {
          current = next;
          Day17.water.add(current);
          next = current.otherMove(Coordinate.Direction.DOWN);
        }
      }
      Pair<Boolean, Coordinate> _xifexpression = null;
      if (((next.getX() == Day17.maxX) && (!Day17.walls.contains(next)))) {
        Pair<Boolean, Coordinate> _xblockexpression_1 = null;
        {
          Day17.water.add(next);
          _xblockexpression_1 = Pair.<Boolean, Coordinate>of(Boolean.valueOf(false), current);
        }
        _xifexpression = _xblockexpression_1;
      } else {
        _xifexpression = Pair.<Boolean, Coordinate>of(Boolean.valueOf(true), current);
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }

  public static Pair<Boolean, ArrayList<Coordinate>> goSideways(final Coordinate source, final boolean left) {
    Pair<Boolean, ArrayList<Coordinate>> _xblockexpression = null;
    {
      Coordinate current = source;
      final ArrayList<Coordinate> reached = CollectionLiterals.<Coordinate>newArrayList(source);
      Coordinate.Direction _xifexpression = null;
      if (left) {
        _xifexpression = Coordinate.Direction.LEFT;
      } else {
        _xifexpression = Coordinate.Direction.RIGHT;
      }
      Coordinate next = current.otherMove(_xifexpression);
      while (((!Day17.walls.contains(next)) && Day17.walls.contains(next.otherMove(Coordinate.Direction.DOWN)))) {
        {
          current = next;
          reached.add(current);
          Coordinate.Direction _xifexpression_1 = null;
          if (left) {
            _xifexpression_1 = Coordinate.Direction.LEFT;
          } else {
            _xifexpression_1 = Coordinate.Direction.RIGHT;
          }
          next = current.otherMove(_xifexpression_1);
        }
      }
      boolean _xifexpression_1 = false;
      boolean _contains = Day17.walls.contains(next);
      if (_contains) {
        _xifexpression_1 = true;
      } else {
        boolean _xblockexpression_1 = false;
        {
          reached.add(0, next);
          _xblockexpression_1 = false;
        }
        _xifexpression_1 = _xblockexpression_1;
      }
      _xblockexpression = Pair.<Boolean, ArrayList<Coordinate>>of(Boolean.valueOf(_xifexpression_1), reached);
    }
    return _xblockexpression;
  }
}
