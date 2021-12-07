package advent2015.puzzle15

class Launcher {
	
	def static void main(String[] args) {
		var max = 0
		for (x : 0..100)
			for (y : 0..(100 - x))
				for (z : 0..(100 - x - y))
					max = Math.max(max, valuation(x, y , z ,100 - x - y - z))	
		println(max)
	}
	
	def static int valuation(int x, int y, int z, int t) {
		2 * x + 9 * y + z + 8 * t == 500 ?
			Math.max(3 * x - 3 * y - z, 0) * Math.max(3 * y, 0) * Math.max(4 * z - 2 * t, 0) * Math.max(-3 * x + 2 * t, 0) : 0 
	}
}