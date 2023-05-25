package advent2018

import adventutils.geometry.Coordinate
import adventutils.geometry.CoordinateSet
import adventutils.input.InputLoader
import java.util.Set

class Day17 {

	static final Set<Coordinate> walls = {
		val output = new CoordinateSet
		println(new InputLoader(2018, 17).inputs.size)
		new InputLoader(2018, 17).inputs.forEach [
			val split1 = it.split(", ")
			val split2 = split1.get(0).split("=")
			val split3 = split1.get(1).split("=")
			val split4 = split3.get(1).split("\\.\\.")
			val first = split2.get(0)
			val firstValue = Integer.parseInt(split2.get(1))
			val secondValue1 = Integer.parseInt(split4.get(0))
			val secondValue2 = Integer.parseInt(split4.get(1))
			val coord1 = first.equals("x")
					? new Coordinate(firstValue, secondValue1)
					: new Coordinate(secondValue1, firstValue)
			val coord2 = first.equals("x")
					? new Coordinate(firstValue, secondValue2)
					: new Coordinate(secondValue2, firstValue)
			output.addAll(
					Coordinate.getAllCoordsOnLine(coord1, coord2))
		]
		output
	}

	def static void main(String[] args) {
		println(walls)
	}
}
