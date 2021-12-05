package advent2021.puzzle5

class Point {
	
	int x
	int y
	
	new(Point p, int slopeX, int slopeY) {
		x = p.x + slopeX
		y = p.y + slopeY
	}
	
	new(String toSplit) {
		val split = toSplit.split(",")
		x = Integer::parseInt(split.get(0))
		y = Integer::parseInt(split.get(1))
	}
	
	def sameLine(Point p) {
		p.x == this.x || p.y == this.y
	}
	
	def smaller(Point p) {
		this.x < p.x || (this.x == p.x && this.y <= p.y)
	}
	
	def xDiff(Point p) {
		p.x - this.x
	}
	
	def yDiff(Point p) {
		p.y - this.y
	}
	
	override equals(Object p) {
		(p as Point).x == this.x && (p as Point).y == this.y
	}
	
	override hashCode() {
		this.x + this.y
	}
}