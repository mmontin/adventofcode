package advent2025

import adventutils.geometry.Interval
import adventutils.input.InputLoader
import java.util.Set

class Day2 {
	def static void main(String[] args) {
		val line = new InputLoader(2025, 2).inputs.get(0).split(",")
		val maxSize = (line.maxBy[(it.length - 1) / 2].length - 1) / 2
		val intervals = line.map[new Interval(it)]

		println("part1: " + (1 .. Math.pow(10, maxSize / 2) as int).fold(0L) [ acc, i |
			val currentString = i.toString
			val currentNb = Long.parseLong(currentString + currentString)
			if(intervals.exists[itv|itv.position(currentNb) == 0]) acc + currentNb else acc
		])
		
		val Set<Long> visited = newHashSet;
		println("part2: " + (1 .. Math.pow(10, maxSize / 2) as int).fold(0L) [ acc, i |
			val currentString = i.toString
			val currentSize = currentString.length ;
			(2 .. (maxSize / currentSize)).fold(acc) [ acc1, j |
				val currentNb = Long.parseLong(currentString.repeat(j))
				val res = if (!visited.contains(currentNb) && intervals.exists[itv|itv.position(currentNb) == 0])
					acc1 + currentNb
				else
					acc1
				visited.add(currentNb)
				res
			]
		])
	}
}
