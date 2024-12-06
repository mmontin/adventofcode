package advent2024

import adventutils.geometry.Coordinate
import adventutils.geometry.Dir
import adventutils.geometry.Direction
import adventutils.input.InputLoader
import java.util.Set

class Day6 {

	def static void main(String[] args) {
		val inputs = new InputLoader(2024, 6).inputs.map[toCharArray.map[it + ""]]
		val max_i = inputs.size - 1
		val max_j = inputs.get(0).size - 1
		val obstacles = newHashSet
		var Coordinate guard_position
		for (i : 0 .. max_i) {
			val current_line = inputs.get(i)
			for (j : 0 .. max_j) {
				switch (current_line.get(j)) {
					case "^": guard_position = new Coordinate(i, j)
					case "#": obstacles.add(new Coordinate(i, j))
				}
			}
		}
		println(simulate(obstacles, max_i, max_j, guard_position).key)

		// TODO we could optimize be only considering positions around the main path
		var loops = 0
		for (i : 0 .. max_i) {
			for (j : 0 .. max_j) {
				val current_coord = new Coordinate(i, j)
				if (!guard_position.equals(current_coord) && !obstacles.contains(current_coord)) {
					obstacles.add(current_coord)
					if (simulate(obstacles,max_i,max_j,guard_position).value) loops ++
					obstacles.remove(current_coord)
				}
			}
		}
		println(loops)
	}

	def static simulate(Set<Coordinate> obstacles, int max_i, int max_j, Coordinate starting_point) {
		val visited = newHashSet
		var current_position = starting_point
		var current_direction = Direction.UP
		while (current_position.includedIn(0, max_i, 0, max_j) &&
			!visited.contains(current_position -> current_direction)) {
			visited.add(current_position -> current_direction)
			val next_position = current_position.otherMove(current_direction)
			if (obstacles.contains(next_position))
				current_direction = Dir.clockWise(current_direction)
			else
				current_position = next_position
		}
		visited.map[key].toSet.size -> visited.contains(current_position -> current_direction)
	}
}
