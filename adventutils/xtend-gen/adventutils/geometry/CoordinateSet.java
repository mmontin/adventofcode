package adventutils.geometry;

import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class CoordinateSet extends HashSet<Coordinate> {
  public int minX;

  public int maxX;

  public int minY;

  public int maxY;

  public CoordinateSet() {
    super();
    this.setBoundaries(0, 0, 0, 0);
  }

  public CoordinateSet(final Collection<? extends Coordinate> col) {
    super(col);
  }

  public CoordinateSet(final List<String> lines) {
    this();
    final Function1<String, List<String>> _function = (String it) -> {
      final Function1<Character, String> _function_1 = (Character it_1) -> {
        return (it_1 + "");
      };
      return ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray(it.toCharArray())), _function_1);
    };
    final List<List<String>> chars = ListExtensions.<String, List<String>>map(lines, _function);
    final int max_x = chars.size();
    final int max_y = chars.get(0).size();
    final Consumer<Integer> _function_1 = (Integer i) -> {
      final List<String> current_line = chars.get((i).intValue());
      final Consumer<Integer> _function_2 = (Integer j) -> {
        boolean _equals = current_line.get((j).intValue()).equals("#");
        if (_equals) {
          Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
          this.add(_coordinate);
        }
      };
      new ExclusiveRange(0, max_y, true).forEach(_function_2);
    };
    new ExclusiveRange(0, max_x, true).forEach(_function_1);
  }

  public CoordinateSet(final List<String> lines, final String other, final Set<Coordinate> otherSet) {
    this();
    final Function1<String, List<String>> _function = (String it) -> {
      final Function1<Character, String> _function_1 = (Character it_1) -> {
        return (it_1 + "");
      };
      return ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray(it.toCharArray())), _function_1);
    };
    final List<List<String>> chars = ListExtensions.<String, List<String>>map(lines, _function);
    final int max_x = chars.size();
    final int max_y = chars.get(0).size();
    final Consumer<Integer> _function_1 = (Integer i) -> {
      final List<String> current_line = chars.get((i).intValue());
      final Consumer<Integer> _function_2 = (Integer j) -> {
        boolean _equals = current_line.get((j).intValue()).equals("#");
        if (_equals) {
          Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
          this.add(_coordinate);
        } else {
          boolean _equals_1 = current_line.get((j).intValue()).equals(other);
          if (_equals_1) {
            Coordinate _coordinate_1 = new Coordinate((i).intValue(), (j).intValue());
            otherSet.add(_coordinate_1);
          }
        }
      };
      new ExclusiveRange(0, max_y, true).forEach(_function_2);
    };
    new ExclusiveRange(0, max_x, true).forEach(_function_1);
  }

  public int setBoundaries(final int minX_, final int maxX_, final int minY_, final int maxY_) {
    int _xblockexpression = (int) 0;
    {
      this.minX = minX_;
      this.maxX = maxX_;
      this.minY = minY_;
      _xblockexpression = this.maxY = maxY_;
    }
    return _xblockexpression;
  }

  @Override
  public boolean add(final Coordinate c) {
    boolean _xblockexpression = false;
    {
      int _x = c.getX();
      boolean _lessThan = (_x < this.minX);
      if (_lessThan) {
        this.minX = c.getX();
      }
      int _x_1 = c.getX();
      boolean _greaterThan = (_x_1 > this.maxX);
      if (_greaterThan) {
        this.maxX = c.getX();
      }
      int _y = c.getY();
      boolean _lessThan_1 = (_y < this.minY);
      if (_lessThan_1) {
        this.minY = c.getY();
      }
      int _y_1 = c.getY();
      boolean _greaterThan_1 = (_y_1 > this.maxY);
      if (_greaterThan_1) {
        this.maxY = c.getY();
      }
      _xblockexpression = super.add(c);
    }
    return _xblockexpression;
  }

  @Override
  public boolean remove(final Object c) {
    boolean _xblockexpression = false;
    {
      final boolean res = super.remove(c);
      final Coordinate myCoord = ((Coordinate) c);
      int _x = myCoord.getX();
      boolean _equals = (_x == this.minX);
      if (_equals) {
        final Function1<Coordinate, Integer> _function = (Coordinate it) -> {
          return Integer.valueOf(it.getX());
        };
        this.minX = IterableExtensions.<Coordinate, Integer>minBy(this, _function).getX();
      }
      int _x_1 = myCoord.getX();
      boolean _equals_1 = (_x_1 == this.maxX);
      if (_equals_1) {
        final Function1<Coordinate, Integer> _function_1 = (Coordinate it) -> {
          return Integer.valueOf(it.getX());
        };
        this.maxX = IterableExtensions.<Coordinate, Integer>maxBy(this, _function_1).getX();
      }
      int _y = myCoord.getY();
      boolean _equals_2 = (_y == this.minY);
      if (_equals_2) {
        final Function1<Coordinate, Integer> _function_2 = (Coordinate it) -> {
          return Integer.valueOf(it.getY());
        };
        this.minY = IterableExtensions.<Coordinate, Integer>minBy(this, _function_2).getY();
      }
      int _y_1 = myCoord.getY();
      boolean _equals_3 = (_y_1 == this.maxY);
      if (_equals_3) {
        final Function1<Coordinate, Integer> _function_3 = (Coordinate it) -> {
          return Integer.valueOf(it.getY());
        };
        this.maxY = IterableExtensions.<Coordinate, Integer>maxBy(this, _function_3).getY();
      }
      _xblockexpression = res;
    }
    return _xblockexpression;
  }

  public Iterable<Coordinate> line(final int x) {
    final Function1<Coordinate, Boolean> _function = (Coordinate it) -> {
      int _x = it.getX();
      return Boolean.valueOf((_x == x));
    };
    return IterableExtensions.<Coordinate>filter(this, _function);
  }

  public Iterable<Coordinate> column(final int y) {
    final Function1<Coordinate, Boolean> _function = (Coordinate it) -> {
      int _y = it.getY();
      return Boolean.valueOf((_y == y));
    };
    return IterableExtensions.<Coordinate>filter(this, _function);
  }

  public CoordinateSet invertSet() {
    CoordinateSet _xblockexpression = null;
    {
      final CoordinateSet output = new CoordinateSet();
      final Consumer<Integer> _function = (Integer i) -> {
        final Consumer<Integer> _function_1 = (Integer j) -> {
          final Coordinate newCoord = new Coordinate((i).intValue(), (j).intValue());
          boolean _contains = this.contains(newCoord);
          boolean _not = (!_contains);
          if (_not) {
            output.add(newCoord);
          }
        };
        new IntegerRange(this.minY, this.maxY).forEach(_function_1);
      };
      new IntegerRange(this.minX, this.maxX).forEach(_function);
      _xblockexpression = output;
    }
    return _xblockexpression;
  }

  @Override
  public String toString() {
    String _xifexpression = null;
    boolean _isEmpty = this.isEmpty();
    if (_isEmpty) {
      _xifexpression = InputOutput.<String>println("This set is empty");
    } else {
      String _xblockexpression = null;
      {
        String output = "";
        IntegerRange _upTo = new IntegerRange(this.minX, this.maxX);
        for (final Integer i : _upTo) {
          {
            IntegerRange _upTo_1 = new IntegerRange(this.minY, this.maxY);
            for (final Integer j : _upTo_1) {
              String _output = output;
              String _xifexpression_1 = null;
              Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
              boolean _contains = this.contains(_coordinate);
              if (_contains) {
                _xifexpression_1 = "#";
              } else {
                _xifexpression_1 = ".";
              }
              output = (_output + _xifexpression_1);
            }
            String _output_1 = output;
            output = (_output_1 + "\n");
          }
        }
        _xblockexpression = output;
      }
      _xifexpression = _xblockexpression;
    }
    return _xifexpression;
  }
}
