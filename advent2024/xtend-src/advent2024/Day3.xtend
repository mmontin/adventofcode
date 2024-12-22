package advent2024

import adventutils.input.InputLoader
import java.util.regex.Pattern

class Day3 {
	def static void main(String[] args) {
		val input = new InputLoader(2024, 3).inputs.join

		val matcher = Pattern.compile("mul\\([0-9]+,[0-9]+\\)").matcher(input)
		var total = 0
		while (matcher.find) {
			var current = matcher.group
			current = current.substring(4, current.length - 1)
			val pair = current.split(",").map[Integer.parseInt(it)]
			total += pair.get(0) * pair.get(1)
		}
		println(total)

		val matcher2 = Pattern.compile("(mul\\([0-9]+,[0-9]+\\))|(do\\(\\))|(don't\\(\\))").matcher(input)
		var total2 = 0
		var enabled = true
		while (matcher2.find) {
			var current = matcher2.group
			switch current {
				case "do()":
					enabled = true
				case "don't()":
					enabled = false
				case enabled: {
					current = current.substring(4, current.length - 1)
					val pair = current.split(",").map[Integer.parseInt(it)]
					total2 += pair.get(0) * pair.get(1)
				}
			}
		}
		println(total2)
	}
}
