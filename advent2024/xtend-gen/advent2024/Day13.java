package advent2024;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;
import adventutils.maths.GaussianElim;
import adventutils.maths.Rational;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
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

    public Optional<Pair<BigInteger, BigInteger>> solve(final boolean q2) {
      Optional<Pair<BigInteger, BigInteger>> _xtrycatchfinallyexpression = null;
      try {
        Optional<Pair<BigInteger, BigInteger>> _xblockexpression = null;
        {
          int _x = this.x_button.getX();
          Rational _rational = new Rational(_x);
          int _x_1 = this.y_button.getX();
          Rational _rational_1 = new Rational(_x_1);
          int _y = this.x_button.getY();
          Rational _rational_2 = new Rational(_y);
          int _y_1 = this.y_button.getY();
          Rational _rational_3 = new Rational(_y_1);
          BigInteger _valueOf = BigInteger.valueOf(this.price.getX());
          BigInteger _xifexpression = null;
          if (q2) {
            _xifexpression = BigInteger.valueOf(10000000000000L);
          } else {
            _xifexpression = BigInteger.ZERO;
          }
          BigInteger _add = _valueOf.add(_xifexpression);
          Rational _rational_4 = new Rational(_add);
          BigInteger _valueOf_1 = BigInteger.valueOf(this.price.getY());
          BigInteger _xifexpression_1 = null;
          if (q2) {
            _xifexpression_1 = BigInteger.valueOf(10000000000000L);
          } else {
            _xifexpression_1 = BigInteger.ZERO;
          }
          BigInteger _add_1 = _valueOf_1.add(_xifexpression_1);
          Rational _rational_5 = new Rational(_add_1);
          final ArrayList<Rational> res = GaussianElim.solve(
            CollectionLiterals.<ArrayList<Rational>>newArrayList(
              CollectionLiterals.<Rational>newArrayList(_rational, _rational_1), 
              CollectionLiterals.<Rational>newArrayList(_rational_2, _rational_3)), CollectionLiterals.<Rational>newArrayList(_rational_4, _rational_5));
          BigInteger _bigInteger = res.get(0).toBigInteger();
          BigInteger _bigInteger_1 = res.get(1).toBigInteger();
          Pair<BigInteger, BigInteger> _mappedTo = Pair.<BigInteger, BigInteger>of(_bigInteger, _bigInteger_1);
          _xblockexpression = Optional.<Pair<BigInteger, BigInteger>>of(_mappedTo);
        }
        _xtrycatchfinallyexpression = _xblockexpression;
      } catch (final Throwable _t) {
        if (_t instanceof ArithmeticException) {
          _xtrycatchfinallyexpression = Optional.<Pair<BigInteger, BigInteger>>empty();
        } else {
          throw Exceptions.sneakyThrow(_t);
        }
      }
      return _xtrycatchfinallyexpression;
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
    Pair<BigInteger, BigInteger> _mappedTo = Pair.<BigInteger, BigInteger>of(BigInteger.ZERO, BigInteger.ZERO);
    final Function2<Pair<BigInteger, BigInteger>, Day13.Machine, Pair<BigInteger, BigInteger>> _function = (Pair<BigInteger, BigInteger> acc, Day13.Machine el) -> {
      Pair<BigInteger, BigInteger> _xblockexpression = null;
      {
        final Optional<Pair<BigInteger, BigInteger>> solve1 = el.solve(false);
        final Optional<Pair<BigInteger, BigInteger>> solve2 = el.solve(true);
        BigInteger _xifexpression = null;
        boolean _isEmpty = solve1.isEmpty();
        if (_isEmpty) {
          _xifexpression = BigInteger.ZERO;
        } else {
          BigInteger _xblockexpression_1 = null;
          {
            final Pair<BigInteger, BigInteger> res = solve1.get();
            _xblockexpression_1 = res.getKey().multiply(BigInteger.valueOf(3)).add(res.getValue());
          }
          _xifexpression = _xblockexpression_1;
        }
        final BigInteger newKey = acc.getKey().add(_xifexpression);
        BigInteger _xifexpression_1 = null;
        boolean _isEmpty_1 = solve2.isEmpty();
        if (_isEmpty_1) {
          _xifexpression_1 = BigInteger.ZERO;
        } else {
          BigInteger _xblockexpression_2 = null;
          {
            final Pair<BigInteger, BigInteger> res = solve2.get();
            _xblockexpression_2 = res.getKey().multiply(BigInteger.valueOf(3)).add(res.getValue());
          }
          _xifexpression_1 = _xblockexpression_2;
        }
        final BigInteger newValue = acc.getValue().add(_xifexpression_1);
        _xblockexpression = Pair.<BigInteger, BigInteger>of(newKey, newValue);
      }
      return _xblockexpression;
    };
    InputOutput.<Pair<BigInteger, BigInteger>>println(IterableExtensions.<Day13.Machine, Pair<BigInteger, BigInteger>>fold(machines, _mappedTo, _function));
  }
}
