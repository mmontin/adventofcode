package adventutils

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
