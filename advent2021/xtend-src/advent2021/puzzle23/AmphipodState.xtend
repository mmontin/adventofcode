package advent2021.puzzle23

import adventutils.astar.State
import adventutils.geometry.Coordinate
import java.util.Set

class AmphipodState implements State {

	static final Set<Coordinate> admissibleCoordinates = newHashSet(
		new Coordinate(0, 0),
		new Coordinate(0, 1),
		new Coordinate(0, 3),
		new Coordinate(0, 5),
		new Coordinate(0, 7),
		new Coordinate(0, 9),
		new Coordinate(0, 10),
		new Coordinate(1, 2),
		new Coordinate(2, 2),
		new Coordinate(1, 4),
		new Coordinate(2, 4),
		new Coordinate(1, 6),
		new Coordinate(2, 6),
		new Coordinate(1, 8),
		new Coordinate(2, 8)
	)

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
