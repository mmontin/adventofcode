package advent2023

import adventutils.MemoryRunnerWithDefault
import adventutils.geometry.Coordinate
import adventutils.input.InputLoader
import java.util.Set

class Day21 {

	static Set<Coordinate> garden_plots = newHashSet
	static Coordinate start
	static int size_y
	static int size_x

	def static void main(String[] args) {
		size_x = new InputLoader(2023, 21).chars.fold(0) [ i, el |
			size_y = el.fold(0) [ j, c |
				if (c.equals("S") || c.equals(".")) {
					val current = new Coordinate(i, j)
					garden_plots.add(current)
					if(c.equals("S")) start = current
				}
				j + 1
			]
			i + 1
		]


		println(runner.call(64 -> (start -> new Coordinate(0, 0))).size)
//		println(runner.call(65 -> (start -> new Coordinate(0, 0))).size)
//		println(runner.call(65+131 -> (start -> new Coordinate(0, 0))).size)
//		println(runner.call(65+2*131 -> (start -> new Coordinate(0, 0))).size)

		val a = 3710 // run(65)
		val b = 29633 // run (56 + 131)
		val c = 87955 // run (56 + 2*131)
		val n = 202300 // 26501365 / 131
		
		println(a+n*(b-a+(n-1)*(c )))
	}

	static final MemoryRunnerWithDefault<Pair<Integer, Pair<Coordinate, Coordinate>>, Set<Pair<Coordinate, Coordinate>>> runner = new MemoryRunnerWithDefault(
		newHashSet) [
		navigate
	]

	def static Set<Pair<Coordinate, Coordinate>> navigate(Pair<Integer, Pair<Coordinate, Coordinate>> input) {
		val neighbours = neighbours(input.value.key, input.value.value)
		if (input.key == 0)
				newHashSet(input.value)
			else if (input.key == 1)
				neighbours
			else
				neighbours.fold(newHashSet) [ acc, el |
					acc.addAll(runner.call(input.key - 1 -> el))
					acc
				]
	}

	def static neighbours(Coordinate gardener_location, Coordinate board_position) {
		gardener_location.noDiagonalUnboundedNeighbours.map [
			switch it {
				case (it.x == -1):
					new Coordinate(size_x - 1, it.y) -> board_position.addX(-1)
				case (it.x == size_x):
					new Coordinate(0, it.y) -> board_position.addX(1)
				case (it.y == -1):
					new Coordinate(it.x, size_y - 1) -> board_position.addY(-1)
				case (it.y == size_y):
					new Coordinate(it.x, 0) -> board_position.addY(1)
				default:
					it -> board_position
			}
		].filter[garden_plots.contains(it.key)].toSet
	}
}
