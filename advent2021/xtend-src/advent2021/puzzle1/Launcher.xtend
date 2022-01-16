package advent2021.puzzle1

import adventutils.input.InputLoader
import java.util.ArrayList
import java.util.List

class Launcher {
	def static void main(String[] args) {
		val input = new InputLoader(2021,1).getInputs[x|Integer::parseInt(x)]
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