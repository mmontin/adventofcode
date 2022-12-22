package advent2022;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;
import com.google.common.base.Objects;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.MapExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day22 {
  private static final List<String> inputs = new InputLoader(Integer.valueOf(2022), Integer.valueOf(22)).getInputs();

  private static final Map<Coordinate, Boolean> tiles = new Function0<Map<Coordinate, Boolean>>() {
    public Map<Coordinate, Boolean> apply() {
      HashMap<Coordinate, Boolean> _xblockexpression = null;
      {
        final HashMap<Coordinate, Boolean> output = CollectionLiterals.<Coordinate, Boolean>newHashMap();
        int _size = Day22.inputs.size();
        int _minus = (_size - 3);
        final Consumer<Integer> _function = new Consumer<Integer>() {
          public void accept(final Integer i) {
            final char[] line = Day22.inputs.get((i).intValue()).toCharArray();
            int _size = ((List<Character>)Conversions.doWrapArray(line)).size();
            int _minus = (_size - 1);
            final Consumer<Integer> _function = new Consumer<Integer>() {
              public void accept(final Integer j) {
                boolean _equals = Character.valueOf((line[(j).intValue()])).toString().equals("#");
                if (_equals) {
                  Coordinate _coordinate = new Coordinate(((i).intValue() + 1), ((j).intValue() + 1));
                  output.put(_coordinate, Boolean.valueOf(false));
                } else {
                  boolean _equals_1 = Character.valueOf((line[(j).intValue()])).toString().equals(".");
                  if (_equals_1) {
                    Coordinate _coordinate_1 = new Coordinate(((i).intValue() + 1), ((j).intValue() + 1));
                    output.put(_coordinate_1, Boolean.valueOf(true));
                  }
                }
              }
            };
            new IntegerRange(0, _minus).forEach(_function);
          }
        };
        new IntegerRange(0, _minus).forEach(_function);
        _xblockexpression = output;
      }
      return _xblockexpression;
    }
  }.apply();

  private static final int face = 50;

  private static final int double_face = (2 * Day22.face);

  private static final int triple_face = (3 * Day22.face);

  private static final int quadruple_face = (4 * Day22.face);

  private static final List<String> movements = new Function0<List<String>>() {
    public List<String> apply() {
      ArrayList<String> _xblockexpression = null;
      {
        final ArrayList<String> output = CollectionLiterals.<String>newArrayList();
        int _size = Day22.inputs.size();
        int _minus = (_size - 1);
        final String line = Day22.inputs.get(_minus);
        final Consumer<String> _function = new Consumer<String>() {
          public void accept(final String subL) {
            final Consumer<String> _function = new Consumer<String>() {
              public void accept(final String subR) {
                output.add(subR);
                output.add("R");
              }
            };
            ((List<String>)Conversions.doWrapArray(subL.split("R"))).forEach(_function);
            int _size = output.size();
            int _minus = (_size - 1);
            output.remove(_minus);
            output.add("L");
          }
        };
        ((List<String>)Conversions.doWrapArray(line.split("L"))).forEach(_function);
        int _size_1 = output.size();
        int _minus_1 = (_size_1 - 1);
        output.remove(_minus_1);
        _xblockexpression = output;
      }
      return _xblockexpression;
    }
  }.apply();

  public static Coordinate nextPosition(final Coordinate current_position, final Coordinate.Direction current_orientation) {
    Coordinate _xblockexpression = null;
    {
      Coordinate next_position = current_position.otherMove(current_orientation);
      boolean _containsKey = Day22.tiles.containsKey(next_position);
      boolean _not = (!_containsKey);
      if (_not) {
        Coordinate _switchResult = null;
        if (current_orientation != null) {
          switch (current_orientation) {
            case RIGHT:
              final Function1<Coordinate, Boolean> _function = new Function1<Coordinate, Boolean>() {
                public Boolean apply(final Coordinate it) {
                  int _x = it.getX();
                  int _x_1 = current_position.getX();
                  return Boolean.valueOf((_x == _x_1));
                }
              };
              final Function1<Coordinate, Integer> _function_1 = new Function1<Coordinate, Integer>() {
                public Integer apply(final Coordinate it) {
                  return Integer.valueOf(it.getY());
                }
              };
              _switchResult = IterableExtensions.<Coordinate, Integer>minBy(IterableExtensions.<Coordinate>filter(Day22.tiles.keySet(), _function), _function_1);
              break;
            case LEFT:
              final Function1<Coordinate, Boolean> _function_2 = new Function1<Coordinate, Boolean>() {
                public Boolean apply(final Coordinate it) {
                  int _x = it.getX();
                  int _x_1 = current_position.getX();
                  return Boolean.valueOf((_x == _x_1));
                }
              };
              final Function1<Coordinate, Integer> _function_3 = new Function1<Coordinate, Integer>() {
                public Integer apply(final Coordinate it) {
                  return Integer.valueOf(it.getY());
                }
              };
              _switchResult = IterableExtensions.<Coordinate, Integer>maxBy(IterableExtensions.<Coordinate>filter(Day22.tiles.keySet(), _function_2), _function_3);
              break;
            case UP:
              final Function1<Coordinate, Boolean> _function_4 = new Function1<Coordinate, Boolean>() {
                public Boolean apply(final Coordinate it) {
                  int _y = it.getY();
                  int _y_1 = current_position.getY();
                  return Boolean.valueOf((_y == _y_1));
                }
              };
              final Function1<Coordinate, Integer> _function_5 = new Function1<Coordinate, Integer>() {
                public Integer apply(final Coordinate it) {
                  return Integer.valueOf(it.getX());
                }
              };
              _switchResult = IterableExtensions.<Coordinate, Integer>maxBy(IterableExtensions.<Coordinate>filter(Day22.tiles.keySet(), _function_4), _function_5);
              break;
            case DOWN:
              final Function1<Coordinate, Boolean> _function_6 = new Function1<Coordinate, Boolean>() {
                public Boolean apply(final Coordinate it) {
                  int _y = it.getY();
                  int _y_1 = current_position.getY();
                  return Boolean.valueOf((_y == _y_1));
                }
              };
              final Function1<Coordinate, Integer> _function_7 = new Function1<Coordinate, Integer>() {
                public Integer apply(final Coordinate it) {
                  return Integer.valueOf(it.getX());
                }
              };
              _switchResult = IterableExtensions.<Coordinate, Integer>minBy(IterableExtensions.<Coordinate>filter(Day22.tiles.keySet(), _function_6), _function_7);
              break;
            default:
              break;
          }
        }
        next_position = _switchResult;
      }
      _xblockexpression = next_position;
    }
    return _xblockexpression;
  }

  public static Pair<Coordinate, Coordinate.Direction> nextPosition2(final Pair<Coordinate, Coordinate.Direction> full_position) {
    Pair<Coordinate, Coordinate.Direction> _xblockexpression = null;
    {
      final Coordinate current_position = full_position.getKey();
      final Coordinate.Direction current_orientation = full_position.getValue();
      Coordinate next_position = current_position.otherMove(current_orientation);
      Pair<Coordinate, Coordinate.Direction> _xifexpression = null;
      boolean _containsKey = Day22.tiles.containsKey(next_position);
      boolean _not = (!_containsKey);
      if (_not) {
        Pair<Coordinate, Coordinate.Direction> _xifexpression_1 = null;
        if (((((next_position.getY() == (Day22.double_face + 1)) && 
          (next_position.getX() >= (Day22.face + 1))) && 
          (next_position.getX() <= Day22.double_face)) && 
          Objects.equal(current_orientation, Coordinate.Direction.RIGHT))) {
          int _x = next_position.getX();
          int _plus = (_x + Day22.face);
          Coordinate _coordinate = new Coordinate(Day22.face, _plus);
          _xifexpression_1 = Pair.<Coordinate, Coordinate.Direction>of(_coordinate, Coordinate.Direction.UP);
        } else {
          Pair<Coordinate, Coordinate.Direction> _xifexpression_2 = null;
          if (((((next_position.getX() == (Day22.face + 1)) && 
            (next_position.getY() >= (Day22.double_face + 1))) && 
            (next_position.getY() <= Day22.triple_face)) && 
            Objects.equal(current_orientation, Coordinate.Direction.DOWN))) {
            int _y = next_position.getY();
            int _minus = (_y - Day22.face);
            Coordinate _coordinate_1 = new Coordinate(_minus, Day22.double_face);
            _xifexpression_2 = Pair.<Coordinate, Coordinate.Direction>of(_coordinate_1, Coordinate.Direction.LEFT);
          } else {
            Pair<Coordinate, Coordinate.Direction> _xifexpression_3 = null;
            if (((((next_position.getY() == (Day22.triple_face + 1)) && 
              (next_position.getX() >= 1)) && 
              (next_position.getX() <= Day22.face)) && 
              Objects.equal(current_orientation, Coordinate.Direction.RIGHT))) {
              int _x_1 = next_position.getX();
              int _minus_1 = ((Day22.triple_face + 1) - _x_1);
              Coordinate _coordinate_2 = new Coordinate(_minus_1, Day22.double_face);
              _xifexpression_3 = Pair.<Coordinate, Coordinate.Direction>of(_coordinate_2, Coordinate.Direction.LEFT);
            } else {
              Pair<Coordinate, Coordinate.Direction> _xifexpression_4 = null;
              if (((((next_position.getY() == (Day22.double_face + 1)) && 
                (next_position.getX() >= (Day22.double_face + 1))) && 
                (next_position.getX() <= Day22.triple_face)) && 
                Objects.equal(current_orientation, Coordinate.Direction.RIGHT))) {
                int _x_2 = next_position.getX();
                int _minus_2 = (_x_2 - Day22.double_face);
                int _minus_3 = ((Day22.face + 1) - _minus_2);
                Coordinate _coordinate_3 = new Coordinate(_minus_3, Day22.triple_face);
                _xifexpression_4 = Pair.<Coordinate, Coordinate.Direction>of(_coordinate_3, Coordinate.Direction.LEFT);
              } else {
                Pair<Coordinate, Coordinate.Direction> _xifexpression_5 = null;
                if (((((next_position.getX() == 0) && 
                  (next_position.getY() >= (Day22.double_face + 1))) && 
                  (next_position.getY() <= Day22.triple_face)) && 
                  Objects.equal(current_orientation, Coordinate.Direction.UP))) {
                  int _y_1 = next_position.getY();
                  int _minus_4 = (_y_1 - Day22.double_face);
                  Coordinate _coordinate_4 = new Coordinate(Day22.quadruple_face, _minus_4);
                  _xifexpression_5 = Pair.<Coordinate, Coordinate.Direction>of(_coordinate_4, Coordinate.Direction.UP);
                } else {
                  Pair<Coordinate, Coordinate.Direction> _xifexpression_6 = null;
                  if (((((next_position.getX() == (Day22.quadruple_face + 1)) && 
                    (next_position.getY() >= 1)) && 
                    (next_position.getY() <= Day22.face)) && 
                    Objects.equal(current_orientation, Coordinate.Direction.DOWN))) {
                    int _y_2 = next_position.getY();
                    int _plus_1 = (_y_2 + Day22.double_face);
                    Coordinate _coordinate_5 = new Coordinate(1, _plus_1);
                    _xifexpression_6 = Pair.<Coordinate, Coordinate.Direction>of(_coordinate_5, Coordinate.Direction.DOWN);
                  } else {
                    Pair<Coordinate, Coordinate.Direction> _xifexpression_7 = null;
                    if (((((next_position.getY() == (Day22.face + 1)) && 
                      (next_position.getX() >= (Day22.triple_face + 1))) && 
                      (next_position.getX() <= Day22.quadruple_face)) && 
                      Objects.equal(current_orientation, Coordinate.Direction.RIGHT))) {
                      int _x_3 = next_position.getX();
                      int _minus_5 = (_x_3 - Day22.double_face);
                      Coordinate _coordinate_6 = new Coordinate(Day22.triple_face, _minus_5);
                      _xifexpression_7 = Pair.<Coordinate, Coordinate.Direction>of(_coordinate_6, Coordinate.Direction.UP);
                    } else {
                      Pair<Coordinate, Coordinate.Direction> _xifexpression_8 = null;
                      if (((((next_position.getX() == (Day22.triple_face + 1)) && 
                        (next_position.getY() >= (Day22.face + 1))) && 
                        (next_position.getY() <= Day22.double_face)) && 
                        Objects.equal(current_orientation, Coordinate.Direction.DOWN))) {
                        int _y_3 = next_position.getY();
                        int _plus_2 = (_y_3 + Day22.double_face);
                        Coordinate _coordinate_7 = new Coordinate(_plus_2, Day22.face);
                        _xifexpression_8 = Pair.<Coordinate, Coordinate.Direction>of(_coordinate_7, Coordinate.Direction.LEFT);
                      } else {
                        Pair<Coordinate, Coordinate.Direction> _xifexpression_9 = null;
                        if (((((next_position.getY() == Day22.face) && 
                          (next_position.getX() >= (Day22.face + 1))) && 
                          (next_position.getX() <= Day22.double_face)) && 
                          Objects.equal(current_orientation, Coordinate.Direction.LEFT))) {
                          int _x_4 = next_position.getX();
                          int _minus_6 = (_x_4 - Day22.face);
                          Coordinate _coordinate_8 = new Coordinate((Day22.double_face + 1), _minus_6);
                          _xifexpression_9 = Pair.<Coordinate, Coordinate.Direction>of(_coordinate_8, Coordinate.Direction.DOWN);
                        } else {
                          Pair<Coordinate, Coordinate.Direction> _xifexpression_10 = null;
                          if (((((next_position.getX() == Day22.double_face) && 
                            (next_position.getY() >= 1)) && 
                            (next_position.getY() <= Day22.face)) && 
                            Objects.equal(current_orientation, Coordinate.Direction.UP))) {
                            int _y_4 = next_position.getY();
                            int _plus_3 = (_y_4 + Day22.face);
                            Coordinate _coordinate_9 = new Coordinate(_plus_3, (Day22.face + 1));
                            _xifexpression_10 = Pair.<Coordinate, Coordinate.Direction>of(_coordinate_9, Coordinate.Direction.RIGHT);
                          } else {
                            Pair<Coordinate, Coordinate.Direction> _xifexpression_11 = null;
                            if (((((next_position.getY() == 0) && 
                              (next_position.getX() >= (Day22.double_face + 1))) && 
                              (next_position.getX() <= Day22.triple_face)) && 
                              Objects.equal(current_orientation, Coordinate.Direction.LEFT))) {
                              int _x_5 = next_position.getX();
                              int _minus_7 = (_x_5 - Day22.double_face);
                              int _minus_8 = ((Day22.face + 1) - _minus_7);
                              Coordinate _coordinate_10 = new Coordinate(_minus_8, (Day22.face + 1));
                              _xifexpression_11 = Pair.<Coordinate, Coordinate.Direction>of(_coordinate_10, Coordinate.Direction.RIGHT);
                            } else {
                              Pair<Coordinate, Coordinate.Direction> _xifexpression_12 = null;
                              if (((((next_position.getY() == Day22.face) && 
                                (next_position.getX() >= 1)) && 
                                (next_position.getX() <= Day22.face)) && 
                                Objects.equal(current_orientation, Coordinate.Direction.LEFT))) {
                                int _x_6 = next_position.getX();
                                int _minus_9 = ((Day22.triple_face + 1) - _x_6);
                                Coordinate _coordinate_11 = new Coordinate(_minus_9, 1);
                                _xifexpression_12 = Pair.<Coordinate, Coordinate.Direction>of(_coordinate_11, Coordinate.Direction.RIGHT);
                              } else {
                                Pair<Coordinate, Coordinate.Direction> _xifexpression_13 = null;
                                if (((((next_position.getX() == 0) && 
                                  (next_position.getY() >= (Day22.face + 1))) && 
                                  (next_position.getY() <= Day22.double_face)) && 
                                  Objects.equal(current_orientation, Coordinate.Direction.UP))) {
                                  int _y_5 = next_position.getY();
                                  int _plus_4 = (_y_5 + Day22.double_face);
                                  Coordinate _coordinate_12 = new Coordinate(_plus_4, 1);
                                  _xifexpression_13 = Pair.<Coordinate, Coordinate.Direction>of(_coordinate_12, Coordinate.Direction.RIGHT);
                                } else {
                                  Pair<Coordinate, Coordinate.Direction> _xifexpression_14 = null;
                                  if (((((next_position.getY() == 0) && 
                                    (next_position.getX() >= (Day22.triple_face + 1))) && 
                                    (next_position.getX() <= Day22.quadruple_face)) && 
                                    Objects.equal(current_orientation, Coordinate.Direction.LEFT))) {
                                    int _x_7 = next_position.getX();
                                    int _minus_10 = (_x_7 - Day22.double_face);
                                    Coordinate _coordinate_13 = new Coordinate(1, _minus_10);
                                    _xifexpression_14 = Pair.<Coordinate, Coordinate.Direction>of(_coordinate_13, Coordinate.Direction.DOWN);
                                  }
                                  _xifexpression_13 = _xifexpression_14;
                                }
                                _xifexpression_12 = _xifexpression_13;
                              }
                              _xifexpression_11 = _xifexpression_12;
                            }
                            _xifexpression_10 = _xifexpression_11;
                          }
                          _xifexpression_9 = _xifexpression_10;
                        }
                        _xifexpression_8 = _xifexpression_9;
                      }
                      _xifexpression_7 = _xifexpression_8;
                    }
                    _xifexpression_6 = _xifexpression_7;
                  }
                  _xifexpression_5 = _xifexpression_6;
                }
                _xifexpression_4 = _xifexpression_5;
              }
              _xifexpression_3 = _xifexpression_4;
            }
            _xifexpression_2 = _xifexpression_3;
          }
          _xifexpression_1 = _xifexpression_2;
        }
        _xifexpression = _xifexpression_1;
      } else {
        _xifexpression = Pair.<Coordinate, Coordinate.Direction>of(next_position, current_orientation);
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }

  public static void main(final String[] args) {
    final Function2<Coordinate, Boolean, Boolean> _function = new Function2<Coordinate, Boolean, Boolean>() {
      public Boolean apply(final Coordinate k, final Boolean v) {
        return Boolean.valueOf(((k.getX() == 1) && (v).booleanValue()));
      }
    };
    final Function1<Coordinate, Integer> _function_1 = new Function1<Coordinate, Integer>() {
      public Integer apply(final Coordinate it) {
        return Integer.valueOf(it.getY());
      }
    };
    Coordinate current_position = IterableExtensions.<Coordinate, Integer>minBy(MapExtensions.<Coordinate, Boolean>filter(Day22.tiles, _function).keySet(), _function_1);
    Coordinate.Direction current_orientation = Coordinate.Direction.RIGHT;
    Pair<Coordinate, Coordinate.Direction> current_full_position = Pair.<Coordinate, Coordinate.Direction>of(current_position, current_orientation);
    for (final String s : Day22.movements) {
      boolean _matched = false;
      if (Objects.equal(s, "L")) {
        _matched=true;
        current_orientation = Coordinate.counterClockWise(current_orientation);
        Coordinate _key = current_full_position.getKey();
        Coordinate.Direction _counterClockWise = Coordinate.counterClockWise(current_full_position.getValue());
        Pair<Coordinate, Coordinate.Direction> _mappedTo = Pair.<Coordinate, Coordinate.Direction>of(_key, _counterClockWise);
        current_full_position = _mappedTo;
      }
      if (!_matched) {
        if (Objects.equal(s, "R")) {
          _matched=true;
          current_orientation = Coordinate.clockWise(current_orientation);
          Coordinate _key_1 = current_full_position.getKey();
          Coordinate.Direction _clockWise = Coordinate.clockWise(current_full_position.getValue());
          Pair<Coordinate, Coordinate.Direction> _mappedTo_1 = Pair.<Coordinate, Coordinate.Direction>of(_key_1, _clockWise);
          current_full_position = _mappedTo_1;
        }
      }
      if (!_matched) {
        {
          final int steps = Integer.parseInt(s);
          int i = steps;
          Coordinate next_position = Day22.nextPosition(current_position, current_orientation);
          while (((i != 0) && (Day22.tiles.get(next_position)).booleanValue())) {
            {
              i--;
              current_position = next_position;
              next_position = Day22.nextPosition(current_position, current_orientation);
            }
          }
          i = steps;
          Pair<Coordinate, Coordinate.Direction> next_full_position = Day22.nextPosition2(current_full_position);
          while (((i != 0) && (Day22.tiles.get(next_full_position.getKey())).booleanValue())) {
            {
              i--;
              current_full_position = next_full_position;
              next_full_position = Day22.nextPosition2(current_full_position);
            }
          }
        }
      }
    }
    int _x = current_position.getX();
    int _multiply = (_x * 1000);
    int _y = current_position.getY();
    int _multiply_1 = (4 * _y);
    int _plus = (_multiply + _multiply_1);
    int _directionValue = Coordinate.directionValue(current_orientation);
    int _plus_1 = (_plus + _directionValue);
    InputOutput.<Integer>println(Integer.valueOf(_plus_1));
    int _x_1 = current_full_position.getKey().getX();
    int _multiply_2 = (_x_1 * 1000);
    int _y_1 = current_full_position.getKey().getY();
    int _multiply_3 = (4 * _y_1);
    int _plus_2 = (_multiply_2 + _multiply_3);
    int _directionValue_1 = Coordinate.directionValue(current_full_position.getValue());
    int _plus_3 = (_plus_2 + _directionValue_1);
    InputOutput.<Integer>println(Integer.valueOf(_plus_3));
  }
}
