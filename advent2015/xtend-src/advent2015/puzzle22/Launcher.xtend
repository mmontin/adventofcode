package advent2015.puzzle22

class Launcher {
	
	def static void main(String[] args) {
		
		val Board b = new Board()
		println(b.availableSpells.fold(Integer::MAX_VALUE)[v, s|Math.min(v, new Board(b).step(true, s))])
	}
}