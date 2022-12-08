package advent2017

import adventutils.input.InputLoader

class Day1 {
	def static void main(String[] args) {

		val inputs = new InputLoader(2017, 1).getInputs.get(0).toCharArray
		val input_size = inputs.size
		val half_size = input_size / 2

		var sum = (0 ..< input_size).fold(0 -> 0) [ acc, e |

			val current = inputs.get(e)
			val next = inputs.get((e + 1) % input_size)
			val other = inputs.get((e + half_size) % input_size)

			var new_left = acc.key
			if(current.equals(next)) new_left = new_left + Character.getNumericValue(current)

			var new_right = acc.value
			if(current.equals(other)) new_right = new_right + Character.getNumericValue(current)

			new_left -> new_right
		]
		println(sum)
	}
}
