package advent2018

import adventutils.geometry.Coordinate
import adventutils.input.InputLoader

class Day6 {
	def static void main(String[] args) {
		val sensors = new InputLoader(2018, 6).getInputs[new Coordinate(it.replace(" ", ""))]
		val minX = sensors.minBy[x].x
		val maxX = sensors.maxBy[x].x
		val minY = sensors.minBy[y].y
		val maxY = sensors.maxBy[y].y

		val position = newArrayList;
		(minX .. maxX).forEach [ i |
			(minY .. maxY).forEach [ j |
				position.add(new Coordinate(i, j))
			]
		]

		val areas = newHashMap
		while (!position.isEmpty) {
			val current = position.remove(0)
			val sorted = sensors.sortBy[manhattanDistanceTo(current)]
			val d1 = current.manhattanDistanceTo(sorted.get(0))
			val d2 = current.manhattanDistanceTo(sorted.get(1))
			if(d1 != d2) areas.merge(sorted.get(0), newHashSet(current))[u, v|u.addAll(v); u]
		}

		println(areas.values.map [
			it.exists[c|c.x == minX || c.x == maxX || c.y == minY || c.y == maxY] ? 0 : it.size
		].max)

		val max_distance = 10000
		val max_offset = max_distance / sensors.size;
		val region = newHashSet;
		(minX - max_offset .. maxX + max_offset).forEach [ i |
			(minY - max_offset .. maxY + max_offset).forEach [ j |
				val current = new Coordinate(i, j)
				val sum = sensors.fold(0)[acc, v|acc + current.manhattanDistanceTo(v)]
				if(sum < max_distance) region.add(current)
			]
		]

		println(region.size)
	}
}
