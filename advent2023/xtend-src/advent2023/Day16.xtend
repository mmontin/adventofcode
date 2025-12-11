package advent2023

import adventutils.collection.CollectionUtils
import adventutils.geometry.Coordinate
import adventutils.geometry.Direction
import adventutils.input.InputLoader
import java.util.List
import java.util.Map
import java.util.Set

class Day16 {

	static final List<List<String>> chars = new InputLoader(2023, 16).chars
	static final int max_x = chars.size - 1
	static final int max_y = chars.get(0).size - 1
	static final Map<Coordinate, String> walls = CollectionUtils.aggregateToMap((0 .. max_x)) [ i, walls |
		val current_line = chars.get(i)
		(0 .. max_y).forEach [ j |
			if (!current_line.get(j).equals("."))
				walls.put(new Coordinate(i, j), current_line.get(j))
		]
		// TODO fix the need for a 0 here in Collection.aggregateToMap
		0
	]
	static final Set<Pair<Coordinate, Direction>> visited = newHashSet

	def static void main(String[] args) {

		newHashSet(new Coordinate(0, -1) -> Direction.RIGHT).process
		println(visited.map[key].toSet.size)

		val initials = newHashSet;
		(0 .. max_x).forEach [
			initials.add(new Coordinate(it, -1) -> Direction.RIGHT)
			initials.add(new Coordinate(it, max_y + 1) -> Direction.LEFT)
		]
		(0 .. max_y).forEach [
			initials.add(new Coordinate(-1, it) -> Direction.DOWN)
			initials.add(new Coordinate(max_x + 1, it) -> Direction.UP)
		]
		println(initials.map [
			process(newHashSet(it))
			val ret = visited.map[key].toSet.size
			visited.clear
			ret
		].max)
	}

	def static void process(Set<Pair<Coordinate, Direction>> current) {
		current.forEach[process(nextCoords)]
	}

	def static nextCoords(Pair<Coordinate, Direction> current) {
		val output = newHashSet
		val next = current.key.otherMove(current.value)
		if (next.x >= 0 && next.x <= max_x && next.y >= 0 && next.y <= max_y) {
			switch (walls.get(next)) {
				case null:
					output.add(next -> current.value)
				case "/":
					output.add(next -> (switch (current.value) {
						case UP: Direction.RIGHT
						case DOWN: Direction.LEFT
						case RIGHT: Direction.UP
						case LEFT: Direction.DOWN
					}))
				case "-":
					if (current.value == Direction.LEFT || current.value == Direction.RIGHT)
						output.add(next -> current.value)
					else
						output.addAll(next -> Direction.LEFT, next -> Direction.RIGHT)
				case "|":
					if (current.value == Direction.UP || current.value == Direction.DOWN)
						output.add(next -> current.value)
					else
						output.addAll(next -> Direction.UP, next -> Direction.DOWN)
				case "\\":
					output.add(next -> (switch (current.value) {
						case UP: Direction.LEFT
						case DOWN: Direction.RIGHT
						case RIGHT: Direction.DOWN
						case LEFT: Direction.UP
					}))
			}
		}
		output.removeAll(visited)
		visited.addAll(output)
		output
	}
}
