package advent2021.puzzle6

import advent2021.Utils
import java.math.BigInteger
import java.util.HashMap

class Launcher {

	def static void main(String[] args) {
		
		var input = Utils.getInputs(6).get(0).split(',').fold(new HashMap)[fishes , v |
			fishes.merge(Integer::parseInt(v), BigInteger.valueOf(1))[v1, v2|v1 + v2] fishes]

		for (k : 0 ..< 256)	
			input = input.entrySet.fold(new HashMap)[ output , e |
				(e.key == 0) ? {
					output.put(6, e.value)
					output.put(8, e.value)
				} : output.merge(e.key - 1, e.value)[v1, v2|v1 + v2] 
				output ]
				
		println(input.values.fold(BigInteger.valueOf(0))[x, y|x + y])
	}
}
