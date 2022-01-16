package advent2015.puzzle17

import adventutils.input.InputLoader
import java.util.ArrayList
import java.util.List

class Launcher {
	
	static int minNumber = 20
	static int iterations = 0

	def static void main(String[] args) {
		println(compute(new InputLoader(2015,17).getInputs.map[x|Integer::parseInt(x)].sort.reverse, 150, 0))
		println(iterations)
	}

	def static Integer compute(List<Integer> candidates, Integer value, Integer bucketsUsed) {
		if (value == 0)	{
			update(bucketsUsed) ; 1
		} else {
			val candidatesDuplicate = new ArrayList(candidates)
			candidatesDuplicate.removeIf[ x | x > value ]
			val difference = candidatesDuplicate.fold(0)[v, x|v + x] - value

			if (difference > 0) {
				val first = candidatesDuplicate.get(0)
				candidatesDuplicate.remove(0)
				compute(candidatesDuplicate, value - first, bucketsUsed + 1) + compute(candidatesDuplicate, value, bucketsUsed)
			} else if (difference == 0) {
				update(bucketsUsed + candidates.size) ; 1
			} else 0
		}
	}
	
	def static update(Integer bucketsUsed) {
		if (bucketsUsed == minNumber)
			iterations ++
		else if (bucketsUsed < minNumber) {
			minNumber = bucketsUsed
			iterations = 1
		}
	}
}
