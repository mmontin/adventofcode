package advent2022

import java.util.Map
import adventutils.geometry.Coordinate
import adventutils.input.InputLoader
import adventutils.pathfinding.State
import adventutils.pathfinding.AStar
import java.util.ArrayList

class Day12 {

	static CoordinateElevated entrance ;
	static CoordinateElevated target ;
	static final Map<CoordinateElevated, Integer> elevations = {
		val output = newHashMap
		val input = new InputLoader(2022, 12).inputs
		val max_i = input.size
		val max_j = input.get(0).length;
		(0 ..< max_i).forEach [ i |
			val line = input.get(i).toCharArray;
			(0 ..< max_j).forEach [ j |
				switch (line.get(j)+"") {
					case 'S': {
						entrance = new CoordinateElevated(i, j)
						output.put(entrance, 0)
					}
					case 'E': {
						target = new CoordinateElevated(i, j)
						output.put(target, 25)
					}
					default:
						output.put(new CoordinateElevated(i, j), Integer.valueOf(line.get(j)) - 97)
				}
			]
		]
		output
	}

	def static void main(String[] args) {
		println(new AStar(entrance).run.minDistance)
		println(new ArrayList(elevations.keySet).filter[elevations.get(it)==0].map[
			try {
				new AStar(it).run.minDistance
			} catch (NullPointerException npe) {
				Integer.MAX_VALUE
			}
		].sort.head)
	}

	static class CoordinateElevated extends Coordinate implements State {

		new(int i, int j) {
			super(i, j)
		}

		override isGoal() {
			this.equals(target)
		}

		override minToGoal() {
			this.manhattanDistanceTo(target)
		}

		override neighbours() {
			noDiagonalUnboundedNeighbours.map[new CoordinateElevated(it.x, it.y)].filter [
				elevations.get(this) + 1 >= elevations.getOrDefault(it, 30)
			].map [
				it as State -> 1
			].toList
		}
	}
}
