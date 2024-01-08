package advent2023;

import adventutils.Cramer;
import adventutils.input.InputLoader;
import adventutils.maths.Rational;
import com.google.common.base.Objects;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
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

  private static final BigDecimal min = new BigDecimal(7);

  private static final BigDecimal max = new BigDecimal(27);

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
    final Pair<Rational[][], Rational[]> matrix = Day24.computeMatrix(lines.get(0), lines.get(1), lines.get(2));
    Rational[][] _key = matrix.getKey();
    Rational[] _value = matrix.getValue();
    final Cramer cramer = new Cramer(_key, _value);
    final Consumer<Rational> _function_1 = (Rational it) -> {
      InputOutput.<BigDecimal>println(it.approximate());
    };
    ((List<Rational>)Conversions.doWrapArray(cramer.solve())).forEach(_function_1);
  }

  public static Optional<Pair<BigDecimal, BigDecimal>> calculateIntersectionPoint(final Day24.Hail h0, final Day24.Hail h1) {
    Optional<Pair<BigDecimal, BigDecimal>> _xifexpression = null;
    Rational _multiply = h1.v.operator_multiply(h0.u);
    Rational _multiply_1 = h0.v.operator_multiply(h1.u);
    boolean _equals = Objects.equal(_multiply, _multiply_1);
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

  public static Pair<Rational[][], Rational[]> computeMatrix(final Day24.Hail h0, final Day24.Hail h1, final Day24.Hail h2) {
    Pair<Rational[][], Rational[]> _xblockexpression = null;
    {
      final Pair<Rational[], Rational> r1 = Day24.compute1(h0, h1);
      final Pair<Rational[], Rational> r2 = Day24.compute1(h1, h2);
      final Pair<Rational[], Rational> r3 = Day24.compute1(h2, h0);
      final Pair<Rational[], Rational> r4 = Day24.compute2(h0, h1);
      final Pair<Rational[], Rational> r5 = Day24.compute2(h1, h2);
      final Pair<Rational[], Rational> r6 = Day24.compute2(h2, h0);
      Rational[] _key = r1.getKey();
      Rational[] _key_1 = r2.getKey();
      Rational[] _key_2 = r3.getKey();
      Rational[] _key_3 = r4.getKey();
      Rational[] _key_4 = r5.getKey();
      Rational[] _key_5 = r6.getKey();
      Rational _value = r1.getValue();
      Rational _value_1 = r2.getValue();
      Rational _value_2 = r3.getValue();
      Rational _value_3 = r4.getValue();
      Rational _value_4 = r5.getValue();
      Rational _value_5 = r6.getValue();
      _xblockexpression = Pair.<Rational[][], Rational[]>of(((Rational[][])Conversions.unwrapArray(Collections.<Rational[]>unmodifiableList(CollectionLiterals.<Rational[]>newArrayList(_key, _key_1, _key_2, _key_3, _key_4, _key_5)), Rational[].class)), 
        ((Rational[])Conversions.unwrapArray(Collections.<Rational>unmodifiableList(CollectionLiterals.<Rational>newArrayList(_value, _value_1, _value_2, _value_3, _value_4, _value_5)), Rational.class)));
    }
    return _xblockexpression;
  }

  public static Pair<Rational[], Rational> compute1(final Day24.Hail h0, final Day24.Hail h1) {
    Rational _minus = h0.v.operator_minus(h1.v);
    Rational _minus_1 = h1.u.operator_minus(h0.u);
    Rational _minus_2 = h1.y.operator_minus(h0.y);
    Rational _minus_3 = h0.x.operator_minus(h1.x);
    Rational _negate = h0.x.negate();
    Rational _multiply = _negate.operator_multiply(h0.v);
    Rational _multiply_1 = h1.x.operator_multiply(h1.v);
    Rational _plus = _multiply.operator_plus(_multiply_1);
    Rational _multiply_2 = h0.y.operator_multiply(h0.u);
    Rational _plus_1 = _plus.operator_plus(_multiply_2);
    Rational _multiply_3 = h1.y.operator_multiply(h1.u);
    Rational _minus_4 = _plus_1.operator_minus(_multiply_3);
    return Pair.<Rational[], Rational>of(((Rational[])Conversions.unwrapArray(Collections.<Rational>unmodifiableList(CollectionLiterals.<Rational>newArrayList(_minus, _minus_1, Rational.ZERO, _minus_2, _minus_3, Rational.ZERO)), Rational.class)), _minus_4);
  }

  public static Pair<Rational[], Rational> compute2(final Day24.Hail h0, final Day24.Hail h1) {
    Rational _minus = h0.w.operator_minus(h1.w);
    Rational _minus_1 = h1.v.operator_minus(h0.v);
    Rational _minus_2 = h1.z.operator_minus(h0.z);
    Rational _minus_3 = h0.y.operator_minus(h1.y);
    Rational _negate = h0.y.negate();
    Rational _multiply = _negate.operator_multiply(h0.w);
    Rational _multiply_1 = h1.y.operator_multiply(h1.w);
    Rational _plus = _multiply.operator_plus(_multiply_1);
    Rational _multiply_2 = h0.z.operator_multiply(h0.v);
    Rational _plus_1 = _plus.operator_plus(_multiply_2);
    Rational _multiply_3 = h1.z.operator_multiply(h1.v);
    Rational _minus_4 = _plus_1.operator_minus(_multiply_3);
    return Pair.<Rational[], Rational>of(((Rational[])Conversions.unwrapArray(Collections.<Rational>unmodifiableList(CollectionLiterals.<Rational>newArrayList(Rational.ZERO, _minus, _minus_1, Rational.ZERO, _minus_2, _minus_3)), Rational.class)), _minus_4);
  }
}
