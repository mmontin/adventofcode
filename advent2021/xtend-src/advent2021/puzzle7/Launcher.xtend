package advent2021.puzzle7

import advent2021.Utils

class Launcher {
	
	def static void main(String[] args) {
		
		var input = Utils.getInputs(7).get(0).split(",").map[x | Integer::parseInt(x)].sort

		var min1 = Integer::MAX_VALUE
		var min2 = Integer::MAX_VALUE
		
		for (k : input.get(0)..input.get(input.size-1)) {
			min1 = Math.min(min1, input.fold(0)[v , e | v + Math.abs(e - k)])
			min2 = Math.min(min2, input.fold(0)[v , e | var n = Math.abs(e - k) v + ((n * (n + 1)) / 2)])
		}
		
		println(min1 + ',' + min2)
	}
}