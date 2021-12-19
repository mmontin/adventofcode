package advent2016.puzzle20

import advent2016.Utils

class Launcher {
	
	def static void main(String[] args) {
		
		val c = new Constellation()

		Utils.getInputs(20).forEach[
			c.addInterval(new Interval(it))
		]
		
		println(c.firstValid)
		println(c.nb_of_valids)
	}
}