package advent2021.puzzle15

import advent2021.Utils
import java.util.HashSet
import java.util.List
import java.util.Set

class Launcher {

	public static final List<List<Character>> input = Utils.getInputs(15)[it.toCharArray.toList]

	public static final int max_value_small = input.size
	public static final int max_value_big = max_value_small * 5

	public static Coordinate final_state

	public static final Set<Coordinate> coordinates = (0 ..< max_value_small).fold(newHashSet) [ set1, i |
		(0 ..< max_value_small).fold(set1) [ set2, j |
			val ij = Integer::parseInt(input.get(i).get(j) + '')
			(0 ..< 5).fold(set2) [ set3, u |
				(0 ..< 5).fold(set3) [ set4, v |
					val indice = ij + u + v
					val coord = new Coordinate((u * max_value_small) + i, (v * max_value_small) + j, indice >= 10 ? indice - 9 : indice)
					if (i == max_value_small - 1 && j == max_value_small - 1 && u == 4 && v == 4)
						final_state = coord
					set4.add(coord)
					set4
				]
			]
		]
	]

	public static final Set<Coordinate> toVisit = new HashSet(coordinates)

	def static void main(String[] args) {
		var time = System.currentTimeMillis
		var Coordinate first
		while (!(first = toVisit.minBy[distance]).equals(final_state)) {
			if (toVisit.size % 1000 == 0) {
				var time_1 = System.currentTimeMillis
				println((time_1 - time) + "ms for the last 1000 states")
				time = time_1
				println(toVisit.size + " states remaining")
			}
			toVisit.remove(first)
			for (c : first.neighbours(toVisit))	c.updateDistance(first)
		}
		println(final_state.distance)
	}
}
