package advent2024

import adventutils.geometry.Coordinate
import adventutils.input.InputLoader
import adventutils.pathfinding.AStar
import adventutils.pathfinding.State
import java.util.List
import adventutils.pathfinding.NotInitializedException

class Day18 {

	static final Coordinate source = new Coordinate(0, 0)
	static final Coordinate target = new Coordinate(70, 70)
	static final List<Coordinate> falling = new InputLoader(2024, 18).inputs.map[new Coordinate(it)].toList
	static int index = 1024

	def static void main(String[] args) {

		println(new AStar(new MyCoordinate(source)).run.minDistance)

		var left = index
		var right = falling.size - 1
		while (left != right) {
			index = (right - left) / 2 + left
			try {
				new AStar(new MyCoordinate(source)).run
				left = index + 1
			} catch (NotInitializedException _)
				right = index
		}

		println(falling.get(index))
	}

	static class MyCoordinate extends Coordinate implements State {

		new(Coordinate c) {
			super(c)
		}

		override isGoal() {
			equals(target)
		}

		override minToGoal() {
			manhattanDistanceTo(target)
		}

		override neighbours() {
			this.noDiagonalBoundedNeighbours(0, 70, 0, 70).filter [
				!falling.take(index).contains(it)
			].map [
				new MyCoordinate(it) -> 1
			]
		}
	}
}
