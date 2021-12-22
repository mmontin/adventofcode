package advent2021.puzzle22

class Coordinate {

	protected int x
	protected int y
	protected int z

	new(int x_, int y_, int z_) {
		x = x_
		y = y_
		z = z_
	}

	override equals(Object o) {
		val other = o as Coordinate
		this.x == other.x && this.y == other.y && this.z == other.z
	}

	override hashCode() {
		return x + y + z ;
	}
	
	override toString() {
		'(' + x + ',' + y + ',' + z + ')'
	}
}
