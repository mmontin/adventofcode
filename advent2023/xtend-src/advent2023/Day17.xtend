package advent2023

import adventutils.collection.Collection
import adventutils.geometry.Coordinate
import adventutils.input.InputLoader
import adventutils.pathfinding.AStar
import adventutils.pathfinding.State
import java.util.ArrayList
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

	def static void main(String[] args) {
		val aStar = new AStar(new MyCoordinate(0,0,newArrayList))
		//println(aStar.run.minPath)
		println(aStar.run.minDistance)
	}

	static class MyCoordinate extends Coordinate implements State {

		List<Coordinate.Direction> last_directions
		final int hashCode

		new(int i, int j, List<Coordinate.Direction> directions) {
			super(i, j)
			last_directions = directions
			hashCode = super.hashCode * last_directions.hashCode
		}

		override isGoal() {
			super.equals(target)
		}

		override minToGoal() {
			this.manhattanDistanceTo(target)
		}

		override neighbours() {
			val next_directions = switch (x : last_directions.size) {
				case 0:
					newArrayList(Direction.DOWN, Direction.RIGHT)
				case x < 3: {
					val output = newArrayList(Direction.DOWN, Direction.UP, Direction.RIGHT, Direction.LEFT)
					output.remove(Coordinate.opposite(last_directions.last))
					output
				}
				default: {
					val output = newArrayList(Direction.DOWN, Direction.UP, Direction.RIGHT, Direction.LEFT)
					output.remove(Coordinate.opposite(last_directions.last))
					if (last_directions.toSet.size == 1)
						output.remove(last_directions.last)
					output
				}
			}
			val output = newArrayList
			next_directions.forEach[
				val next_coordinate = this.otherMove(it)
				if (heat.containsKey(next_coordinate)) {
					val next_list = last_directions.size < 3 ?
						new ArrayList(last_directions) : 
						new ArrayList(last_directions.subList(1,3))
					next_list.add(it)
					output.add(new MyCoordinate(next_coordinate.x, next_coordinate.y, next_list)
						-> heat.get(next_coordinate)
					)
				}
			]
			output
		}

		override toString() {
			super.toString
		}

		override hashCode() {
			hashCode
		}
		
		override equals(Object other) {
			val MyCoordinate c = other as MyCoordinate
			super.equals(other) && c.last_directions.equals(last_directions)
		}
	}
}
