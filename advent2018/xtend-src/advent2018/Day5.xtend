package advent2018

import adventutils.input.InputLoader
import java.util.ArrayList

class Day5 {

	def static void main(String[] args) {
		val line = new InputLoader(2018, 5).inputs.head
		println(react(new ArrayList(line.toCharArray)))

		println((97 .. 122).map [ i |
			react(
				new ArrayList(
					line.replaceAll((i as int as char).toString, "").replaceAll(((i - 32) as int as char).toString, "").
						toCharArray))
		].min)
	}

	def static int react(ArrayList<Character> line) {
		var Integer index
		do {
			index = (0 .. line.size - 2).findFirst [
				Math.abs(line.get(it) as int - line.get(it + 1) as int) == 32
			]
			if (index !== null) {
				line.remove(index as int)
				line.remove(index as int)
			}
		} while (index !== null)
		line.size
	}
}
