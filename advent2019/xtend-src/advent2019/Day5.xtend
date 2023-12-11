package advent2019

import adventutils.input.InputLoader

class Day5 {
	def static void main(String[] args) {
		
		new InputLoader(2019,5).inputs.get(0).split(",").map[Integer.parseInt(it)]
	}
}