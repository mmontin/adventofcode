package adventutils.maths

import java.math.BigInteger
import java.util.Optional

class Arithmetics {

	def static lcm(long x1, long x2) {

		var nb1 = x1
		var nb2 = x2
		var remainder = nb1 % nb2

		while (remainder != 0) {
			nb1 = nb2
			nb2 = remainder
			remainder = nb1 % nb2
		}

		x1 * x2 / nb2
	}
	
	// solves a n + b m = c
	def static diophantienne(int a, int b, int c) {
		val res = euclidean(a,b)
		val pgcd = res.key.key
		val u = res.key.value
		val v = res.value
		if (c % pgcd != 0)
			return Optional.empty
		else {
			val red = c / pgcd
			return Optional.of((u * red -> b / pgcd) -> (v * red -> -a / pgcd))
		}
	}
	
	// return d u v st a u + bv = d and d = gcd(a,b)
	def static Pair<Pair<Integer,Integer>,Integer> euclidean(int a, int b) {
		if (b == 0)
			a -> 1 -> 0
		else {
			val rec = euclidean(b, a % b)
			val d1 = rec.key.key
			val u1 = rec.key.value
			val v1 = rec.value
			d1 -> v1 -> u1 - (a / b) * v1
		}
	}
	
	def static gcd(BigInteger nb1, BigInteger nb2) {
		var a = nb1.abs.max(nb2.abs)
		var b = nb1.abs.min(nb2.abs)
		var r = BigInteger.ZERO
		
		do {
			r = a % b
			a = b
			b = r
		} while (r.signum != 0)

		a
	}

	def static gcd(int nb1, int nb2) {

		var a = Math.max(nb1,nb2)
		var b = Math.min(nb1,nb2)
		var r = 0
		
		do {
			r = a % b
			a = b
			b = r
		} while (r != 0)

		a
	}
}
