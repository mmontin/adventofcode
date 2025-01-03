package adventutils.maths

import java.math.BigDecimal
import java.math.BigInteger

class Rational implements Comparable<Rational> {

	public static final Rational ONE = new Rational(BigInteger.ONE)
	public static final Rational ZERO = new Rational(BigInteger.ZERO)

	final BigInteger numerator
	final BigInteger denominator

	new(BigInteger num) {
		this(num, BigInteger.ONE)
	}

	new(long num) {
		this(num, 1)
	}

	new(long num, long den) {
		this(BigInteger.valueOf(num), BigInteger.valueOf(den))
	}

	new(BigInteger num, BigInteger den) {

		if (den.signum == 0)
			throw new RuntimeException

		if (num.signum == 0) {
			numerator = BigInteger.ZERO
			denominator = BigInteger.ONE
		} else {
			val gcd = Arithmetics.gcd(num, den)
			val sig = num.signum * den.signum

			numerator = num.abs.divide(gcd) * BigInteger.valueOf(sig)
			denominator = den.abs.divide(gcd)
		}
	}

	def operator_multiply(Rational other) {
		new Rational(numerator * other.numerator, denominator * other.denominator)
	}

	def Rational inverse() {
		new Rational(denominator, numerator)
	}

	def operator_divide(Rational other) {
		operator_multiply(other.inverse)
	}

	def operator_minus() {
		new Rational(numerator.negate, denominator)
	}

	def operator_plus(Rational other) {
		new Rational(numerator * other.denominator + denominator * other.numerator, denominator * other.denominator)
	}

	def operator_minus(Rational other) {
		operator_plus(- other)
	}

	def BigDecimal approximate() {
		new BigDecimal(numerator) / new BigDecimal(denominator)
	}

	def Integer toInteger() {
		if (denominator.equals(BigInteger.ONE))
			numerator.intValueExact
		else 
			throw new ArithmeticException
	}

	def BigInteger toBigInteger() {
		if (denominator.equals(BigInteger.ONE))
			numerator
		else
			throw new ArithmeticException
	}

	def signum() {
		numerator.signum
	}

	def abs() {
		new Rational(numerator.abs, denominator)
	}

	override equals(Object other) {
		switch other {
			Rational:
				numerator.equals(other.numerator) && denominator.equals(other.denominator)
			default:
				false
		}
	}

	override toString() {
		"(" + numerator + " / " + denominator + ")"
	}

	override compareTo(Rational o) {
		operator_minus(o).signum
	}
}
