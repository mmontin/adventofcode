package advent2023;

import adventutils.geometry.Coordinate;
import adventutils.geometry.CoordinateSet;
import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Day14 {
  private static final List<String> lines = new Function0<List<String>>() {
    @Override
    public List<String> apply() {
      ArrayList<String> _xblockexpression = null;
      {
        final List<String> output = new InputLoader(Integer.valueOf(2023), Integer.valueOf(14)).getInputs();
        output.add(0, "#".repeat(output.get(0).length()));
        output.add("#".repeat(output.get(0).length()));
        final Function1<String, String> _function = (String it) -> {
          return (("#" + it) + "#");
        };
        List<String> _map = ListExtensions.<String, String>map(output, _function);
        _xblockexpression = new ArrayList<String>(_map);
      }
      return _xblockexpression;
    }
  }.apply();

  private static final int max_x = (Day14.lines.size() - 1);

  private static final int max_y = (Day14.lines.get(0).length() - 1);

  private static final CoordinateSet rolling = new CoordinateSet();

  private static final CoordinateSet steady = new CoordinateSet(Day14.lines, "O", Day14.rolling);

  public static void main(final String[] args) {
    Day14.process(true, true);
    InputOutput.<Integer>println(Day14.load());
    Day14.process(false, true);
    ArrayList<HashSet<Coordinate>> cycles = CollectionLiterals.<HashSet<Coordinate>>newArrayList();
    HashSet<Coordinate> current = new HashSet<Coordinate>(Day14.rolling);
    int i = 0;
    int pos = (-1);
    while ((pos == (-1))) {
      {
        cycles.add(current);
        i++;
        Day14.cycle();
        HashSet<Coordinate> _hashSet = new HashSet<Coordinate>(Day14.rolling);
        current = _hashSet;
        pos = cycles.indexOf(current);
      }
    }
    final int equivalent = ((((999999999 - pos) % (i - pos)) + pos) + 1);
    Day14.rolling.clear();
    Day14.rolling.addAll(cycles.get(equivalent));
    InputOutput.<Integer>println(Day14.load());
  }

  public static void cycle() {
    Day14.process(true, true);
    Day14.process(true, false);
    Day14.process(false, true);
    Day14.process(false, false);
  }

  public static void process(final boolean up, final boolean col) {
    int _xifexpression = (int) 0;
    if (col) {
      _xifexpression = Day14.max_y;
    } else {
      _xifexpression = Day14.max_x;
    }
    int _minus = (_xifexpression - 1);
    final Consumer<Integer> _function = (Integer it) -> {
      Day14.processCol((it).intValue(), up, col);
    };
    new IntegerRange(1, _minus).forEach(_function);
  }

  public static Integer load() {
    final Function2<Integer, Coordinate, Integer> _function = (Integer sum, Coordinate el) -> {
      int _x = el.getX();
      int _minus = (Day14.max_x - _x);
      return Integer.valueOf(((sum).intValue() + _minus));
    };
    return IterableExtensions.<Coordinate, Integer>fold(Day14.rolling, Integer.valueOf(0), _function);
  }

  public static void processCol(final int j, final boolean up, final boolean col) {
    int _xifexpression = (int) 0;
    if (col) {
      _xifexpression = Day14.max_x;
    } else {
      _xifexpression = Day14.max_y;
    }
    final int max = _xifexpression;
    int _xifexpression_1 = (int) 0;
    if (up) {
      _xifexpression_1 = 0;
    } else {
      _xifexpression_1 = max;
    }
    int last_wall = _xifexpression_1;
    int nb_of_rollings = 0;
    int _xifexpression_2 = (int) 0;
    if (up) {
      _xifexpression_2 = 1;
    } else {
      _xifexpression_2 = (max - 1);
    }
    int i = _xifexpression_2;
    boolean _xifexpression_3 = false;
    if (up) {
      _xifexpression_3 = (i <= max);
    } else {
      _xifexpression_3 = (i >= 0);
    }
    boolean _while = _xifexpression_3;
    while (_while) {
      {
        Coordinate _xifexpression_4 = null;
        if (col) {
          _xifexpression_4 = new Coordinate(i, j);
        } else {
          _xifexpression_4 = new Coordinate(j, i);
        }
        final Coordinate current = _xifexpression_4;
        boolean _contains = Day14.steady.contains(current);
        if (_contains) {
          ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, nb_of_rollings, true);
          for (final Integer k : _doubleDotLessThan) {
            Coordinate _xifexpression_5 = null;
            if (col) {
              int _xifexpression_6 = (int) 0;
              if (up) {
                _xifexpression_6 = ((k).intValue() + 1);
              } else {
                _xifexpression_6 = ((-(k).intValue()) - 1);
              }
              int _plus = (last_wall + _xifexpression_6);
              _xifexpression_5 = new Coordinate(_plus, j);
            } else {
              int _xifexpression_7 = (int) 0;
              if (up) {
                _xifexpression_7 = ((k).intValue() + 1);
              } else {
                _xifexpression_7 = ((-(k).intValue()) - 1);
              }
              int _plus_1 = (last_wall + _xifexpression_7);
              _xifexpression_5 = new Coordinate(j, _plus_1);
            }
            Day14.rolling.add(_xifexpression_5);
          }
          int _xifexpression_8 = (int) 0;
          if (col) {
            _xifexpression_8 = current.getX();
          } else {
            _xifexpression_8 = current.getY();
          }
          last_wall = _xifexpression_8;
          nb_of_rollings = 0;
        } else {
          boolean _contains_1 = Day14.rolling.contains(current);
          if (_contains_1) {
            nb_of_rollings++;
            Day14.rolling.remove(current);
          }
        }
        if (up) {
          i++;
        } else {
          i--;
        }
      }
      boolean _xifexpression_4 = false;
      if (up) {
        _xifexpression_4 = (i <= max);
      } else {
        _xifexpression_4 = (i >= 0);
      }
      _while = _xifexpression_4;
    }
  }
}
