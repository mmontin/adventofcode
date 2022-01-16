package advent2021.puzzle15

import adventutils.astar.State
import adventutils.geometry.Coordinate

class CoordinateState extends Coordinate implements State {
	
	int manhattan
	boolean finalState

	new(Coordinate c) {
		this(c.x, c.y)
	}

	new(int x_, int y_) {
		super(x_, y_)
		manhattan = 2 * Launcher.max_indice - x - y
		finalState = x == Launcher.max_indice && y == Launcher.max_indice
	}

	override isGoal() {
		finalState
	}

	override minToGoal() {
		manhattan
	}

	override neighbours() {
		noDiagonalBoundedNeighbours(0, Launcher.max_indice).toList.map[
			new Pair((new CoordinateState(it)) as State, Launcher.coordinates.get(it))
		]
	}
}
