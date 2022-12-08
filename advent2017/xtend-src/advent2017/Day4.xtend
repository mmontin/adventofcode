package advent2017

import adventutils.input.InputLoader

class Day4 {
	
	def static void main(String[] args) {
		val inputs = new InputLoader(2017,4).getInputs
		
		println(inputs.filter[
			val words = it.split(" ")
			words.toSet.size == words.size
		].size)
		
		println(inputs.filter[
			val words = it.split(" ").map[toCharArray.sort]
			words.toSet.size == words.size
		].size)
	}
}