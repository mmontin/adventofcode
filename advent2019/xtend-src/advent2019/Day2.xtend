package advent2019

import adventutils.input.InputLoader
import java.util.ArrayList
import java.util.List

class Day2 {
	def static void main(String[] args) {
		
		val inputs = new InputLoader(2019, 2).inputs.get(0).split(",").map[Integer.parseInt(it)]

		val inputs_1 = new ArrayList(inputs)
		inputs_1.set(1,12)
		inputs_1.set(2,2)
		
		val decoder = new Intcode(inputs_1)
		decoder.process
		println(decoder.result)

		
//		var i = 0
//		var j = 0
//		var output = 0
//		while (output != 19690720) {
//			i ++
//			if (i == 99) {
//				i = 0
//				j ++
//			}
//			output = process(i,j,inputs)
//		}
//		
//		println(100 * i + j)
	}

//	def static process(Integer noun, Integer verb, List<Integer> inputs) {
//		val opcodes = new ArrayList(inputs)
//		opcodes.set(1, noun)
//		opcodes.set(2, verb)
//		var i = 0
//		while (opcodes.get(i) != 99) {
//			val left = opcodes.get(opcodes.get(i + 1))
//			val right = opcodes.get(opcodes.get(i + 2))
//			val newVal = opcodes.get(i) == 1 ? left + right : left * right
//			opcodes.set(opcodes.get(i + 3), newVal)
//			i += 4
//		}
//		opcodes.get(0)
//	}
}
