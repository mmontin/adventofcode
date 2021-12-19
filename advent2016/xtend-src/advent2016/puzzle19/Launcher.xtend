package advent2016.puzzle19

class Launcher {

	static final int nb_of_elves = 3004953

	def static void main(String[] args) {

		println(formula1(nb_of_elves))
		println(formula2(nb_of_elves))
	}

	def static int log2(int n) {
		return 31 - Integer.numberOfLeadingZeros(n)
	}
	
	def static int log3(int n) {
		(Math.log(n)/Math.log(3)) as int
	}

	def static int pow2(int n) {
		n == 0 ? 1 : 2 << n - 1
	}
	
	def static int pow3(int n) {
		Math.pow(3,n) as int
	}

	def static int formula1(int input) {
		2 * (input - pow2(log2(input))) + 1
	}
	
	def static int formula2(int N) {
		var pow = pow3(log3(N))
		N <= 2 * pow ? N - pow : 2 * N - (3 * pow)
	}
}
