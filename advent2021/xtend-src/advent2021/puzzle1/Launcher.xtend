package advent2021.puzzle1

import advent2021.Utils
import java.util.List
import java.util.ArrayList

class Launcher {
	def static void main(String[] args) {
		val input = Utils::getInputs(1, [x|Integer::parseInt(x)])
		println(greater(new ArrayList(input)))
		val newList = new ArrayList<Integer>(input.size-2)
		for (i : 0..<input.size-2) {
			newList.add(input.get(i) + input.get(i+1) + input.get(i+2))
		}
		println(greater(newList))
	}
	
	def static private greater(List<Integer> input) {
		var previous = input.remove(0)
		var result = 0
		for (n : input) {
			result += (n > previous) ? 1 : 0
			previous = n
		}
		result
	}
}
