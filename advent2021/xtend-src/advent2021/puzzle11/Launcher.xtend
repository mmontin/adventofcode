package advent2021.puzzle11

import adventutils.input.InputLoader
import java.util.HashMap
import adventutils.geometry.Coordinate

class Launcher {

	static HashMap<Coordinate, Integer> data = newHashMap

	static int number_of_occurrences = 0
	static int number_of_flashes = 0

	def static void main(String[] args) {

		val input = new InputLoader(2021,11).getInputs ;
		
		(0 ..< 10).forEach [ i |
			val line = input.get(i)
			(0 ..< 10).forEach [ j |
				data.put(new Coordinate(i, j), Integer::parseInt(line.charAt(j) + ''))
			]
		]

		while (!data.values.toSet.equals(newHashSet(0))) {
			data.entrySet.forEach[data.replace(it.key, it.value + 1)]
			var Coordinate c
			while ((c = data.keySet.findFirst[data.get(it) >= 10]) !== null) {
				if(number_of_occurrences < 100) number_of_flashes++
				data.replace(c, 0)
				c.allAroundUnboundedNeighbours.filter[data.containsKey(it) && data.get(it) != 0].forEach[data.replace(it, data.get(it) + 1)]
			}
			number_of_occurrences++
		}

		println('Exercise 1: ' + number_of_flashes)
		println('Exercise 2: ' + number_of_occurrences)
	}
}
