package adventutils.geometry

// Unmutable 2D coordinates
class Coordinate {

	final int x
	final int y

	// Since this is unmutable, might as well compute the hashCode once and for all
	final int code

	new(int x_, int y_) {
		x = x_
		y = y_
		val tmp = (y + ((x + 1) / 2))
		code = x + (tmp * tmp)
	}

	// Creating a new Coordinate with a string of the form "a,b"
	new(String s) {
		this(Integer.parseInt(s.split(",").get(0)), Integer.parseInt(s.split(",").get(1)))
	}

	def getX() {
		x
	}

	def getY() {
		y
	}

	def symByY(int offset) {
		new Coordinate(x, 2 * offset - y)
	}

	def symByX(int offset) {
		new Coordinate(2 * offset - x, y)
	}

	def allAroundUnboundedNeighbours() {
		newHashSet(
			new Coordinate(this.x - 1, this.y - 1),
			new Coordinate(this.x - 1, this.y),
			new Coordinate(this.x - 1, this.y + 1),
			new Coordinate(this.x, this.y - 1),
			new Coordinate(this.x, this.y + 1),
			new Coordinate(this.x + 1, this.y - 1),
			new Coordinate(this.x + 1, this.y),
			new Coordinate(this.x + 1, this.y + 1)
		)
	}

	def noDiagonalUnboundedNeighbours() {
		newHashSet(
			new Coordinate(this.x - 1, this.y),
			new Coordinate(this.x + 1, this.y),
			new Coordinate(this.x, this.y - 1),
			new Coordinate(this.x, this.y + 1)
		)
	}

	def noDiagonalBoundedNeighbours(int lowerBound, int higherBound) {
		val output = newHashSet
		if(x > lowerBound) output.add(new Coordinate(x - 1, y))
		if(x < higherBound) output.add(new Coordinate(x + 1, y))
		if(y > lowerBound) output.add(new Coordinate(x, y - 1))
		if(y < higherBound) output.add(new Coordinate(x, y + 1))
		output
	}

	override toString() {
		'(' + x + ',' + y + ')'
	}

	override equals(Object o) {
		val other = o as Coordinate
		this.x == other.x && this.y == other.y
	}

	override hashCode() {
		code
	}
}
