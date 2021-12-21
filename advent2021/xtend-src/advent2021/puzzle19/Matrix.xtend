package advent2021.puzzle19

class Matrix {
	
	protected int[][] coeffs
	
	new(int[][] coeffs) {
		this.coeffs = coeffs
	}
	
	new(Vector v1, Vector v2) {
		val a11 = v1.x == v2.x ? 1 : (v1.x == -v2.x ? -1 : 0)
		val a12 = v1.y == v2.x ? 1 : (v1.y == -v2.x ? -1 : 0)
		val a13 = v1.z == v2.x ? 1 : (v1.z == -v2.x ? -1 : 0)
		
		val a21 = v1.x == v2.y ? 1 : (v1.x == -v2.y ? -1 : 0)
		val a22 = v1.y == v2.y ? 1 : (v1.y == -v2.y ? -1 : 0)
		val a23 = v1.z == v2.y ? 1 : (v1.z == -v2.y ? -1 : 0)
		
		val a31 = v1.x == v2.z ? 1 : (v1.x == -v2.z ? -1 : 0)
		val a32 = v1.y == v2.z ? 1 : (v1.y == -v2.z ? -1 : 0)
		val a33 = v1.z == v2.z ? 1 : (v1.z == -v2.z ? -1 : 0)
		
		coeffs = #[#[a11,a12,a13],#[a21,a22,a23],#[a31,a32,a33]]
	}
}