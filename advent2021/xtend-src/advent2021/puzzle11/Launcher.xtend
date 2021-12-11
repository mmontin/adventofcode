package advent2021.puzzle11

import java.util.HashMap
import advent2021.Utils

class Launcher {

	static HashMap<Coordinates, Integer> data = newHashMap

	static int number_of_occurrences = 0
	static int number_of_flashes = 0

	def static void main(String[] args) {

		val input = Utils.getInputs(11)
		(0 ..< 10).forEach [ i |
			val line = input.get(i)
			(0 ..< 10).forEach [ j |
				data.put(new Coordinates(i, j), Integer::parseInt(line.charAt(j) + ''))
			]
		]

		while (!data.values.toSet.equals(newHashSet(0))) {
			data.entrySet.forEach[data.replace(it.key, it.value + 1)]
			var Coordinates c
			while ((c = data.keySet.findFirst[data.get(it) >= 10]) !== null) {
				if(number_of_occurrences < 100) number_of_flashes++
				data.replace(c, 0)
				c.neighbours.filter[data.containsKey(it) && data.get(it) != 0].forEach[data.replace(it, data.get(it) + 1)]
			}
			number_of_occurrences++
		}

		println('Exercice 1: ' + number_of_flashes)
		println('Exercice 2: ' + number_of_occurrences)
	}
}
