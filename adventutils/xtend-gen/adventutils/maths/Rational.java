package adventutils.maths;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.MathContext;

@SuppressWarnings("all")
public class Rational implements Comparable<Rational> {
  public static final Rational ONE = new Rational(BigInteger.ONE);

  public static final Rational ZERO = new Rational(BigInteger.ZERO);

  private final BigInteger numerator;

  private final BigInteger denominator;

  public Rational(final BigInteger num) {
    this(num, BigInteger.ONE);
  }

  public Rational(final long num) {
    this(num, 1);
  }

  public Rational(final long num, final long den) {
    this(BigInteger.valueOf(num), BigInteger.valueOf(den));
  }

  public Rational(final BigInteger num, final BigInteger den) {
    int _signum = den.signum();
    boolean _equals = (_signum == 0);
    if (_equals) {
      throw new RuntimeException();
    }
    int _signum_1 = num.signum();
    boolean _equals_1 = (_signum_1 == 0);
    if (_equals_1) {
      this.numerator = BigInteger.ZERO;
      this.denominator = BigInteger.ONE;
    } else {
      final BigInteger gcd = Arithmetics.gcd(num, den);
      int _signum_2 = num.signum();
      int _signum_3 = den.signum();
      final int sig = (_signum_2 * _signum_3);
      BigInteger _divide = num.abs().divide(gcd);
      BigInteger _valueOf = BigInteger.valueOf(sig);
      BigInteger _multiply = _divide.multiply(_valueOf);
      this.numerator = _multiply;
      this.denominator = den.abs().divide(gcd);
    }
  }

  public Rational operator_multiply(final Rational other) {
    BigInteger _multiply = this.numerator.multiply(other.numerator);
    BigInteger _multiply_1 = this.denominator.multiply(other.denominator);
    return new Rational(_multiply, _multiply_1);
  }

  public Rational inverse() {
    return new Rational(this.denominator, this.numerator);
  }

  public Rational operator_divide(final Rational other) {
    return this.operator_multiply(other.inverse());
  }

  public Rational operator_minus() {
    BigInteger _negate = this.numerator.negate();
    return new Rational(_negate, this.denominator);
  }

  public Rational operator_plus(final Rational other) {
    BigInteger _multiply = this.numerator.multiply(other.denominator);
    BigInteger _multiply_1 = this.denominator.multiply(other.numerator);
    BigInteger _plus = _multiply.add(_multiply_1);
    BigInteger _multiply_2 = this.denominator.multiply(other.denominator);
    return new Rational(_plus, _multiply_2);
  }

  public Rational operator_minus(final Rational other) {
    Rational _minus = other.operator_minus();
    return this.operator_plus(_minus);
  }

  public BigDecimal approximate() {
    BigDecimal _bigDecimal = new BigDecimal(this.numerator);
    BigDecimal _bigDecimal_1 = new BigDecimal(this.denominator);
    return _bigDecimal.divide(_bigDecimal_1, MathContext.DECIMAL128);
  }

  public Integer toInteger() {
    int _xifexpression = (int) 0;
    boolean _equals = this.denominator.equals(BigInteger.ONE);
    if (_equals) {
      _xifexpression = this.numerator.intValueExact();
    } else {
      throw new ArithmeticException();
    }
    return Integer.valueOf(_xifexpression);
  }

  public BigInteger toBigInteger() {
    BigInteger _xifexpression = null;
    boolean _equals = this.denominator.equals(BigInteger.ONE);
    if (_equals) {
      _xifexpression = this.numerator;
    } else {
      throw new ArithmeticException();
    }
    return _xifexpression;
  }

  public int signum() {
    return this.numerator.signum();
  }

  public Rational abs() {
    BigInteger _abs = this.numerator.abs();
    return new Rational(_abs, this.denominator);
  }

  @Override
  public boolean equals(final Object other) {
    boolean _switchResult = false;
    boolean _matched = false;
    if (other instanceof Rational) {
      _matched=true;
      _switchResult = (this.numerator.equals(((Rational)other).numerator) && this.denominator.equals(((Rational)other).denominator));
    }
    if (!_matched) {
      _switchResult = false;
    }
    return _switchResult;
  }

  @Override
  public String toString() {
    return (((("(" + this.numerator) + " / ") + this.denominator) + ")");
  }

  @Override
  public int compareTo(final Rational o) {
    return this.operator_minus(o).signum();
  }
}
