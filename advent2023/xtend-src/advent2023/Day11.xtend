package advent2023

import adventutils.geometry.Coordinate
import adventutils.input.InputLoader
import java.util.List

class Day11 {

	def static void main(String[] args) {
		val inputs = new InputLoader(2023, 11).chars
		val max_x = inputs.size - 1
		var max_y = inputs.get(0).size - 1
		val List<Boolean> empty_cols = (0 .. max_y).map [ y |
			(0 .. max_x).map[x|inputs.get(x).get(y)].forall[it.equals(".")]
		].toList

		val galaxies_1 = newArrayList
		val galaxies_2 = newArrayList

		var x_offset_1 = 0
		var x_offset_2 = 0
		var y_offset_1 = 0
		var y_offset_2 = 0

		for (x : 0 .. max_x) {
			val line = inputs.get(x)
			y_offset_1 = 0
			y_offset_2 = 0
			if (line.forall[it.equals(".")]) {
				x_offset_1 += 1
				x_offset_2 += 999999
			} else {
				for (y : 0 .. max_y) {
					if (empty_cols.get(y)) {
						y_offset_1 += 1
						y_offset_2 += 999999
					} else {
						if (line.get(y).equals("#")) {
							galaxies_1.add(new Coordinate(x + x_offset_1, y + y_offset_1))
							galaxies_2.add(new Coordinate(x + x_offset_2, y + y_offset_2))
						}
					}
				}
			}
		}

		val nb_of_galaxies = galaxies_1.size
		var distances_1 = 0
		var distances_2 = 0L

		for (x : 0 ..< nb_of_galaxies)
			for (y : x + 1 ..< nb_of_galaxies) {
				distances_1 += galaxies_1.get(x).manhattanDistanceTo(galaxies_1.get(y))
				distances_2 += galaxies_2.get(x).manhattanDistanceTo(galaxies_2.get(y))
			}

		println(distances_1)
		println(distances_2)
	}
}
