package advent2016.puzzle22

import adventutils.geometry.Coordinate
import adventutils.astar.State

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
		super.noDiagonalUnboundedNeighbours.filter[
			!Launcher.walls.contains(it) &&
			!it.equals(Launcher.dataPosition) &&
			Launcher.input.containsKey(it)
		].map[new Pair(new CoordinateState(it) as State,1)].toList
	}
}