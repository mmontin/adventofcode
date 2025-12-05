package advent2025

import adventutils.input.InputLoader

class Day5 {
	def static void main(String[] args) {
		val input = new InputLoader(2025, 5).inputs
		val middle = input.indexOf("")
		val ranges = input.subList(0, middle)
		val ingredients = input.subList(middle + 1, input.size)
		println(ranges.size)
		println(ingredients.size)
	}
}
