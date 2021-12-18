package advent2016.puzzle19

import java.util.List

class Launcher {

	static final int nb_of_elves = 3004953

	def static void main(String[] args) {

//		for (nb : 1..100) {
//			var elvess = (1 .. nb).fold(newArrayList)[l, i|l.add(i); l]
//			
//			var i = 0
//			while (elvess.size != 1) {
//				if (i < elvess.size - 1) {
//					elvess.remove(i + 1)
//					i = i == elvess.size-1 ? 0 : i + 1
//				} else {
//					elvess.remove(0)
//					i = 0
//				}
//			}
//			
//			println(nb + ',' + elvess.get(0) + ' | ' + nb.formula)
//		}

		println(formula(nb_of_elves))
	}
	
	def static int log2(int n) {
		return 31 - Integer.numberOfLeadingZeros(n)
	}
	
	def static int pow2(int n) {
		n == 0 ? 1 : 2 << n-1
	}
	
	def static int formula(int input) {
		2 * (input - pow2(log2(input))) + 1
	}
}
