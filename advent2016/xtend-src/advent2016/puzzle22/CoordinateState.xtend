package advent2016.puzzle22

import adventutils.geometry.Coordinate
import adventutils.pathfinding.State

class CoordinateState extends Coordinate implements State {

	new(Coordinate c) {
		super(c.x, c.y)
	}

	override isGoal() {
		this.equals(Launcher.target)
	}

	override minToGoal() {
		manhattanDistanceTo(Launcher.target)
	}

	override neighbours() {
		noDiagonalUnboundedNeighbours.filter [
			!Launcher.walls.contains(it) && !it.equals(Launcher.dataPosition) && Launcher.input.containsKey(it)
		].map[new CoordinateState(it) -> 1]
	}
}
