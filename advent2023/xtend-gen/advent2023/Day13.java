package advent2023;

import java.io.BufferedReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

import com.google.common.base.Objects;

import adventutils.geometry.Coordinate;
import adventutils.geometry.CoordinateSet;
import adventutils.input.InputLoader;

@SuppressWarnings("all")
public class Day13 {
  public static void main(final String[] args) {
    try {
      final BufferedReader br = new InputLoader(Integer.valueOf(2023), Integer.valueOf(13)).getInputReader();
      final ArrayList<CoordinateSet> tiles = CollectionLiterals.<CoordinateSet>newArrayList();
      final List<String> current_tile = CollectionLiterals.<String>newArrayList();
      while (br.ready()) {
        {
          final String current_line = br.readLine();
          if ((current_line.isEmpty() || (!br.ready()))) {
            CoordinateSet _coordinateSet = new CoordinateSet(current_tile);
            tiles.add(_coordinateSet);
            current_tile.clear();
          } else {
            current_tile.add(current_line);
          }
        }
      }
      Pair<Integer, Integer> _mappedTo = Pair.<Integer, Integer>of(Integer.valueOf(0), Integer.valueOf(0));
      final Function2<Pair<Integer, Integer>, CoordinateSet, Pair<Integer, Integer>> _function = new Function2<Pair<Integer, Integer>, CoordinateSet, Pair<Integer, Integer>>() {
        public Pair<Integer, Integer> apply(final Pair<Integer, Integer> acc, final CoordinateSet el) {
          Integer _key = acc.getKey();
          Integer _process = Day13.process(el);
          int _plus = ((_key).intValue() + (_process).intValue());
          Integer _value = acc.getValue();
          Integer _process2 = Day13.process2(el);
          int _plus_1 = ((_value).intValue() + (_process2).intValue());
          return Pair.<Integer, Integer>of(Integer.valueOf(_plus), Integer.valueOf(_plus_1));
        }
      };
      InputOutput.<Pair<Integer, Integer>>println(IterableExtensions.<CoordinateSet, Pair<Integer, Integer>>fold(tiles, _mappedTo, _function));
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }

  public static boolean processSym(final CoordinateSet tile, final boolean isLine, final int i) {
    boolean _xblockexpression = false;
    {
      int _xifexpression = (int) 0;
      if (isLine) {
        _xifexpression = tile.minX;
      } else {
        _xifexpression = tile.minY;
      }
      final int min = _xifexpression;
      int _xifexpression_1 = (int) 0;
      if (isLine) {
        _xifexpression_1 = tile.maxX;
      } else {
        _xifexpression_1 = tile.maxY;
      }
      final int max = _xifexpression_1;
      boolean _xifexpression_2 = false;
      if ((((i - 1) < min) || (i > max))) {
        _xifexpression_2 = false;
      } else {
        boolean _xblockexpression_1 = false;
        {
          int n = 1;
          boolean ans = true;
          while (((((i - n) >= min) && (((i + n) - 1) <= max)) && ans)) {
            {
              Pair<Iterable<Integer>, Iterable<Integer>> _xifexpression_3 = null;
              if (isLine) {
                final Function1<Coordinate, Integer> _function = new Function1<Coordinate, Integer>() {
                  public Integer apply(final Coordinate it) {
                    return Integer.valueOf(it.getY());
                  }
                };
                Iterable<Integer> _map = IterableExtensions.<Coordinate, Integer>map(tile.line((i - n)), _function);
                final Function1<Coordinate, Integer> _function_1 = new Function1<Coordinate, Integer>() {
                  public Integer apply(final Coordinate it) {
                    return Integer.valueOf(it.getY());
                  }
                };
                Iterable<Integer> _map_1 = IterableExtensions.<Coordinate, Integer>map(tile.line(((i + n) - 1)), _function_1);
                _xifexpression_3 = Pair.<Iterable<Integer>, Iterable<Integer>>of(_map, _map_1);
              } else {
                final Function1<Coordinate, Integer> _function_2 = new Function1<Coordinate, Integer>() {
                  public Integer apply(final Coordinate it) {
                    return Integer.valueOf(it.getX());
                  }
                };
                Iterable<Integer> _map_2 = IterableExtensions.<Coordinate, Integer>map(tile.column((i - n)), _function_2);
                final Function1<Coordinate, Integer> _function_3 = new Function1<Coordinate, Integer>() {
                  public Integer apply(final Coordinate it) {
                    return Integer.valueOf(it.getX());
                  }
                };
                Iterable<Integer> _map_3 = IterableExtensions.<Coordinate, Integer>map(tile.column(((i + n) - 1)), _function_3);
                _xifexpression_3 = Pair.<Iterable<Integer>, Iterable<Integer>>of(_map_2, _map_3);
              }
              final Pair<Iterable<Integer>, Iterable<Integer>> lines = _xifexpression_3;
              ans = (ans && IterableExtensions.<Integer>toSet(lines.getKey()).equals(IterableExtensions.<Integer>toSet(lines.getValue())));
              n++;
            }
          }
          _xblockexpression_1 = ans;
        }
        _xifexpression_2 = _xblockexpression_1;
      }
      _xblockexpression = _xifexpression_2;
    }
    return _xblockexpression;
  }

  public static boolean processSym2(final CoordinateSet tile, final boolean isLine, final int i) {
    boolean _xblockexpression = false;
    {
      int _xifexpression = (int) 0;
      if (isLine) {
        _xifexpression = tile.minX;
      } else {
        _xifexpression = tile.minY;
      }
      final int min = _xifexpression;
      int _xifexpression_1 = (int) 0;
      if (isLine) {
        _xifexpression_1 = tile.maxX;
      } else {
        _xifexpression_1 = tile.maxY;
      }
      final int max = _xifexpression_1;
      boolean _xifexpression_2 = false;
      if ((((i - 1) < min) || (i > max))) {
        _xifexpression_2 = false;
      } else {
        boolean _xblockexpression_1 = false;
        {
          int n = 1;
          boolean ans = true;
          boolean smudged = false;
          while (((((i - n) >= min) && (((i + n) - 1) <= max)) && ans)) {
            {
              Pair<Set<Integer>, Set<Integer>> _xifexpression_3 = null;
              if (isLine) {
                final Function1<Coordinate, Integer> _function = new Function1<Coordinate, Integer>() {
                  public Integer apply(final Coordinate it) {
                    return Integer.valueOf(it.getY());
                  }
                };
                Set<Integer> _set = IterableExtensions.<Integer>toSet(IterableExtensions.<Coordinate, Integer>map(tile.line((i - n)), _function));
                final Function1<Coordinate, Integer> _function_1 = new Function1<Coordinate, Integer>() {
                  public Integer apply(final Coordinate it) {
                    return Integer.valueOf(it.getY());
                  }
                };
                Set<Integer> _set_1 = IterableExtensions.<Integer>toSet(IterableExtensions.<Coordinate, Integer>map(tile.line(((i + n) - 1)), _function_1));
                _xifexpression_3 = Pair.<Set<Integer>, Set<Integer>>of(_set, _set_1);
              } else {
                final Function1<Coordinate, Integer> _function_2 = new Function1<Coordinate, Integer>() {
                  public Integer apply(final Coordinate it) {
                    return Integer.valueOf(it.getX());
                  }
                };
                Set<Integer> _set_2 = IterableExtensions.<Integer>toSet(IterableExtensions.<Coordinate, Integer>map(tile.column((i - n)), _function_2));
                final Function1<Coordinate, Integer> _function_3 = new Function1<Coordinate, Integer>() {
                  public Integer apply(final Coordinate it) {
                    return Integer.valueOf(it.getX());
                  }
                };
                Set<Integer> _set_3 = IterableExtensions.<Integer>toSet(IterableExtensions.<Coordinate, Integer>map(tile.column(((i + n) - 1)), _function_3));
                _xifexpression_3 = Pair.<Set<Integer>, Set<Integer>>of(_set_2, _set_3);
              }
              final Pair<Set<Integer>, Set<Integer>> lines = _xifexpression_3;
              boolean _equals = lines.getKey().equals(lines.getValue());
              if (_equals) {
                n++;
              } else {
                int _size = lines.getKey().size();
                int _size_1 = lines.getValue().size();
                int _minus = (_size - _size_1);
                int _abs = Math.abs(_minus);
                boolean _notEquals = (_abs != 1);
                if (_notEquals) {
                  ans = false;
                } else {
                  if (smudged) {
                    ans = false;
                  } else {
                    Set<Integer> _xifexpression_4 = null;
                    int _size_2 = lines.getKey().size();
                    int _size_3 = lines.getValue().size();
                    boolean _greaterThan = (_size_2 > _size_3);
                    if (_greaterThan) {
                      _xifexpression_4 = lines.getKey();
                    } else {
                      _xifexpression_4 = lines.getValue();
                    }
                    final Set<Integer> big_one = _xifexpression_4;
                    Set<Integer> _xifexpression_5 = null;
                    Set<Integer> _key = lines.getKey();
                    boolean _equals_1 = Objects.equal(big_one, _key);
                    if (_equals_1) {
                      _xifexpression_5 = lines.getValue();
                    } else {
                      _xifexpression_5 = lines.getKey();
                    }
                    final Set<Integer> small_one = _xifexpression_5;
                    big_one.removeAll(small_one);
                    int _size_4 = big_one.size();
                    boolean _equals_2 = (_size_4 == 1);
                    if (_equals_2) {
                      smudged = true;
                      n++;
                    } else {
                      ans = false;
                    }
                  }
                }
              }
            }
          }
          _xblockexpression_1 = (ans && smudged);
        }
        _xifexpression_2 = _xblockexpression_1;
      }
      _xblockexpression = _xifexpression_2;
    }
    return _xblockexpression;
  }

  public static Integer process(final CoordinateSet tile) {
    Integer _xblockexpression = null;
    {
      final Function1<Integer, Boolean> _function = new Function1<Integer, Boolean>() {
        public Boolean apply(final Integer i) {
          return Boolean.valueOf(Day13.processSym(tile, true, (i).intValue()));
        }
      };
      final Integer sym_line = IterableExtensions.<Integer>findFirst(new IntegerRange(1, tile.maxX), _function);
      Integer _xifexpression = null;
      if ((sym_line != null)) {
        _xifexpression = Integer.valueOf((100 * (sym_line).intValue()));
      } else {
        final Function1<Integer, Boolean> _function_1 = new Function1<Integer, Boolean>() {
          public Boolean apply(final Integer j) {
            return Boolean.valueOf(Day13.processSym(tile, false, (j).intValue()));
          }
        };
        _xifexpression = IterableExtensions.<Integer>findFirst(new IntegerRange(1, tile.maxY), _function_1);
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }

  public static Integer process2(final CoordinateSet tile) {
    Integer _xblockexpression = null;
    {
      final Function1<Integer, Boolean> _function = new Function1<Integer, Boolean>() {
        public Boolean apply(final Integer i) {
          return Boolean.valueOf(Day13.processSym2(tile, true, (i).intValue()));
        }
      };
      final Integer sym_line = IterableExtensions.<Integer>findFirst(new IntegerRange(1, tile.maxX), _function);
      Integer _xifexpression = null;
      if ((sym_line != null)) {
        _xifexpression = Integer.valueOf((100 * (sym_line).intValue()));
      } else {
        final Function1<Integer, Boolean> _function_1 = new Function1<Integer, Boolean>() {
          public Boolean apply(final Integer j) {
            return Boolean.valueOf(Day13.processSym2(tile, false, (j).intValue()));
          }
        };
        _xifexpression = IterableExtensions.<Integer>findFirst(new IntegerRange(1, tile.maxY), _function_1);
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }
}
