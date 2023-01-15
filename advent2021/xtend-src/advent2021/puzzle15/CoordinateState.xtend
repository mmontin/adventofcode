package advent2021.puzzle15

import adventutils.pathfinding.State
import adventutils.geometry.Coordinate

class CoordinateState extends Coordinate implements State {
	
	static final Coordinate finalState = new Coordinate(Launcher.max_indice,Launcher.max_indice)
	
	int manhattan
	boolean isFinal

	new(Coordinate c) {
		this(c.x, c.y)
	}

	new(int x_, int y_) {
		super(x_, y_)
		manhattan = manhattanDistanceTo(finalState)
		isFinal = this.equals(finalState)
	}

	override isGoal() {
		isFinal
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
