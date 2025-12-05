package advent2025

import adventutils.geometry.Interval
import adventutils.geometry.Intervals
import adventutils.input.InputLoader

class Day5 {
	def static void main(String[] args) {
		val input = new InputLoader(2025, 5).inputs
		val middle = input.indexOf("")
		val ranges = input.subList(0, middle).map[new Interval(it)]
		val ingredients = input.subList(middle + 1, input.size).map[Long.parseLong(it)]
		println("Part1: " + ingredients.filter[ingr | ranges.exists[it.contains(ingr)]].size)
		println("Part2: " + new Intervals(ranges).nbOfElements)
	}
}
