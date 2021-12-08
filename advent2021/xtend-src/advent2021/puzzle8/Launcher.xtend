package advent2021.puzzle8

import advent2021.Utils

class Launcher {
	def static void main(String[] args) {
		println(Utils.getInputs(8).fold(0)[v , x | v + (new Decoder(x)).decode1])
		println(Utils.getInputs(8).fold(Double.valueOf(0))[v , x | v + (new Decoder(x)).decode2])
	}
}