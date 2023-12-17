package advent2019

import advent2019.Intcode.ListWrapper
import adventutils.input.InputLoader

class Day5 {
	def static void main(String[] args) {

		val opcodes = new InputLoader(2019, 5).inputs.get(0).split(",").map[Integer.parseInt(it)]
		val inputs = newArrayList(1)
		val outputs = newArrayList
		val decoder = new Intcode(opcodes, new ListWrapper(inputs), new ListWrapper(outputs), "")
		decoder.run
		println(outputs.last)
		decoder.reset
		inputs.clear
		outputs.clear
		inputs.add(5)
		decoder.run
		println(outputs.last)
	}
}
