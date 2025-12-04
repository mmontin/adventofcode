package advent2025

import adventutils.geometry.Coordinate
import adventutils.input.InputLoader
import java.util.List

class Day4 {
	def static void main(String[] args) {
		val coords = newHashSet
		new InputLoader(2025, 4).applyOnGrid[s, c|if(s == "@") coords.add(c)]
		println("Part1: " + coords.filter[it.allAroundFilteredNeighbours(coords).size <= 3].size)
		var count = 0
		var List<Coordinate> next
		do {
			next = coords.filter[it.allAroundFilteredNeighbours(coords).size <= 3].toList
			coords.removeAll(next)
			count += next.size
		} while (!next.isEmpty)
		println("Part2: " + count)
	}
}
