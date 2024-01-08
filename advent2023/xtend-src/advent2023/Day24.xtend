package advent2023

import adventutils.Cramer
import adventutils.input.InputLoader
import adventutils.maths.Rational
import java.math.BigDecimal
import java.math.BigInteger
import java.util.Optional

class Day24 {

	static final BigDecimal min = new BigDecimal(7)//new BigDecimal("200000000000000")
	static final BigDecimal max = new BigDecimal(27)// new BigDecimal("400000000000000")

	def static void main(String[] args) {
		val lines = new InputLoader(2023, 24).inputs.map[new Hail(it)]
		var counter = 0
		for (i : 0 ..< lines.size) {
			val left = lines.get(i)
			for (j : i + 1 ..< lines.size) {
				val right = lines.get(j)
				val inter = calculateIntersectionPoint(left, right)
				if (inter.present) {
					val inside = inter.get
					val intersectionx = inside.key
					val intersectiony = inside.value
					if (intersectionx >= min && intersectionx <= max && intersectiony >= min && intersectiony <= max)
						counter++
				}
			}
		}
		println(counter)
		
		val matrix = computeMatrix(lines.get(0), lines.get(1), lines.get(2))
		val cramer = new Cramer(matrix.key, matrix.value)
		cramer.solve.forEach[println(it.approximate)]
	}

	def static calculateIntersectionPoint(Hail h0, Hail h1) {

		if (h1.v * h0.u == h0.v * h1.u)
			// Colinear, never meet
			Optional.empty
		else {
			val num = h0.v * (h1.x - h0.x) + h0.u * (h0.y - h1.y)
			val den = h1.v * h0.u - h1.u * h0.v
			val t1 = num / den
			val t0 = (t1 * h1.v - h0.y + h1.y) / h0.v
			if (t1.signum == -1 || t0.signum == -1)
				// Met in the past
				Optional.empty
			else {
				val intersectionx = h0.x + t0 * h0.u
				val intersectiony = h0.y + t0 * h0.v
				Optional.of(intersectionx.approximate -> intersectiony.approximate)
			}
		}
	}

	def static Pair<Rational[][], Rational[]> computeMatrix(Hail h0, Hail h1, Hail h2) {
		val r1 = compute1(h0, h1)
		val r2 = compute1(h1, h2)
		val r3 = compute1(h2, h0)
		val r4 = compute2(h0, h1)
		val r5 = compute2(h1, h2)
		val r6 = compute2(h2, h0)

		#[r1.key, r2.key, r3.key, r4.key, r5.key, r6.key] ->
			#[r1.value, r2.value, r3.value, r4.value, r5.value, r6.value]
	}

	def static Pair<Rational[],Rational> compute1(Hail h0, Hail h1) {
		#[
			h0.v - h1.v,
			h1.u - h0.u,
			Rational.ZERO,
			h1.y - h0.y,
			h0.x - h1.x,
			Rational.ZERO
		] -> h0.x.negate * h0.v + h1.x * h1.v + h0.y * h0.u - h1.y * h1.u
	}

	def static Pair<Rational[],Rational> compute2(Hail h0, Hail h1) {
		#[
			Rational.ZERO,
			h0.w - h1.w,
			h1.v - h0.v,
			Rational.ZERO,
			h1.z - h0.z,
			h0.y - h1.y
		] -> h0.y.negate * h0.w + h1.y * h1.w + h0.z * h0.v - h1.z * h1.v
	}

	static class Hail {

		Rational x
		Rational y
		Rational z

		Rational u
		Rational v
		Rational w

		new(String s) {
			val split = s.split(" \\@ ")
			val split1 = split.get(0).split(", ").map[new Rational(new BigInteger(it.trim))]
			val split2 = split.get(1).split(", ").map[new Rational(new BigInteger(it.trim))]

			x = split1.get(0)
			y = split1.get(1)
			z = split1.get(2)

			u = split2.get(0)
			v = split2.get(1)
			w = split2.get(2)
		}
		
		override toString() {
			x + "\n" + y + "\n" + z
		}
	}
}
