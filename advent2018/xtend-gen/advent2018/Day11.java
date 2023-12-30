package advent2018;

import adventutils.geometry.Coordinate;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day11 {
  private static final int serial_id = 1723;

  private static final Map<Pair<Integer, Integer>, Integer> fuel_values = CollectionLiterals.<Pair<Integer, Integer>, Integer>newHashMap();

  public static void main(final String[] args) {
    int current_max_fuel_value = 0;
    int current_max_i = 0;
    int current_max_j = 0;
    IntegerRange _upTo = new IntegerRange(1, 298);
    for (final Integer i : _upTo) {
      IntegerRange _upTo_1 = new IntegerRange(1, 298);
      for (final Integer j : _upTo_1) {
        {
          Integer current_fuel_value = Day11.getSquareFuelValue((i).intValue(), (j).intValue());
          if (((current_fuel_value).intValue() > current_max_fuel_value)) {
            current_max_fuel_value = (current_fuel_value).intValue();
            current_max_i = (i).intValue();
            current_max_j = (j).intValue();
          }
        }
      }
    }
    String _plus = (Integer.valueOf(current_max_i) + ",");
    String _plus_1 = (_plus + Integer.valueOf(current_max_j));
    InputOutput.<String>println(_plus_1);
    int current_max_size = 3;
    IntegerRange _upTo_2 = new IntegerRange(1, 300);
    for (final Integer i_1 : _upTo_2) {
      IntegerRange _upTo_3 = new IntegerRange(1, 300);
      for (final Integer j_1 : _upTo_3) {
        {
          int current_square_value = 0;
          int _max = Math.max((i_1).intValue(), (j_1).intValue());
          int _minus = (300 - _max);
          IntegerRange _upTo_4 = new IntegerRange(0, _minus);
          for (final Integer size : _upTo_4) {
            {
              IntegerRange _upTo_5 = new IntegerRange((j_1).intValue(), ((j_1).intValue() + (size).intValue()));
              for (final Integer k : _upTo_5) {
                int _current_square_value = current_square_value;
                Integer _fuelValue = Day11.getFuelValue(((i_1).intValue() + (size).intValue()), (k).intValue());
                current_square_value = (_current_square_value + (_fuelValue).intValue());
              }
              IntegerRange _upTo_6 = new IntegerRange((i_1).intValue(), (((i_1).intValue() + (size).intValue()) - 1));
              for (final Integer k_1 : _upTo_6) {
                int _current_square_value_1 = current_square_value;
                Integer _fuelValue_1 = Day11.getFuelValue((k_1).intValue(), ((j_1).intValue() + (size).intValue()));
                current_square_value = (_current_square_value_1 + (_fuelValue_1).intValue());
              }
              if ((current_square_value > current_max_fuel_value)) {
                current_max_fuel_value = current_square_value;
                current_max_i = (i_1).intValue();
                current_max_j = (j_1).intValue();
                current_max_size = ((size).intValue() + 1);
              }
            }
          }
        }
      }
    }
    String _plus_2 = (Integer.valueOf(current_max_i) + ",");
    String _plus_3 = (_plus_2 + Integer.valueOf(current_max_j));
    String _plus_4 = (_plus_3 + ",");
    String _plus_5 = (_plus_4 + Integer.valueOf(current_max_size));
    InputOutput.<String>println(_plus_5);
  }

  public static Integer getSquareFuelValue(final int i, final int j) {
    Integer _xblockexpression = null;
    {
      final Coordinate current = new Coordinate((i + 1), (j + 1));
      final HashSet<Coordinate> neighbours = current.allAroundUnboundedNeighbours();
      final Function2<Integer, Coordinate, Integer> _function = (Integer acc, Coordinate v) -> {
        Integer _fuelValue = Day11.getFuelValue(v.getX(), v.getY());
        return Integer.valueOf(((acc).intValue() + (_fuelValue).intValue()));
      };
      _xblockexpression = IterableExtensions.<Coordinate, Integer>fold(neighbours, Day11.getFuelValue(current.getX(), current.getY()), _function);
    }
    return _xblockexpression;
  }

  public static Integer getFuelValue(final int i, final int j) {
    Integer _xifexpression = null;
    Pair<Integer, Integer> _mappedTo = Pair.<Integer, Integer>of(Integer.valueOf(i), Integer.valueOf(j));
    boolean _containsKey = Day11.fuel_values.containsKey(_mappedTo);
    if (_containsKey) {
      Pair<Integer, Integer> _mappedTo_1 = Pair.<Integer, Integer>of(Integer.valueOf(i), Integer.valueOf(j));
      _xifexpression = Day11.fuel_values.get(_mappedTo_1);
    } else {
      int _xblockexpression = (int) 0;
      {
        int rack_id = (i + 10);
        int power_level = (rack_id * j);
        int _power_level = power_level;
        power_level = (_power_level + Day11.serial_id);
        int _power_level_1 = power_level;
        power_level = (_power_level_1 * rack_id);
        final char[] digits = Integer.valueOf(power_level).toString().toCharArray();
        int _size = ((List<Character>)Conversions.doWrapArray(digits)).size();
        int _minus = (_size - 3);
        int _parseInt = Integer.parseInt(Character.valueOf((digits[_minus])).toString());
        int _minus_1 = (_parseInt - 5);
        power_level = _minus_1;
        Pair<Integer, Integer> _mappedTo_2 = Pair.<Integer, Integer>of(Integer.valueOf(i), Integer.valueOf(j));
        Day11.fuel_values.put(_mappedTo_2, Integer.valueOf(power_level));
        _xblockexpression = power_level;
      }
      _xifexpression = Integer.valueOf(_xblockexpression);
    }
    return _xifexpression;
  }
}
