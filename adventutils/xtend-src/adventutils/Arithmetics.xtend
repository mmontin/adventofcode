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
}
