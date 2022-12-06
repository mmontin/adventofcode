package advent2022

import adventutils.input.InputLoader
import java.util.List

class Day6 {

	final static List<Character> input = new InputLoader(2022, 6).getInputs.head.toCharArray

	def static void main(String[] args) {
		compute(4)
		compute(14)
	}

	def static void compute(int nb) {
		var i = nb
		while (input.subList(i - nb, i).toSet.size < nb)
			i++
		println(i)
	}
}
