package advent2025

import adventutils.geometry.Coordinate
import adventutils.input.InputLoader
import java.util.HashSet
import java.util.List
import java.util.Set

class Day12 {

	static final List<Set<Coordinate>> shapes = newArrayList
	static final List<Pair<Pair<Integer, Integer>, List<Integer>>> areas = newArrayList

	def static void main(String[] args) {
		val input = new InputLoader(2025, 12).inputs
		val current_shape = newHashSet
		var current_i = 0
		for (i : 0 ..< input.size) {
			switch (line : input.get(i)) {
				case line.isEmpty:
					if (!current_shape.isEmpty) {
						shapes.add(new HashSet(current_shape))
						current_shape.clear
						current_i = 0
					}
				case line.length == 3: {
					(0 .. 2).forEach[if(line.charAt(it) + "" == "#") current_shape.add(new Coordinate(i, it))]
					current_i++
				}
				case line.contains("x"): {
					val split = line.split(" ")
					val h = Integer.parseInt(split.get(0).substring(0, 2))
					val l = Integer.parseInt(split.get(0).substring(3, 5))
					areas.add((h -> l) -> split.tail.map[Integer.parseInt(it)].toList)
				}
			}
		}

		println(areas.filter [ area |
			area.key.key * area.key.value > (0 ..< area.value.size).fold(0) [ acc, i |
				acc + area.value.get(i) * shapes.get(i).size
			]
		].size)
	}
}
