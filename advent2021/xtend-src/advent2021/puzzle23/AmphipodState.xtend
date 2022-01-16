package advent2021.puzzle23

import adventutils.astar.State
import adventutils.geometry.Coordinate
import java.util.HashSet
import java.util.Map
import java.util.Set

class AmphipodState implements State {

	static final Coordinate hallway0 = new Coordinate(0, 0)
	static final Coordinate hallway1 = new Coordinate(0, 1)
	static final Coordinate hallway3 = new Coordinate(0, 3)
	static final Coordinate hallway5 = new Coordinate(0, 5)
	static final Coordinate hallway7 = new Coordinate(0, 7)
	static final Coordinate hallway9 = new Coordinate(0, 9)
	static final Coordinate hallway10 = new Coordinate(0, 10)
	static final Coordinate room12 = new Coordinate(1, 2)
	static final Coordinate room22 = new Coordinate(2, 2)
	static final Coordinate room14 = new Coordinate(1, 4)
	static final Coordinate room24 = new Coordinate(2, 4)
	static final Coordinate room16 = new Coordinate(1, 6)
	static final Coordinate room26 = new Coordinate(2, 6)
	static final Coordinate room18 = new Coordinate(1, 8)
	static final Coordinate room28 = new Coordinate(2, 8)

	static final Set<Coordinate> hallway = newHashSet(
		hallway0, hallway1, hallway3, hallway5, hallway7, hallway9,hallway10)

	static final Set<Coordinate> rooms = newHashSet(
		room12, room22, room14, room24, room16, room26, room18, room28)

	static final Set<Coordinate> all = {
		val output = new HashSet(hallway);
		output.addAll(rooms);
		output
	}

	final Map<Coordinate, Integer> amphipods

	new() {
		amphipods = newHashMap(
		hallway0 -> 0, hallway1 -> 0, hallway3 -> 0, hallway5 -> 0, hallway7 -> 0, hallway9 -> 0, hallway10 -> 0,
		room12 -> 6, room22 -> 8, room14 -> 2, room24 -> 6,	room16 -> 4, room26 -> 2, room18 -> 8, room28 -> 4)
	}

	override isGoal() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override minToGoal() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override neighbours() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override equals(Object other) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override hashCode() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
}
