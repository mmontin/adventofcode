package advent2021.puzzle13

class Coordinates {

	int x
	int y

	new(int x_, int y_) {
		x = x_
		y = y_
	}
	
	def getX() {
		x
	}
	
	def getY() {
		y
	}
	
	new(String s){
		this.x = Integer.parseInt(s.split(",").get(0))
		this.y = Integer.parseInt(s.split(",").get(1))
	}

	def symByY(int offset) {
		new Coordinates(this.x, -this.y + 2 * offset)
	}
	
	def symByX(int offset) {
		new Coordinates(-this.x + 2 * offset, this.y)
	}

	override equals(Object o) {
		val other = o as Coordinates
		this.x == other.x && this.y == other.y
	}

	override hashCode() {
		val tmp = (y + ((x + 1) / 2));
		return x + (tmp * tmp);
	}

	override toString() {
		'(' + this.x + ',' + this.y + ')'
	}
}
