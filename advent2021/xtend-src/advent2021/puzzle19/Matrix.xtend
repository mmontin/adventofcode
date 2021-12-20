package advent2021.puzzle19

class Matrix {
	
	int[][] coeffs
	
	new(int[][] coeffs) {
		this.coeffs = coeffs
	}
	
	def multiply(Vector v) {
		new Vector(coeffs.get(0).get(0) * v.x + coeffs.get(1).get(0) * v.y + coeffs.get(2).get(0) * v.z,
				coeffs.get(0).get(1) * v.x + coeffs.get(1).get(1) * v.y + coeffs.get(2).get(1) * v.z,
				coeffs.get(0).get(2) * v.x + coeffs.get(1).get(2) * v.y + coeffs.get(2).get(2) * v.z
		)
	}
}