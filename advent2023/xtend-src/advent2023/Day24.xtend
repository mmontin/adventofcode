package advent2023

import adventutils.input.InputLoader
import adventutils.maths.Rational
import java.math.BigDecimal
import java.math.BigInteger
import java.util.Optional
import adventutils.maths.GaussianElim

class Day24 {

	static final BigDecimal min = new BigDecimal("200000000000000")
	static final BigDecimal max = new BigDecimal("400000000000000")

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
		
		val matrix = computeMatrix(lines.get(0), lines.get(1), lines.get(2), lines.get(3))
		println(GaussianElim.solve(matrix.key, matrix.value).subList(0,3).reduce[x,y|x+y].approximate.toBigInteger)
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

	def static computeMatrix(Hail h0, Hail h1, Hail h2, Hail h3) {
		val r1 = compute1(h0, h1)
		val r2 = compute1(h1, h2)
		val r3 = compute1(h2, h3)
		val r4 = compute2(h0, h1)
		val r5 = compute2(h1, h2)
		val r6 = compute2(h2, h3)

		newArrayList(r1.key, r2.key, r3.key, r4.key, r5.key, r6.key) ->
			newArrayList(r1.value, r2.value, r3.value, r4.value, r5.value, r6.value)
	}

	def static compute1(Hail h1, Hail h2) {
		newArrayList(
			h1.v - h2.v,
			h2.u - h1.u,
			Rational.ZERO,
			h2.y - h1.y,
			h1.x - h2.x,
			Rational.ZERO
		) -> h1.x * h1.v - h2.x * h2.v +  h2.y * h2.u - h1.y * h1.u
	}

	def static compute2(Hail h1, Hail h2) {
		newArrayList(
			h1.w - h2.w,
			Rational.ZERO,
			h2.u - h1.u,
			h2.z - h1.z,
			Rational.ZERO,
			h1.x - h2.x
		) -> h1.x * h1.w - h2.x * h2.w + h2.z * h2.u - h1.z * h1.u 
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
