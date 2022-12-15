package advent2015.puzzle22

class Launcher {
	
	def static void main(String[] args) {
		
		var time = System.currentTimeMillis
		new Board().play(0)
		println('The answer is ' + Board::mana_min_spent_to_win + ' and it took ' + (System.currentTimeMillis - time) + ' ms to compute it.')
	}
}