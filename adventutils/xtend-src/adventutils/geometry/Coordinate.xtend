package adventutils.geometry

import java.util.Set

// Unmutable 2D coordinates
class Coordinate implements Comparable<Coordinate> {

	final int x
	final int y

	// Since this is unmutable, might as well compute the hashCode once and for all
	final int code

	// We can do the same for the string representation of this object
	final String representation

	new(int x_, int y_) {
		x = x_
		y = y_
		val tmp = (y + ((x + 1) / 2))
		code = x + (tmp * tmp)
		representation = '(' + x + ',' + y + ')'
	}

	// Creating a new Coordinate with a string of the form "a,b"
	new(String s) {
		this(Integer.parseInt(s.split(",").get(0).trim), Integer.parseInt(s.split(",").get(1).trim))
	}

	new(Coordinate c) {
		this(c.x, c.y)
	}

	new() {
		this(0, 0)
	}

	def getX() {
		x
	}

	def addX(int x_) {
		new Coordinate(x + x_, y)
	}

	def addY(int y_) {
		new Coordinate(x, y + y_)
	}

	def getY() {
		y
	}

	def Coordinate right(int max) {
		if(y + 1 == max) new Coordinate(x, 0) else addY(1)
	}

	def Coordinate down(int max) {
		if(x + 1 == max) new Coordinate(0, y) else addX(1)
	}

	def symByY(int offset) {
		new Coordinate(x, 2 * offset - y)
	}

	def symByX(int offset) {
		new Coordinate(2 * offset - x, y)
	}

	// Neighbours in the 8 possible surrounding spots
	def allAroundUnboundedNeighbours() {
		newHashSet(
			new Coordinate(x - 1, y - 1),
			new Coordinate(x - 1, y),
			new Coordinate(x - 1, y + 1),
			new Coordinate(x, y - 1),
			new Coordinate(x, y + 1),
			new Coordinate(x + 1, y - 1),
			new Coordinate(x + 1, y),
			new Coordinate(x + 1, y + 1)
		)
	}

	// Neighbours in the 8 possible surrounding spots, but keeping only those present in candidates
	def allAroundFilteredNeighbours(Set<Coordinate> candidates) {
		val output = allAroundUnboundedNeighbours
		output.retainAll(candidates)
		output
	}

	// Neighbours on the 4 closest spots, excluding diagonals
	def noDiagonalUnboundedNeighbours() {
		noDiagonalUnboundedNeighboursWithDirection.map[key].toSet
	}

	def noDiagonalUnboundedNeighboursWithDirection() {
		newHashSet(
			new Coordinate(x - 1, y) -> Direction.UP,
			new Coordinate(x + 1, y) -> Direction.DOWN,
			new Coordinate(x, y - 1) -> Direction.LEFT,
			new Coordinate(x, y + 1) -> Direction.RIGHT
		)
	}

	// Neighbours excluding diagonals, and bounded in a square of size higherBound - lowerBound
	def noDiagonalBoundedNeighbours(int lowerBound, int higherBound) {
		val output = newHashSet
		if(x > lowerBound) output.add(new Coordinate(x - 1, y))
		if(x < higherBound) output.add(new Coordinate(x + 1, y))
		if(y > lowerBound) output.add(new Coordinate(x, y - 1))
		if(y < higherBound) output.add(new Coordinate(x, y + 1))
		output
	}

	def allAroundBoundedNeighbours(Coordinate upperLeft, Coordinate bottomRight) {
		allAroundUnboundedNeighbours.filter [ c |
			c.x >= upperLeft.x && c.x < bottomRight.x && c.y >= upperLeft.y && c.y < bottomRight.y
		]
	}

	def manhattanDistanceTo(Coordinate other) {
		Math.abs(other.x - x) + Math.abs(other.y - y)
	}

	def manhattanDistanceToZero() {
		manhattanDistanceTo(new Coordinate(0, 0))
	}

	def distanceSquared(Coordinate other) {
		val side1 = other.x - x
		val side2 = other.y - y
		side1 * side1 + side2 * side2
	}

	override toString() {
		representation
	}

	override equals(Object o) {
		val other = o as Coordinate
		x == other.x && y == other.y
	}

	override hashCode() {
		code
	}

	static enum Direction {
		UP,
		DOWN,
		LEFT,
		RIGHT
	}

	def static Direction fromLeftRight(String s) {
		switch s {
			case "<": Direction.LEFT
			default: Direction.RIGHT
		}
	}

	def static Direction directionFromPole(String s) {
		switch s {
			case "N": Direction.UP
			case "S": Direction.DOWN
			case "W": Direction.LEFT
			default: Direction.RIGHT
		}
	}

	def static Direction directionFromString(String s) {
		switch s {
			case "U": Direction.UP
			case "D": Direction.DOWN
			case "L": Direction.LEFT
			default: Direction.RIGHT
		}
	}

	def static Direction nextDirection(Direction d) {
		switch d {
			case UP: Direction.LEFT
			case LEFT: Direction.DOWN
			case DOWN: Direction.RIGHT
			case RIGHT: Direction.UP
		}
	}

	def static Direction clockWise(Direction d) {
		switch d {
			case UP: Direction.RIGHT
			case RIGHT: Direction.DOWN
			case DOWN: Direction.LEFT
			case LEFT: Direction.UP
		}
	}

	def static Direction counterClockWise(Direction d) {
		d.nextDirection
	}

	def static int directionValue(Direction d) {
		switch d {
			case UP: 3
			case RIGHT: 0
			case DOWN: 1
			case LEFT: 2
		}
	}

	def Coordinate move(Direction d) {
		switch d {
			case UP: addY(1)
			case DOWN: addY(-1)
			case RIGHT: addX(1)
			case LEFT: addX(-1)
		}
	}

	def Coordinate otherMove(Direction d) {
		switch d {
			case UP: addX(-1)
			case DOWN: addX(1)
			case RIGHT: addY(1)
			case LEFT: addY(-1)
		}
	}

	def Set<Coordinate> directedNeighbours(Direction d) {
		switch d {
			case UP:
				newHashSet(new Coordinate(x - 1, y - 1), new Coordinate(x - 1, y), new Coordinate(x - 1, y + 1))
			case DOWN:
				newHashSet(new Coordinate(x + 1, y - 1), new Coordinate(x + 1, y), new Coordinate(x + 1, y + 1))
			case RIGHT:
				newHashSet(new Coordinate(x - 1, y + 1), new Coordinate(x, y + 1), new Coordinate(x + 1, y + 1))
			case LEFT:
				newHashSet(new Coordinate(x - 1, y - 1), new Coordinate(x, y - 1), new Coordinate(x + 1, y - 1))
		}
	}

	// Here it's assumed that both coordinates share one of their values
	def static getAllCoordsOnLine(Coordinate coordinate, Coordinate coordinate2) {
		val output = newHashSet
		if (coordinate.x == coordinate2.x) {
			val _left = coordinate.y <= coordinate2.y ? coordinate : coordinate2
			val _right = _left.equals(coordinate) ? coordinate2 : coordinate;
			(_left.y .. _right.y).forEach[output.add(new Coordinate(coordinate.x, it))]
		} else { // here coordinate.y == coordinate2.y
			val _up = coordinate.x <= coordinate2.x ? coordinate : coordinate2
			val _down = _up.equals(coordinate) ? coordinate2 : coordinate;
			(_up.x .. _down.x).forEach[output.add(new Coordinate(it, coordinate.y))]
		}
		output
	}

	override compareTo(Coordinate other) {
		switch (value : x.compareTo(other.x)) {
			case 0: y.compareTo(other.y)
			default: value
		}
	}

}
