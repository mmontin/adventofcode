package advent2016.puzzle24

import adventutils.geometry.Coordinate
import adventutils.astar.State

class CoordinateState extends Coordinate implements State {
	
	Coordinate goal
	
	new(Coordinate c, Coordinate goal_) {
		super(c.x, c.y)
		goal = goal_
	}
	
	override isGoal() {
		this.equals(goal)
	}
	
	override minToGoal() {
		manhattanDistanceTo(goal)
	}
	
	override neighbours() {
		super.noDiagonalUnboundedNeighbours.filter[
			!Launcher.walls.contains(it)
		].map[new Pair(new CoordinateState(it, goal) as State,1)].toList
	}
}