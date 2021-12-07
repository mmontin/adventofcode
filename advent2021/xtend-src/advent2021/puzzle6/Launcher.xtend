package advent2021.puzzle6

import advent2021.Utils
import java.math.BigInteger
import java.util.HashMap
import java.util.Map

class Launcher {

	def static void main(String[] args) {
		val Map<Integer, BigInteger> fishes = new HashMap()
		Utils.getInputs(6).get(0).split(',').forEach [ v |
			fishes.merge(Integer::parseInt(v), BigInteger.valueOf(1))[v1, v2|v1 + v2]
		]
		var input = fishes
		for (k : 0 ..< 256)
			input = step(input)
		println(input.values.fold(BigInteger.valueOf(0))[x, y|x + y])
	}

	def static step(Map<Integer,BigInteger> input) {
		val Map<Integer,BigInteger> output = new HashMap()
		input.entrySet.forEach [ e |
			if (e.key == 0) {
				output.merge(Integer.valueOf(6), e.value)[v1, v2|v1 + v2]
				output.merge(Integer.valueOf(8), e.value)[v1, v2|v1 + v2]
			} else
				output.merge(e.key - Integer.valueOf(1), e.value)[v1, v2|v1 + v2]
		]
		output
	}
}
