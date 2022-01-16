package advent2021.puzzle15

import adventutils.astar.State

class Coordinate extends State {

	int x
	int y
	int manhattan
	boolean finalState
	int code
	
	new(int x_, int y_) {
		x = x_
		y = y_
		manhattan = 2 * Launcher.max_indice - x - y
		finalState = x == Launcher.max_indice && y == Launcher.max_indice
		val tmp = (y + ((x + 1) / 2))
		code = x + (tmp * tmp)
	}
	
	override isGoal() {
		finalState
	}
	
	override minToGoal() {
		manhattan
	}
	
	override neighbours() {
		val output = newArrayList
		if (x != 0) output.add(new Coordinate(x-1,y))
		if (x != Launcher.max_indice) output.add(new Coordinate(x+1,y))
		if (y != 0) output.add(new Coordinate(x,y-1))
		if (y != Launcher.max_indice) output.add(new Coordinate(x,y+1))
		output.map[new Pair(it as State,Launcher.coordinates.get(it))]
	}
	
	override equals(Object o) {
		val other = o as Coordinate
		this.x == other.x && this.y == other.y
	}
	
	override hashCode() {
		code
	}
}
