package advent2019

import adventutils.input.InputLoader
import java.util.ArrayList

class Day5 {
	def static void main(String[] args) {
		
		val inputs = new InputLoader(2019,5).inputs.get(0).split(",").map[Integer.parseInt(it)]
		val decoder = new Intcode(new ArrayList(inputs))
		println(decoder.processWithInputs(newArrayList(1)).last)
		decoder.reset(new ArrayList(inputs))
		println(decoder.processWithInputs(newArrayList(5)).last)
	}
}