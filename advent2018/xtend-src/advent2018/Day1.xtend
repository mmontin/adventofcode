package advent2018

import adventutils.input.InputLoader

class Day1 {
	def static void main(String[] args) {

		val frequencies = new InputLoader(2018, 1).inputs.map[Integer.parseInt(it)]

		println(frequencies.reduce[x, y|x + y])

		val visited = newHashSet
		var i = 0
		var current = 0
		do {
			visited.add(current)
			current += frequencies.get(i % frequencies.size)
			i++
		} while (!visited.contains(current))

		println(current)
	}
}
