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
	
	override hashCode() {
		this.x + this.y + this.z
	}
	
	override toString() {
		'[' + x + ',' + y + ',' + z + ']'
	}
	
	def size2() {
		x * x + y * y + z * z
	}
	
	def multiplyBy(Matrix m) {
		val newx = m.coeffs.get(0).get(0) * x + m.coeffs.get(0).get(1) * y + m.coeffs.get(0).get(2) * z
		val newy = m.coeffs.get(1).get(0) * x + m.coeffs.get(1).get(1) * y + m.coeffs.get(1).get(2) * z
		val newz = m.coeffs.get(2).get(0) * x + m.coeffs.get(2).get(1) * y + m.coeffs.get(2).get(2) * z
		x = newx
		y = newy
		z = newz
		this
	}
	
	def add(Vector v) {
		x += v.x
		y += v.y
		z += v.z
	}
	
	override equals(Object o) {
		val v = o as Vector
		v.x == x && v.y == y && v.z == z
	}
	
	def containsZ() {
		x == 0 || y == 0 || z == 0
	}
	
	def hasDuplicates() {
		Math.abs(x) == Math.abs(y) || Math.abs(y) == Math.abs(z) || Math.abs(z) == Math.abs(x)
	}
}