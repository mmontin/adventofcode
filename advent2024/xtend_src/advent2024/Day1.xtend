package advent2024

import adventutils.input.InputLoader
import java.util.Collections

class Day1 {
	def static void main(String[] args) {
		val lines = new InputLoader(2024, 1).inputs
		val lefts = newArrayList
		val rights = newArrayList
		lines.forEach [
			val splitted = it.split("   ")
			lefts.add(Integer.parseInt(splitted.get(0)))
			rights.add(Integer.parseInt(splitted.get(1)))
		]
		val lefts_sorted = lefts.sort.toList
		val rights_sorted = rights.sort.toList
		var ans = 0
		for (i : 0 .. lines.size - 1)
			ans += Math.abs(lefts_sorted.get(i) - rights_sorted.get(i))
		println(ans)

		println(lefts_sorted.fold(0) [acc,el|
			acc + el * Collections.frequency(rights_sorted,el)
		])
	}
}
