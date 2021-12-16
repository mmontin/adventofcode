package advent2021.puzzle15

import java.util.Set

class Coordinate {

	int x
	int y
	int distance
	int height

	new(int x_, int y_, int height_) {
		x = x_
		y = y_
		distance = (x == 0 && y == 0) ? 0 : Integer::MAX_VALUE
		height = height_
	}
	
	def getDistance() {
		distance
	}
	
	def updateDistance(Coordinate previous) {
		if (previous.distance + height < distance)
			distance = previous.distance + height
	}
	
	def getHeight() {
		height
	}

	override equals(Object o) {
		val other = o as Coordinate
		this.x == other.x && this.y == other.y
	}

	override hashCode() {
		val tmp = (y + ((x + 1) / 2));
		return x + (tmp * tmp);
	}

	def neighbours(Set<Coordinate> possible) {
		possible.filter[
			(it.x == this.x && (it.y == this.y + 1 || it.y == this.y - 1)) ||
			(it.y == this.y && (it.x == this.x + 1 || it.x == this.x - 1))
		]
	}

	override toString() {
		'(' + this.x + ',' + this.y + ')'
	}
}
