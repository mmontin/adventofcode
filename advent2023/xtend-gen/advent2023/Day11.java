package advent2023;

import java.util.ArrayList;
import java.util.List;

import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;

@SuppressWarnings("all")
public class Day11 {
  public static void main(final String[] args) {
    final List<List<String>> inputs = new InputLoader(Integer.valueOf(2023), Integer.valueOf(11)).getChars();
    int _size = inputs.size();
    final int max_x = (_size - 1);
    int _size_1 = inputs.get(0).size();
    int max_y = (_size_1 - 1);
    final Function1<Integer, Boolean> _function = new Function1<Integer, Boolean>() {
      public Boolean apply(final Integer y) {
        final Function1<Integer, String> _function = new Function1<Integer, String>() {
          public String apply(final Integer x) {
            return inputs.get((x).intValue()).get((y).intValue());
          }
        };
        final Function1<String, Boolean> _function_1 = new Function1<String, Boolean>() {
          public Boolean apply(final String it) {
            return Boolean.valueOf(it.equals("."));
          }
        };
        return Boolean.valueOf(IterableExtensions.<String>forall(IterableExtensions.<Integer, String>map(new IntegerRange(0, max_x), _function), _function_1));
      }
    };
    final List<Boolean> empty_cols = IterableExtensions.<Boolean>toList(IterableExtensions.<Integer, Boolean>map(new IntegerRange(0, max_y), _function));
    final ArrayList<Coordinate> galaxies_1 = CollectionLiterals.<Coordinate>newArrayList();
    final ArrayList<Coordinate> galaxies_2 = CollectionLiterals.<Coordinate>newArrayList();
    int x_offset_1 = 0;
    int x_offset_2 = 0;
    int y_offset_1 = 0;
    int y_offset_2 = 0;
    IntegerRange _upTo = new IntegerRange(0, max_x);
    for (final Integer x : _upTo) {
      {
        final List<String> line = inputs.get((x).intValue());
        y_offset_1 = 0;
        y_offset_2 = 0;
        final Function1<String, Boolean> _function_1 = new Function1<String, Boolean>() {
          public Boolean apply(final String it) {
            return Boolean.valueOf(it.equals("."));
          }
        };
        boolean _forall = IterableExtensions.<String>forall(line, _function_1);
        if (_forall) {
          int _x_offset_1 = x_offset_1;
          x_offset_1 = (_x_offset_1 + 1);
          int _x_offset_2 = x_offset_2;
          x_offset_2 = (_x_offset_2 + 999999);
        } else {
          IntegerRange _upTo_1 = new IntegerRange(0, max_y);
          for (final Integer y : _upTo_1) {
            Boolean _get = empty_cols.get((y).intValue());
            if ((_get).booleanValue()) {
              int _y_offset_1 = y_offset_1;
              y_offset_1 = (_y_offset_1 + 1);
              int _y_offset_2 = y_offset_2;
              y_offset_2 = (_y_offset_2 + 999999);
            } else {
              boolean _equals = line.get((y).intValue()).equals("#");
              if (_equals) {
                Coordinate _coordinate = new Coordinate(((x).intValue() + x_offset_1), ((y).intValue() + y_offset_1));
                galaxies_1.add(_coordinate);
                Coordinate _coordinate_1 = new Coordinate(((x).intValue() + x_offset_2), ((y).intValue() + y_offset_2));
                galaxies_2.add(_coordinate_1);
              }
            }
          }
        }
      }
    }
    final int nb_of_galaxies = galaxies_1.size();
    int distances_1 = 0;
    long distances_2 = 0L;
    ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, nb_of_galaxies, true);
    for (final Integer x_1 : _doubleDotLessThan) {
      ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(((x_1).intValue() + 1), nb_of_galaxies, true);
      for (final Integer y : _doubleDotLessThan_1) {
        {
          int _distances_1 = distances_1;
          int _manhattanDistanceTo = galaxies_1.get((x_1).intValue()).manhattanDistanceTo(galaxies_1.get((y).intValue()));
          distances_1 = (_distances_1 + _manhattanDistanceTo);
          long _distances_2 = distances_2;
          int _manhattanDistanceTo_1 = galaxies_2.get((x_1).intValue()).manhattanDistanceTo(galaxies_2.get((y).intValue()));
          distances_2 = (_distances_2 + _manhattanDistanceTo_1);
        }
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(distances_1));
    InputOutput.<Long>println(Long.valueOf(distances_2));
  }
}
