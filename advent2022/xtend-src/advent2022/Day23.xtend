package advent2022

import adventutils.geometry.Coordinate
import adventutils.geometry.Direction
import adventutils.input.InputLoader
import java.util.List
import java.util.Set

class Day23 {

	static final List<char[]> input = new InputLoader(2022, 23).inputs.map[toCharArray]
	static final Set<Coordinate> elves = newHashSet
	static final List<Direction> propositions = newArrayList

	def static init() {
		propositions.clear
		propositions.addAll(newArrayList(Direction.UP, Direction.DOWN, Direction.LEFT, Direction.RIGHT))
		elves.clear;
		(0 ..< input.size).forEach [ i |
			(0 ..< input.get(0).size).forEach [ j |
				if ((input.get(i).get(j) + "").equals("#"))
					elves.add(new Coordinate(i, j))
			]
		]
	}

	def static void main(String[] args) {
		init;
		(0 ..< 10).forEach[round]
		val minX = elves.minBy[x].x
		val maxX = elves.maxBy[x].x
		val minY = elves.minBy[y].y
		val maxY = elves.maxBy[y].y
		println((maxX - minX + 1) * (maxY - minY + 1) - elves.size)

		init;
		var i = 0
		do
			i++
		while (round)
		println(i)
	}

	def static round() {
		// We store, for each coordinate, the elves that proposed it
		val proposals = newHashMap
		elves.forEach [ elf |
			val empty_neighbours = elf.allAroundUnboundedNeighbours.filter[!elves.contains(it)].toSet
			if (empty_neighbours.size != 8) {
				var proposition_made = false
				var i = 0
				while (!proposition_made && i < 4) {
					val current_direction = propositions.get(i)
					val current_proposal = elf.directedNeighbours(current_direction)
					if (empty_neighbours.containsAll(current_proposal)) {
						proposition_made = true
						proposals.merge(elf.otherMove(current_direction), newHashSet(elf))[s1, s2|s1.addAll(s2); s1]
					}
					i++
				}
			}
		]

		var has_moved = false
		// We actually do the displacements
		for (entry : proposals.entrySet)
			if (entry.value.size == 1) {
				elves.remove(entry.value.head)
				elves.add(entry.key)
				has_moved = true
			}

		// At the end of the round, we rotate the direction
		propositions.add(propositions.remove(0))
		has_moved
	}
}
