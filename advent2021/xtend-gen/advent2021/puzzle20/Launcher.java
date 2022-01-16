package advent2021.puzzle20;

import adventutils.input.InputLoader;
import java.io.BufferedReader;
import java.util.HashSet;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Launcher {
  private static Set<Integer> table = CollectionLiterals.<Integer>newHashSet();
  
  public static void main(final String[] args) {
    try {
      final BufferedReader ir = new InputLoader(Integer.valueOf(2021), Integer.valueOf(20)).getInputReader();
      final String first = ir.readLine();
      int _length = first.length();
      ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, _length, true);
      for (final Integer i : _doubleDotLessThan) {
        char _charAt = first.charAt((i).intValue());
        boolean _equals = (Character.valueOf(_charAt) + "").equals("#");
        if (_equals) {
          Launcher.table.add(i);
        }
      }
      HashSet<Coordinate> ones = CollectionLiterals.<Coordinate>newHashSet();
      String current = ir.readLine();
      int i_1 = 0;
      while (((current = ir.readLine()) != null)) {
        {
          int _length_1 = current.length();
          ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(0, _length_1, true);
          for (final Integer j : _doubleDotLessThan_1) {
            char _charAt_1 = current.charAt((j).intValue());
            boolean _equals_1 = (Character.valueOf(_charAt_1) + "").equals("#");
            if (_equals_1) {
              Coordinate _coordinate = new Coordinate(i_1, (j).intValue());
              ones.add(_coordinate);
            }
          }
          i_1++;
        }
      }
      final long start_time = System.currentTimeMillis();
      int flicker = 0;
      ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(0, 50, true);
      for (final Integer rep : _doubleDotLessThan_1) {
        {
          ones = Launcher.step(ones, flicker);
          flicker = (1 - flicker);
          if (((rep).intValue() == 1)) {
            int _size = ones.size();
            String _plus = ("PART 1: " + Integer.valueOf(_size));
            InputOutput.<String>println(_plus);
          }
        }
      }
      int _size = ones.size();
      String _plus = ("PART 2: " + Integer.valueOf(_size));
      InputOutput.<String>println(_plus);
      long _currentTimeMillis = System.currentTimeMillis();
      long _minus = (_currentTimeMillis - start_time);
      String _plus_1 = ("Computation time: " + Long.valueOf(_minus));
      String _plus_2 = (_plus_1 + "ms");
      InputOutput.<String>println(_plus_2);
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
  
  public static HashSet<Coordinate> step(final Set<Coordinate> input, final int flicker) {
    HashSet<Coordinate> _xblockexpression = null;
    {
      final Function1<Coordinate, Integer> _function = new Function1<Coordinate, Integer>() {
        public Integer apply(final Coordinate it) {
          return Integer.valueOf(it.x);
        }
      };
      int minx = IterableExtensions.<Coordinate, Integer>minBy(input, _function).x;
      final Function1<Coordinate, Integer> _function_1 = new Function1<Coordinate, Integer>() {
        public Integer apply(final Coordinate it) {
          return Integer.valueOf(it.x);
        }
      };
      int maxx = IterableExtensions.<Coordinate, Integer>maxBy(input, _function_1).x;
      final Function1<Coordinate, Integer> _function_2 = new Function1<Coordinate, Integer>() {
        public Integer apply(final Coordinate it) {
          return Integer.valueOf(it.y);
        }
      };
      int miny = IterableExtensions.<Coordinate, Integer>minBy(input, _function_2).y;
      final Function1<Coordinate, Integer> _function_3 = new Function1<Coordinate, Integer>() {
        public Integer apply(final Coordinate it) {
          return Integer.valueOf(it.y);
        }
      };
      int maxy = IterableExtensions.<Coordinate, Integer>maxBy(input, _function_3).y;
      final HashSet<Coordinate> output = CollectionLiterals.<Coordinate>newHashSet();
      IntegerRange _upTo = new IntegerRange((minx - 1), (maxx + 1));
      for (final Integer i : _upTo) {
        IntegerRange _upTo_1 = new IntegerRange((miny - 1), (maxy + 1));
        for (final Integer j : _upTo_1) {
          {
            String s = "";
            IntegerRange _upTo_2 = new IntegerRange(((i).intValue() - 1), ((i).intValue() + 1));
            for (final Integer k : _upTo_2) {
              IntegerRange _upTo_3 = new IntegerRange(((j).intValue() - 1), ((j).intValue() + 1));
              for (final Integer l : _upTo_3) {
                String _s = s;
                Object _xifexpression = null;
                if ((((((k).intValue() < minx) || ((k).intValue() > maxx)) || ((l).intValue() < miny)) || ((l).intValue() > maxy))) {
                  _xifexpression = Integer.valueOf(flicker);
                } else {
                  String _xifexpression_1 = null;
                  Coordinate _coordinate = new Coordinate((k).intValue(), (l).intValue());
                  boolean _contains = input.contains(_coordinate);
                  if (_contains) {
                    _xifexpression_1 = "1";
                  } else {
                    _xifexpression_1 = "0";
                  }
                  _xifexpression = _xifexpression_1;
                }
                s = (_s + _xifexpression);
              }
            }
            boolean _contains_1 = Launcher.table.contains(Integer.valueOf(Integer.parseInt(s, 2)));
            if (_contains_1) {
              Coordinate _coordinate_1 = new Coordinate((i).intValue(), (j).intValue());
              output.add(_coordinate_1);
            }
          }
        }
      }
      _xblockexpression = output;
    }
    return _xblockexpression;
  }
}
