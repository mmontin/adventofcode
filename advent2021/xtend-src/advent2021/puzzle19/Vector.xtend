package advent2021.puzzle19

class Vector {
	
	protected int x
	protected int y
	protected int z
	
	new(int x, int y, int z) {
		this.x = x
		this.y = y
		this.z = z
	}
	
	new(String s) {
		this(
			Integer::parseInt(s.split(',').get(0)),
			Integer::parseInt(s.split(',').get(1)),
			Integer::parseInt(s.split(',').get(2))
		)
	}
	
	def to(Vector other) {
		new Vector(other.x - x, other.y - y, other.z - z)
	}
	
	override toString() {
		'[' + x + ',' + y + ',' + z + ']'
	}
	
	def size2() {
		x * x + y * y + z * z
	}
}