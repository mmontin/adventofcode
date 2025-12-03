package advent2025

import adventutils.input.InputLoader
import java.util.List

class Day3 {

	static List<List<Integer>> input = new InputLoader(2025, 3).inputs.map [
		toCharArray.map[Integer.parseInt(it + "")].toList
	]

	def static void main(String[] args) {
		println("Part1: " + input.map[processLine(2)].reduce[x, y|x + y])
		println("Part2: " + input.map[processLine(12)].reduce[x, y|x + y])
	}

	def static long processLine(List<Integer> il, int seed) {
		var left = -1
		var ans = 0L
		for (i : 0 .. seed - 1) {
			val sub = il.subList(left + 1, il.size - seed + i + 1)
			left = left + 1 + sub.indexOf(sub.max)
			ans += il.get(left) * Math.pow(10, seed - i - 1) as long
		}
		ans
	}
}
