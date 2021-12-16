package advent2016.puzzle15

class Launcher {
	def static void main(String[] args) {
		var t = 0
		while (!(
			(t + 2) % 17 == 0 &&
			(t + 2) % 7 == 0 && 
			(t + 5) % 19 == 0 && 
			(t + 4) % 5 == 0 && 
			(t + 5) % 3 == 0 &&
			(t + 11) % 13 == 0 &&
			(t + 7) % 11 == 0))
			t++
		println(t)
	}
}
