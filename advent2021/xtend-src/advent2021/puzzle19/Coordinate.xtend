package advent2021.puzzle19

class Coordinate {

	protected int x
	protected int y

	new(int x_, int y_) {
		x = x_
		y = y_
	}

	override equals(Object o) {
		val other = o as Coordinate
		this.x == other.x && this.y == other.y
	}

	override hashCode() {
		val tmp = (y + ((x + 1) / 2));
		return x + (tmp * tmp);
	}
	
	override toString() {
		'(' + x + ',' + y + ')'
	}
}
