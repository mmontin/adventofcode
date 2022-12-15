package advent2015.puzzle20

import java.util.ArrayList

class Launcher {
	
	static int INPUT = 36000000
	
	def static void main(String[] args) {
		var i = 0
		var result = 0
		while (result < INPUT)
			result = divisors(i ++).fold(0)[v , e | v + 11 * e]
		println(i-1)
	}
	
	def static divisors(int number) {
		val output = new ArrayList<Integer>
		var i = 1
		while (i < Math.sqrt(number)) {
			if (number % i == 0) {
				if (number <= 50*i) output.add(i)
				if (number <= 50*number/i) output.add(number/i)
			}
			i ++
		}	
		output
	}
}