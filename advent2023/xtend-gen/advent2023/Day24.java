package advent2023;

import adventutils.input.InputLoader;
import adventutils.maths.GaussianElim;
import adventutils.maths.Rational;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day24 {
  public static class Hail {
    private Rational x;

    private Rational y;

    private Rational z;

    private Rational u;

    private Rational v;

    private Rational w;

    public Hail(final String s) {
      final String[] split = s.split(" \\@ ");
      final Function1<String, Rational> _function = (String it) -> {
        String _trim = it.trim();
        BigInteger _bigInteger = new BigInteger(_trim);
        return new Rational(_bigInteger);
      };
      final List<Rational> split1 = ListExtensions.<String, Rational>map(((List<String>)Conversions.doWrapArray((split[0]).split(", "))), _function);
      final Function1<String, Rational> _function_1 = (String it) -> {
        String _trim = it.trim();
        BigInteger _bigInteger = new BigInteger(_trim);
        return new Rational(_bigInteger);
      };
      final List<Rational> split2 = ListExtensions.<String, Rational>map(((List<String>)Conversions.doWrapArray((split[1]).split(", "))), _function_1);
      this.x = split1.get(0);
      this.y = split1.get(1);
      this.z = split1.get(2);
      this.u = split2.get(0);
      this.v = split2.get(1);
      this.w = split2.get(2);
    }

    @Override
    public String toString() {
      String _plus = (this.x + "\n");
      String _plus_1 = (_plus + this.y);
      String _plus_2 = (_plus_1 + "\n");
      return (_plus_2 + this.z);
    }
  }

  private static final BigDecimal min = new BigDecimal("200000000000000");

  private static final BigDecimal max = new BigDecimal("400000000000000");

  public static void main(final String[] args) {
    final Function1<String, Day24.Hail> _function = (String it) -> {
      return new Day24.Hail(it);
    };
    final List<Day24.Hail> lines = ListExtensions.<String, Day24.Hail>map(new InputLoader(Integer.valueOf(2023), Integer.valueOf(24)).getInputs(), _function);
    int counter = 0;
    int _size = lines.size();
    ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, _size, true);
    for (final Integer i : _doubleDotLessThan) {
      {
        final Day24.Hail left = lines.get((i).intValue());
        int _size_1 = lines.size();
        ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(((i).intValue() + 1), _size_1, true);
        for (final Integer j : _doubleDotLessThan_1) {
          {
            final Day24.Hail right = lines.get((j).intValue());
            final Optional<Pair<BigDecimal, BigDecimal>> inter = Day24.calculateIntersectionPoint(left, right);
            boolean _isPresent = inter.isPresent();
            if (_isPresent) {
              final Pair<BigDecimal, BigDecimal> inside = inter.get();
              final BigDecimal intersectionx = inside.getKey();
              final BigDecimal intersectiony = inside.getValue();
              if (((((intersectionx.compareTo(Day24.min) >= 0) && (intersectionx.compareTo(Day24.max) <= 0)) && (intersectiony.compareTo(Day24.min) >= 0)) && (intersectiony.compareTo(Day24.max) <= 0))) {
                counter++;
              }
            }
          }
        }
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(counter));
    final Pair<ArrayList<ArrayList<Rational>>, ArrayList<Rational>> matrix = Day24.computeMatrix(lines.get(0), lines.get(1), lines.get(2), lines.get(3));
    final Function2<Rational, Rational, Rational> _function_1 = (Rational x, Rational y) -> {
      return x.operator_plus(y);
    };
    InputOutput.<BigInteger>println(IterableExtensions.<Rational>reduce(GaussianElim.solve(matrix.getKey(), matrix.getValue()).subList(0, 3), _function_1).approximate().toBigInteger());
  }

  public static Optional<Pair<BigDecimal, BigDecimal>> calculateIntersectionPoint(final Day24.Hail h0, final Day24.Hail h1) {
    Optional<Pair<BigDecimal, BigDecimal>> _xifexpression = null;
    Rational _multiply = h1.v.operator_multiply(h0.u);
    Rational _multiply_1 = h0.v.operator_multiply(h1.u);
    boolean _equals = Objects.equals(_multiply, _multiply_1);
    if (_equals) {
      _xifexpression = Optional.<Pair<BigDecimal, BigDecimal>>empty();
    } else {
      Optional<Pair<BigDecimal, BigDecimal>> _xblockexpression = null;
      {
        Rational _minus = h1.x.operator_minus(h0.x);
        Rational _multiply_2 = h0.v.operator_multiply(_minus);
        Rational _minus_1 = h0.y.operator_minus(h1.y);
        Rational _multiply_3 = h0.u.operator_multiply(_minus_1);
        final Rational num = _multiply_2.operator_plus(_multiply_3);
        Rational _multiply_4 = h1.v.operator_multiply(h0.u);
        Rational _multiply_5 = h1.u.operator_multiply(h0.v);
        final Rational den = _multiply_4.operator_minus(_multiply_5);
        final Rational t1 = num.operator_divide(den);
        Rational _multiply_6 = t1.operator_multiply(h1.v);
        Rational _minus_2 = _multiply_6.operator_minus(h0.y);
        Rational _plus = _minus_2.operator_plus(h1.y);
        final Rational t0 = _plus.operator_divide(h0.v);
        Optional<Pair<BigDecimal, BigDecimal>> _xifexpression_1 = null;
        if (((t1.signum() == (-1)) || (t0.signum() == (-1)))) {
          _xifexpression_1 = Optional.<Pair<BigDecimal, BigDecimal>>empty();
        } else {
          Optional<Pair<BigDecimal, BigDecimal>> _xblockexpression_1 = null;
          {
            Rational _multiply_7 = t0.operator_multiply(h0.u);
            final Rational intersectionx = h0.x.operator_plus(_multiply_7);
            Rational _multiply_8 = t0.operator_multiply(h0.v);
            final Rational intersectiony = h0.y.operator_plus(_multiply_8);
            BigDecimal _approximate = intersectionx.approximate();
            BigDecimal _approximate_1 = intersectiony.approximate();
            Pair<BigDecimal, BigDecimal> _mappedTo = Pair.<BigDecimal, BigDecimal>of(_approximate, _approximate_1);
            _xblockexpression_1 = Optional.<Pair<BigDecimal, BigDecimal>>of(_mappedTo);
          }
          _xifexpression_1 = _xblockexpression_1;
        }
        _xblockexpression = _xifexpression_1;
      }
      _xifexpression = _xblockexpression;
    }
    return _xifexpression;
  }

  public static Pair<ArrayList<ArrayList<Rational>>, ArrayList<Rational>> computeMatrix(final Day24.Hail h0, final Day24.Hail h1, final Day24.Hail h2, final Day24.Hail h3) {
    Pair<ArrayList<ArrayList<Rational>>, ArrayList<Rational>> _xblockexpression = null;
    {
      final Pair<ArrayList<Rational>, Rational> r1 = Day24.compute1(h0, h1);
      final Pair<ArrayList<Rational>, Rational> r2 = Day24.compute1(h1, h2);
      final Pair<ArrayList<Rational>, Rational> r3 = Day24.compute1(h2, h3);
      final Pair<ArrayList<Rational>, Rational> r4 = Day24.compute2(h0, h1);
      final Pair<ArrayList<Rational>, Rational> r5 = Day24.compute2(h1, h2);
      final Pair<ArrayList<Rational>, Rational> r6 = Day24.compute2(h2, h3);
      ArrayList<ArrayList<Rational>> _newArrayList = CollectionLiterals.<ArrayList<Rational>>newArrayList(r1.getKey(), r2.getKey(), r3.getKey(), r4.getKey(), r5.getKey(), r6.getKey());
      ArrayList<Rational> _newArrayList_1 = CollectionLiterals.<Rational>newArrayList(r1.getValue(), r2.getValue(), r3.getValue(), r4.getValue(), r5.getValue(), r6.getValue());
      _xblockexpression = Pair.<ArrayList<ArrayList<Rational>>, ArrayList<Rational>>of(_newArrayList, _newArrayList_1);
    }
    return _xblockexpression;
  }

  public static Pair<ArrayList<Rational>, Rational> compute1(final Day24.Hail h1, final Day24.Hail h2) {
    Rational _minus = h1.v.operator_minus(h2.v);
    Rational _minus_1 = h2.u.operator_minus(h1.u);
    Rational _minus_2 = h2.y.operator_minus(h1.y);
    Rational _minus_3 = h1.x.operator_minus(h2.x);
    ArrayList<Rational> _newArrayList = CollectionLiterals.<Rational>newArrayList(_minus, _minus_1, 
      Rational.ZERO, _minus_2, _minus_3, 
      Rational.ZERO);
    Rational _multiply = h1.x.operator_multiply(h1.v);
    Rational _multiply_1 = h2.x.operator_multiply(h2.v);
    Rational _minus_4 = _multiply.operator_minus(_multiply_1);
    Rational _multiply_2 = h2.y.operator_multiply(h2.u);
    Rational _plus = _minus_4.operator_plus(_multiply_2);
    Rational _multiply_3 = h1.y.operator_multiply(h1.u);
    Rational _minus_5 = _plus.operator_minus(_multiply_3);
    return Pair.<ArrayList<Rational>, Rational>of(_newArrayList, _minus_5);
  }

  public static Pair<ArrayList<Rational>, Rational> compute2(final Day24.Hail h1, final Day24.Hail h2) {
    Rational _minus = h1.w.operator_minus(h2.w);
    Rational _minus_1 = h2.u.operator_minus(h1.u);
    Rational _minus_2 = h2.z.operator_minus(h1.z);
    Rational _minus_3 = h1.x.operator_minus(h2.x);
    ArrayList<Rational> _newArrayList = CollectionLiterals.<Rational>newArrayList(_minus, 
      Rational.ZERO, _minus_1, _minus_2, 
      Rational.ZERO, _minus_3);
    Rational _multiply = h1.x.operator_multiply(h1.w);
    Rational _multiply_1 = h2.x.operator_multiply(h2.w);
    Rational _minus_4 = _multiply.operator_minus(_multiply_1);
    Rational _multiply_2 = h2.z.operator_multiply(h2.u);
    Rational _plus = _minus_4.operator_plus(_multiply_2);
    Rational _multiply_3 = h1.z.operator_multiply(h1.u);
    Rational _minus_5 = _plus.operator_minus(_multiply_3);
    return Pair.<ArrayList<Rational>, Rational>of(_newArrayList, _minus_5);
  }
}
