package advent2017

import adventutils.input.InputLoader

class Day2 {
	def static void main(String[] args) {
		val inputs = new InputLoader(2017, 2).getInputs

		print(inputs.fold(0 -> 0) [ acc1, e1 |

			val s = e1.split("\\s+").map[Integer.parseInt(it)]

			val res1 = s.fold(0 -> Integer.MAX_VALUE) [ acc2, e2 |
				var new_max = acc2.key
				var new_min = acc2.value
				if(e2 > new_max) new_max = e2
				if(e2 < new_min) new_min = e2
				new_max -> new_min
			]

			acc1.key + res1.key - res1.value -> acc1.value + divisor(s)
		])
	}

	def static int divisor(Integer[] input) {
		for (i : 0 ..< input.size)
			for (j : i + 1 ..< input.size) {
				val first = input.get(i)
				val second = input.get(j)
				if (first / second * second == first) return first / second
				if (second / first * first == second) return second / first
			}
		0
	}
}
