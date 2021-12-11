package advent2015.puzzle25

class Launcher {
	def static void main(String[] args) {
		
		println((1..<intValue(2978,3083)).fold(20151125L)[v , e |
			(v * 252533L) % 33554393L
		])
	}
	
	def static int intValue(int row, int column) {
		(column + row - 1) * (column + row) / 2 - row + 1
	}
}