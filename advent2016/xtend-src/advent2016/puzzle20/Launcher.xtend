package advent2016.puzzle20

import adventutils.input.InputLoader

class Launcher {
	
	def static void main(String[] args) {
		
		val c = new Constellation()

		new InputLoader(2016,20).getInputs.forEach[
			c.addInterval(new Interval(it))
		]
		
		println(c.firstValid)
		println(c.nb_of_valids)
	}
}