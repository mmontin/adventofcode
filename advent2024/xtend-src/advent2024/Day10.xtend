package advent2024

import adventutils.geometry.Coordinate
import adventutils.input.InputLoader

class Day10 {
	def static void main(String[] args) {
		val input = new InputLoader(2024, 10).inputs.map[toCharArray.map[Integer.parseInt(it + "")]]
		val max_i = input.size - 1
		val max_j = input.get(0).size - 1
		val heights = newHashMap;
		(0 .. max_i).forEach [ i |
			val line = input.get(i)
			(0 .. max_j).forEach [ j |
				heights.put(new Coordinate(i, j), line.get(j))
			]
		]
		println(heights.entrySet.filter[it.value == 0].map[key].fold(0 -> 0) [ acc, source |
			var next_height = 1
			var current = newArrayList(source)
			while (next_height <= 9 && !current.isEmpty) {
				val height = next_height
				current = current.fold(newArrayList) [ acc1, pos |
					acc1.addAll(pos.noDiagonalBoundedNeighbours(0, max_i, 0, max_j).filter[heights.get(it) == height])
					acc1
				]
				next_height++
			}
			acc.key + current.toSet.size -> acc.value + current.size
		])
	}
}
