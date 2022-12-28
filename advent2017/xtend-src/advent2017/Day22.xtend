package advent2017

import adventutils.geometry.Coordinate
import adventutils.geometry.Coordinate.Direction
import adventutils.input.InputLoader
import java.util.Map

class Day22 {

	def static void main(String[] args) {

		val input = new InputLoader(2017, 22).inputs.map[toCharArray]

		// Puzzle 1 only requires to keep track of infected nodes
		val infected = newHashSet

		val size_x = input.size
		val size_y = input.get(0).size

		for (i : 0 .. size_x - 1)
			for (j : 0 .. size_y - 1)
				if (input.get(i).get(j).toString.equals("#"))
					infected.add(new Coordinate(i, j))

		var current_position = new Coordinate(size_x / 2, size_y / 2)
		var current_direction = Direction.UP
		var infections = 0

		for (i : 0 .. 9999) {
			if (infected.contains(current_position)) {
				current_direction = Coordinate.clockWise(current_direction)
				infected.remove(current_position)
			} else {
				current_direction = Coordinate.counterClockWise(current_direction)
				infected.add(current_position)
				infections++
			}
			current_position = current_position.otherMove(current_direction)
		}

		println(infections)

		// Puzzle 2 requires to keep track of the state of each node
		// I use numbers between 0 to 3, from clean to tagged. This way
		// state changes are just incrementing the state modulo 4
		val Map<Coordinate, Integer> nodes = newHashMap

		for (i : 0 .. size_x - 1)
			for (j : 0 .. size_y - 1)
				if (input.get(i).get(j).toString.equals("#"))
					nodes.put(new Coordinate(i, j), 2)
				else
					nodes.put(new Coordinate(i, j), 0)

		current_position = new Coordinate(size_x / 2, size_y / 2)
		current_direction = Direction.UP
		infections = 0

		for (i : 0 .. 9999999) {
			val current_state = nodes.getOrDefault(current_position, 0)
			current_direction = switch current_state {
				case 0: Coordinate.counterClockWise(current_direction)
				case 1: current_direction
				case 2: Coordinate.clockWise(current_direction)
				case 3: Coordinate.clockWise(Coordinate.clockWise(current_direction))
			}
			if(nodes.merge(current_position, 1)[x, y|(x + y) % 4] == 2) infections++
			current_position = current_position.otherMove(current_direction)
		}

		println(infections)
	}
}
