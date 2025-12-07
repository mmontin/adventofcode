package advent2025

import adventutils.geometry.Coordinate
import adventutils.input.InputLoader
import java.util.Map

class Day7 {
	def static void main(String[] args) {
		val splitters = newHashSet
		val beams = newHashSet
		val Map<Coordinate, Long> quantum_beams = newHashMap
		val max_coord = new InputLoader(2025, 7).applyOnGrid [ s, c |
			if (s == "S") {
				beams.add(c)
				quantum_beams.put(c, 1L)
			} else if (s == "^")
				splitters.add(c)
		]
		var count = 0
		for (i : 1 .. max_coord.x) {
			for (j : -1 .. max_coord.y + 1) {
				val father = new Coordinate(i - 1, j)
				val father_count = quantum_beams.getOrDefault(father, 0L)
				val current = new Coordinate(i, j)
				val brother = new Coordinate(i, j - 1)
				val sister = new Coordinate(i, j + 1)
				if (beams.contains(father)) {
					if (splitters.contains(new Coordinate(i, j))) {
						beams.add(brother)
						quantum_beams.merge(brother, father_count)[x, y|x + y]
						beams.add(sister)
						quantum_beams.merge(sister, father_count)[x, y|x + y]
						count++
					} else {
						beams.add(current)
						quantum_beams.merge(current, father_count)[x, y|x + y]
					}
				}
			}
		}
		println("Part1: " + count)
		println("Part2: " + quantum_beams.entrySet.filter[it.key.x == max_coord.x].map[it.value].reduce[x, y|x + y])
	}
}
