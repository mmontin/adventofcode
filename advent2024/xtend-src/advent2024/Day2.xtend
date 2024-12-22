package advent2024

import adventutils.input.InputLoader
import java.util.ArrayList
import java.util.List

class Day2 {
	def static void main(String[] args) {

		val reports = new InputLoader(2024, 2).inputs.map[it.split(" ").map[n|Integer.parseInt(n + "")]]

		println(reports.fold(0) [ acc, el |
			if(el.isSafe) acc + 1 else acc
		])

		println(reports.fold(0) [ acc, el |
			if (el.isSafe)
				acc + 1
			else {
				val currentList = new ArrayList(el)
				var foundSafe = false
				var i = 0
				while (i != currentList.size && !foundSafe) {
					val element = currentList.remove(i)
					foundSafe = currentList.isSafe
					currentList.add(i, element)
					i ++
				}
				acc + (foundSafe ? 1 : 0)
			}
		])
	}

	def static boolean isSafe(List<Integer> report) {
		val differences = newArrayList
		val signs = newHashSet
		for (i : 0 .. report.size - 2) {
			val current_diff = report.get(i + 1) - report.get(i)
			differences.add(Math.abs(current_diff))
			signs.add(Math.signum(current_diff))
		}
		!(differences.exists[d|d > 3 || d == 0] || signs.size != 1)
	}
}
