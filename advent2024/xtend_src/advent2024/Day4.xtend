package advent2024

import adventutils.geometry.Coordinate
import adventutils.input.InputLoader
import java.util.List
import java.util.Map

class Day4 {
	def static void main(String[] args) {
		val inputs = new InputLoader(2024, 4).inputs.map[toCharArray.map[it + ""]]
		val letters = newHashMap
		val max_i = inputs.size - 1
		val max_j = inputs.get(0).size - 1
		for (i : 0 .. max_i) {
			val line = inputs.get(i)
			for (j : 0 .. max_j)
				letters.put(new Coordinate(i, j), line.get(j))
		}
		var count = 0
		for (i : 0 .. max_i) {
			for (j : 0 .. max_j) {
				count +=
					analyse(letters,
						newArrayList(new Coordinate(i, j), new Coordinate(i, j + 1), new Coordinate(i, j + 2),
							new Coordinate(i, j + 3))) +
						analyse(letters,
							newArrayList(new Coordinate(i, j), new Coordinate(i + 1, j + 1),
								new Coordinate(i + 2, j + 2), new Coordinate(i + 3, j + 3))) +
						analyse(letters,
							newArrayList(new Coordinate(i, j), new Coordinate(i + 1, j), new Coordinate(i + 2, j),
								new Coordinate(i + 3, j))) +
						analyse(letters,
							newArrayList(new Coordinate(i, j), new Coordinate(i + 1, j - 1),
								new Coordinate(i + 2, j - 2), new Coordinate(i + 3, j - 3)))
			}
		}
		println(count)

		var count2 = 0
		for (i : 1 .. max_i - 1) {
			for (j : 1 .. max_j - 1) {
				val word = letters.get(new Coordinate(i - 1, j - 1)) + letters.get(new Coordinate(i - 1, j + 1)) +
					letters.get(new Coordinate(i, j)) + letters.get(new Coordinate(i + 1, j - 1)) +
					letters.get(new Coordinate(i + 1, j + 1))
				if(word == "MMASS" || word == "SSAMM" || word == "SMASM" || word == "MSAMS") count2++
			}
		}
		println(count2)
	}

	def static int analyse(Map<Coordinate, String> letters, List<Coordinate> list) {
		val word = list.fold("") [ acc, el |
			acc + letters.getOrDefault(el, "")
		]
		if(word == "XMAS" || word == "SAMX") 1 else 0
	}
}
