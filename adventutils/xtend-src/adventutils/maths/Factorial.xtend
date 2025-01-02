package adventutils.maths

class Factorial {

	def static long fact(long i) {
		if (i == 0)
			1
		else
			i * fact(i - 1)
	}
	
	def static long binomial(long p, long n) {
		p > n ? 0L : n.fact / ((n - p).fact * p.fact)
	}
}
