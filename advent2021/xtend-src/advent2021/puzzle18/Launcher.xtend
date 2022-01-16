package advent2021.puzzle18

import adventutils.input.InputLoader
import java.io.BufferedReader
import java.io.StringReader

class Launcher {

	def static void main(String[] args) {

		val il = new InputLoader(2021,18)

		val sNumbers = newArrayList
		val br = il.getInputReader
		while (br.ready) {
			sNumbers.add(SNumber.createSNumber(br, null))
			br.read
		}
		br.close

		println(sNumbers.reduce[s1, s2|new Pair(s1, s2, null).reduce].magnitude)

		var max_magnitude = 0
		for (i : 0 ..< sNumbers.size)
			for (j : 0 ..< sNumbers.size)
				if (i != j) {
					var input = il.getInputs
					max_magnitude = Math.max(
						max_magnitude,
						new Pair(
							SNumber.createSNumber(new BufferedReader(new StringReader(input.get(i))),null),
							SNumber.createSNumber(new BufferedReader(new StringReader(input.get(j))),null),
							null
						).reduce.magnitude
					)
					br.close
				}
		println(max_magnitude)
	}
}
