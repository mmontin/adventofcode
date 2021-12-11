package advent2016.puzzle1

class Coordinates {

	int x
	int y

	new(Coordinates other) {
		this(other.x, other.y)
	}

	new(int x_, int y_) {
		x = x_
		y = y_
	}
	
	def addX(int add) {
		this.x += add
	}
	
	def addY(int add) {
		this.y += add
	}

	override equals(Object o) {
		val other = o as Coordinates
		this.x == other.x && this.y == other.y
	}

	override hashCode() {
		val tmp = (y + ((x + 1) / 2));
		return x + (tmp * tmp);
	}
	
	def blocks() {
		Math.abs(x) + Math.abs(y)
	}
	
	override toString() {
		'(' + x + ',' + y + ')'
	}
}
