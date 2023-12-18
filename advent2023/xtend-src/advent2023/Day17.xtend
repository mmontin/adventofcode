package advent2023

import adventutils.collection.Collection
import adventutils.geometry.Coordinate
import adventutils.geometry.Coordinate.Direction
import adventutils.input.InputLoader
import adventutils.pathfinding.AStar
import adventutils.pathfinding.State
import java.util.List
import java.util.Map

class Day17 {

	static final List<List<String>> chars = new InputLoader(2023, 17).chars
	static final int max_x = chars.size - 1
	static final int max_y = chars.get(0).size - 1
	// FIXME : we should not need 0
	static final Map<Coordinate, Integer> heat = Collection.aggregateToMap(0 .. max_x) [ i, heat |
		val current_line = chars.get(i)
		(0 .. max_y).forEach [ j |
			heat.put(new Coordinate(i, j), Integer.parseInt(current_line.get(j)))
		]
		0
	]
	static final Coordinate target = new Coordinate(max_x, max_y)
	static final DirectedCoordinate source = new DirectedCoordinate(0, 0, Direction.UP)

	static int min_offset
	static int max_offset

	def static void main(String[] args) {

		min_offset = 1
		max_offset = 3
		val aStar = new AStar(source)
		println(aStar.run.minDistance)

		min_offset = 4
		max_offset = 10
		aStar.initialize(source)
		println(aStar.run.minDistance)
	}

	static class DirectedCoordinate extends Coordinate implements State {

		final int hashCode
		Direction direction

		new(int i, int j, Direction d) {
			super(i, j)
			direction = d
			hashCode = super.hashCode * d.hashCode
		}

		override isGoal() {
			super.equals(target)
		}

		override minToGoal() {
			manhattanDistanceTo(target)
		}

		override neighbours() {
			val directions = Coordinate.allDirections
			directions.remove(direction)
			directions.remove(Coordinate.opposite(direction))
			directions.fold(newHashSet) [ output, d |
				(1 ..< max_offset + 1).fold(0) [ acc, i |
					val newCoords = switch d {
						case UP: new Coordinate(x - i, y) -> new DirectedCoordinate(x - i, y, d)
						case DOWN: new Coordinate(x + i, y) -> new DirectedCoordinate(x + i, y, d)
						case LEFT: new Coordinate(x, y - i) -> new DirectedCoordinate(x, y - i, d)
						case RIGHT: new Coordinate(x, y + i) -> new DirectedCoordinate(x, y + i, d)
					}
					val h = heat.get(newCoords.key)
					var ans = acc
					if (h !== null) {
						ans = acc + h
						if (i >= min_offset)
							output.add(newCoords.value -> ans)
					}
					ans
				]
				output
			]
		}

		override toString() {
			super.toString
		}

		override hashCode() {
			hashCode
		}

		override equals(Object other) {
			val DirectedCoordinate c = other as DirectedCoordinate
			super.equals(other) && c.direction.equals(direction)
		}
	}
}
