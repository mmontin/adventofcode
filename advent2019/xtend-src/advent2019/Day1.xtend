package advent2019

import adventutils.input.InputLoader

class Day1 {
	def static void main(String[] args) {
		println(new InputLoader(2019, 1).inputs.fold(0->0) [acc,el|
			val firstFuel = Integer.parseInt(el) / 3 - 2
			var allFuel = 0
			var currentFuel = firstFuel
			while (currentFuel > 0) {
				allFuel += currentFuel
				currentFuel = currentFuel / 3 - 2
			}
			acc.key + firstFuel -> acc.value + allFuel 
		])
	}
}
