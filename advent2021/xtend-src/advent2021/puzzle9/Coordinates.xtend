package advent2021.puzzle9

class Coordinates {

	int x
	int y

	new(int x_, int y_) {
		x = x_
		y = y_
	}

	override equals(Object o) {
		val other = o as Coordinates
		this.x == other.x && this.y == other.y
	}

	override hashCode() {
		val tmp = (y + ((x + 1) / 2));
		return x + (tmp * tmp);
	}

	def neighbours() {
		newHashSet(
			new Coordinates(this.x - 1, this.y),
			new Coordinates(this.x + 1, this.y),
			new Coordinates(this.x, this.y - 1),
			new Coordinates(this.x, this.y + 1)
		)
	}

	override toString() {
		'(' + this.x + ',' + this.y + ')'
	}
}
