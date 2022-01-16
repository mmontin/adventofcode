package advent2015.puzzle16

import adventutils.input.InputLoader

class Launcher {
	def static void main(String[] args) {
		new InputLoader(2015,16).getInputs.forEach[s | 
			val sue = new Sue(s)
			if (sue.valid) println(sue.number)
		]
	}
}