package advent2024;

import adventutils.geometry.Coordinate;
import adventutils.geometry.Interval;
import adventutils.input.InputLoader;
import adventutils.maths.Arithmetics;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day13 {
  public static class Machine {
    private Coordinate x_button;

    private Coordinate y_button;

    private Coordinate price;

    public Machine(final List<String> input) {
      final Function1<String, Integer> _function = (String it) -> {
        return Integer.valueOf(Integer.parseInt(it));
      };
      final List<Integer> split1 = ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray(input.get(0).split("(Button A: X\\+)|(, Y\\+)"))), _function);
      Integer _get = split1.get(1);
      Integer _get_1 = split1.get(2);
      Coordinate _coordinate = new Coordinate((_get).intValue(), (_get_1).intValue());
      this.x_button = _coordinate;
      final Function1<String, Integer> _function_1 = (String it) -> {
        return Integer.valueOf(Integer.parseInt(it));
      };
      final List<Integer> split2 = ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray(input.get(1).split("(Button B: X\\+)|(, Y\\+)"))), _function_1);
      Integer _get_2 = split2.get(1);
      Integer _get_3 = split2.get(2);
      Coordinate _coordinate_1 = new Coordinate((_get_2).intValue(), (_get_3).intValue());
      this.y_button = _coordinate_1;
      final Function1<String, Integer> _function_2 = (String it) -> {
        return Integer.valueOf(Integer.parseInt(it));
      };
      final List<Integer> split3 = ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray(input.get(2).split("(Prize: X=)|(, Y=)"))), _function_2);
      Integer _get_4 = split3.get(1);
      Integer _get_5 = split3.get(2);
      Coordinate _coordinate_2 = new Coordinate((_get_4).intValue(), (_get_5).intValue());
      this.price = _coordinate_2;
    }

    public Optional<Pair<Integer, Integer>> solve() {
      Optional<Pair<Integer, Integer>> _xblockexpression = null;
      {
        final Optional<Pair<Pair<Integer, Integer>, Pair<Integer, Integer>>> res1 = Arithmetics.diophantienne(this.x_button.getX(), this.y_button.getX(), this.price.getX());
        Optional<Pair<Integer, Integer>> _xifexpression = null;
        boolean _isEmpty = res1.isEmpty();
        if (_isEmpty) {
          _xifexpression = Optional.<Pair<Integer, Integer>>empty();
        } else {
          Optional<Pair<Integer, Integer>> _xblockexpression_1 = null;
          {
            final Pair<Pair<Integer, Integer>, Pair<Integer, Integer>> resultX = res1.get();
            final Integer coord_1_X_a = resultX.getKey().getValue();
            final Integer coord_1_X_b = resultX.getKey().getKey();
            final Interval coord_1_X_itv = new Interval(((-(coord_1_X_b).intValue()) / (coord_1_X_a).intValue()), ((100 - (coord_1_X_b).intValue()) / (coord_1_X_a).intValue())).swapIfNeeded();
            final Integer coord_2_X_a = resultX.getValue().getValue();
            final Integer coord_2_X_b = resultX.getValue().getKey();
            final Interval coord_2_X_itv = new Interval(((-(coord_2_X_b).intValue()) / (coord_2_X_a).intValue()), ((100 - (coord_2_X_b).intValue()) / (coord_2_X_a).intValue())).swapIfNeeded();
            final Interval coord_X_itv = coord_1_X_itv.intersection(coord_2_X_itv);
            HashSet<Pair<Integer, Integer>> _xifexpression_1 = null;
            boolean _isEmpty_1 = coord_X_itv.isEmpty();
            if (_isEmpty_1) {
              _xifexpression_1 = CollectionLiterals.<Pair<Integer, Integer>>newHashSet();
            } else {
              final Function2<HashSet<Pair<Integer, Integer>>, Integer, HashSet<Pair<Integer, Integer>>> _function = (HashSet<Pair<Integer, Integer>> acc, Integer el) -> {
                HashSet<Pair<Integer, Integer>> _xblockexpression_2 = null;
                {
                  Pair<Integer, Integer> _mappedTo = Pair.<Integer, Integer>of(Integer.valueOf((((coord_1_X_a).intValue() * (el).intValue()) + (coord_1_X_b).intValue())), Integer.valueOf((((coord_2_X_a).intValue() * (el).intValue()) + (coord_2_X_b).intValue())));
                  acc.add(_mappedTo);
                  _xblockexpression_2 = acc;
                }
                return _xblockexpression_2;
              };
              _xifexpression_1 = IterableExtensions.<Integer, HashSet<Pair<Integer, Integer>>>fold(new IntegerRange(((int) coord_X_itv.leftBound), ((int) coord_X_itv.rightBound)), CollectionLiterals.<Pair<Integer, Integer>>newHashSet(), _function);
            }
            final HashSet<Pair<Integer, Integer>> possible_pairs = _xifexpression_1;
            final Function1<Pair<Integer, Integer>, Boolean> _function_1 = (Pair<Integer, Integer> it) -> {
              int _y = this.x_button.getY();
              Integer _key = it.getKey();
              int _multiply = (_y * (_key).intValue());
              int _y_1 = this.y_button.getY();
              Integer _value = it.getValue();
              int _multiply_1 = (_y_1 * (_value).intValue());
              int _plus = (_multiply + _multiply_1);
              int _y_2 = this.price.getY();
              return Boolean.valueOf((_plus == _y_2));
            };
            _xblockexpression_1 = Optional.<Pair<Integer, Integer>>ofNullable(
              IterableExtensions.<Pair<Integer, Integer>>findFirst(possible_pairs, _function_1));
          }
          _xifexpression = _xblockexpression_1;
        }
        _xblockexpression = _xifexpression;
      }
      return _xblockexpression;
    }
  }

  public static void main(final String[] args) {
    final List<String> input = new InputLoader(Integer.valueOf(2024), Integer.valueOf(13)).getInputs();
    final ArrayList<Day13.Machine> machines = CollectionLiterals.<Day13.Machine>newArrayList();
    {
      int i = 0;
      int _size = input.size();
      boolean _lessThan = (i < _size);
      boolean _while = _lessThan;
      while (_while) {
        List<String> _subList = input.subList(i, (i + 3));
        Day13.Machine _machine = new Day13.Machine(_subList);
        machines.add(_machine);
        int _i = i;
        i = (_i + 4);
        int _size_1 = input.size();
        boolean _lessThan_1 = (i < _size_1);
        _while = _lessThan_1;
      }
    }
    final Function1<Day13.Machine, Optional<Pair<Integer, Integer>>> _function = (Day13.Machine it) -> {
      return it.solve();
    };
    final Function2<Integer, Optional<Pair<Integer, Integer>>, Integer> _function_1 = (Integer acc, Optional<Pair<Integer, Integer>> el) -> {
      int _xifexpression = (int) 0;
      boolean _isEmpty = el.isEmpty();
      if (_isEmpty) {
        _xifexpression = 0;
      } else {
        int _xblockexpression = (int) 0;
        {
          final Pair<Integer, Integer> res = el.get();
          Integer _key = res.getKey();
          int _multiply = ((_key).intValue() * 3);
          Integer _value = res.getValue();
          _xblockexpression = (_multiply + (_value).intValue());
        }
        _xifexpression = _xblockexpression;
      }
      return Integer.valueOf(((acc).intValue() + _xifexpression));
    };
    InputOutput.<Integer>println(IterableExtensions.<Optional<Pair<Integer, Integer>>, Integer>fold(ListExtensions.<Day13.Machine, Optional<Pair<Integer, Integer>>>map(machines, _function), Integer.valueOf(0), _function_1));
  }
}
