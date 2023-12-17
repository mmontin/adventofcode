package advent2019

import adventutils.input.InputLoader
import java.util.ArrayList
import java.util.List

class Day2 {
	def static void main(String[] args) {
		
		val inputs = new InputLoader(2019, 2).inputs.get(0).split(",").map[Integer.parseInt(it)]
		println(process(12,2,inputs))
		
		var i = 0
		var j = 0
		var output = 0
		while (output != 19690720) {
			i ++
			if (i == 99) {
				i = 0
				j ++
			}
			output = process(i,j,inputs)
		}
		
		println(100 * i + j)
	}

	def static process(Integer noun, Integer verb, List<Integer> inputs) {
		val opcodes = new ArrayList(inputs)
		opcodes.set(1, noun)
		opcodes.set(2, verb)

		val decoder = new Intcode(opcodes)
		decoder.run
		decoder.result
	}
}
