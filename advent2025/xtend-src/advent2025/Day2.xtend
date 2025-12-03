package advent2025

import adventutils.geometry.Interval
import adventutils.input.InputLoader
import java.util.HashSet

class Day2 {
	def static void main(String[] args) {
		val line = new InputLoader(2025, 2).inputs.get(0).split(",")
		val maxSize = (line.maxBy[(it.length - 1) / 2].length - 1) / 2
		val intervals = line.map[new Interval(it)]

		println("part1: " + (1 .. (Math.pow(10, maxSize / 2) - 1) as int).fold(0L) [ acc, i |
			val currentString = i.toString
			val currentNb = Long.parseLong(currentString + currentString)
			if(intervals.exists[itv|itv.position(currentNb) == 0]) acc + currentNb else acc
		])

		println("part2: " + (1 .. (Math.pow(10, maxSize / 2) - 1) as int).fold(newHashSet) [ HashSet<Long> acc, i |
			val currentString = i.toString;
			(2 .. (maxSize / currentString.length)).fold(acc) [ acc1, j |
				val currentNb = Long.parseLong(currentString.repeat(j))
				if (intervals.exists[itv|itv.position(currentNb) == 0]) 
					acc1.add(currentNb)
				acc1
			]
		].reduce[x, y|x + y])
	}
}
