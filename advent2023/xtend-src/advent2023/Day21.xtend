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

		var Set<Coordinate> current = newHashSet(start)
		val currents = newArrayList
		for (i : 0 .. 327) {
			if (i == 64)
				println(current.size)
			if (i % 131 == 65)
				currents.add(current.size as long)
			current = current.fold(newHashSet) [ acc, el |
				acc.addAll(el.noDiagonalUnboundedNeighbours)
				acc
			].filter[garden_plots.contains(new Coordinate(mod(it.x, size_x), mod(it.y, size_y)))].toSet
		}
		
		println(solve(currents.get(0),currents.get(1),currents.get(2)))
	}

	def static int mod(int i, int max) {
		val output = i % max ;
		(output < 0) ? max + output : output
	}
	
	def static solve(long y1, long y2, long y3) {
		val b = (4 * y2 - 3 * y1 - y3) / 2
		val a = y2 - y1 - b
		val c = y1  
		val input = (26501365 - 65) / 131
		a * input * input + b * input + c 
	}
}
