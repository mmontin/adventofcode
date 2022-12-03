package adventutils.geometry

import java.util.Set

// Unmutable 2D coordinates
class Coordinate {

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
		this(Integer.parseInt(s.split(",").get(0)), Integer.parseInt(s.split(",").get(1)))
	}

	def getX() {
		x
	}

	def addX(int x_) {
		new Coordinate(x + x_, y)
	}

	def addY(int y_) {
		new Coordinate(x , y + y_)
	}

	def getY() {
		y
	}
	
	def Coordinate right(int max) {
		if (y + 1 == max) new Coordinate(x,0)
		else addY(1)
	}
	
	def Coordinate down(int max) {
		if (x + 1 == max) new Coordinate(0,y)
		else addX(1)
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
		newHashSet(
			new Coordinate(x - 1, y),
			new Coordinate(x + 1, y),
			new Coordinate(x, y - 1),
			new Coordinate(x, y + 1)
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

	def manhattanDistanceTo(Coordinate other) {
		Math.abs(other.x - x) + Math.abs(other.y - y)
	}
	
	def manhattanDistanceToZero() {
		manhattanDistanceTo(new Coordinate(0,0))
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
}