package adventutils.maths

import java.math.BigInteger

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
