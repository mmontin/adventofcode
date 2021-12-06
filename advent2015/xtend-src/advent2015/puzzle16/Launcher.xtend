package advent2015.puzzle16

import advent2015.Utils

class Launcher {
	def static void main(String[] args) {
		Utils.getInputs(16).forEach[s | 
			val sue = new Sue(s)
			if (sue.valid) println(sue.number)
		]
	}
}