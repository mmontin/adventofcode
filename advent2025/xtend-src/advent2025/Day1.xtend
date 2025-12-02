package advent2025

import adventutils.input.InputLoader

class Day1 {
	def static void main(String[] args) {
		val lines = new InputLoader(2025, 1).inputs
		println("part1: " + lines.fold(50 -> 0) [ acc, el |
			val quantity = Integer.parseInt(el.substring(1))
			val newPosition = ((acc.key + (el.substring(0, 1) == "L" ? - quantity : quantity)) % 100 + 100) % 100
			newPosition -> acc.value + (newPosition == 0 ? 1 : 0)
		].value)

		println("part2: " + lines.fold(50 -> 0) [ acc, el |
			val quantity = Integer.parseInt(el.substring(1))
			val direction = el.substring(0, 1)
			val newPosition = ((acc.key + (direction == "L" ? - quantity : quantity)) % 100 + 100) % 100
			newPosition -> acc.value + {
				val distance = direction == "L" ? acc.key : 100 - acc.key
				if (acc.key == 0)
					quantity / 100
				else if (quantity >= distance)
					1 + (quantity - distance) / 100
				else
					0
			}
		].value)
	}
}
