package advent2021.puzzle15

import adventutils.pathfinding.AStar
import adventutils.input.InputLoader
import java.util.List
import java.util.Map

class Launcher {

	public static final List<List<Character>> input = new InputLoader(2021,15).getInputs[it.toCharArray.toList]

	public static final int max_value_small = input.size
	public static final int max_indice = max_value_small * 5 - 1

	public static final Map<CoordinateState,Integer> coordinates = (0 ..< max_value_small).fold(newHashMap) [ map1, i |
		(0 ..< max_value_small).fold(map1) [ map2, j |
			val ij = Integer::parseInt(input.get(i).get(j) + '')
			(0 ..< 5).fold(map2) [ map3, u |
				(0 ..< 5).fold(map3) [ map4, v |
					val indice = ij + u + v
					map4.put(new CoordinateState((u * max_value_small) + i, (v * max_value_small) + j),indice >= 10 ? indice - 9 : indice)
					map4
				]
			]
		]
	]

	def static void main(String[] args) {
		val timer = System.currentTimeMillis
		println(new AStar(new CoordinateState(0,0)).run.minDistance)
		println("Result computed in " + (System.currentTimeMillis - timer) + "ms")
	}
}
