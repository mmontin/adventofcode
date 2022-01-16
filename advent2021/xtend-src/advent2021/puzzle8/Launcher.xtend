package advent2021.puzzle8

import adventutils.input.InputLoader

class Launcher {
	def static void main(String[] args) {
		val il = new InputLoader(2021,8)
		println(il.getInputs.fold(0)[v , x | v + (new Decoder(x)).decode1])
		println(il.getInputs.fold(Double.valueOf(0))[v , x | v + (new Decoder(x)).decode2])
	}
}