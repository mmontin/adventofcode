package advent2022

import adventutils.input.InputLoader
import java.util.List

class Day6 {

	final static List<Character> input = new InputLoader(2022, 6).getInputs.head.toCharArray

	def static void main(String[] args) {
		println(compute(4))
		println(compute(14))
	}

	def static compute(int nb) {
		(nb..input.size).findFirst[input.subList(it-nb,it).toSet.size == nb]
	}
}
