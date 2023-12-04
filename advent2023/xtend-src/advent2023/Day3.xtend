package advent2023

import adventutils.geometry.Coordinate
import adventutils.input.InputLoader
import java.util.HashSet
import java.util.List
import java.util.Map
import java.util.regex.Pattern

class Day3 {

	static final List<String> grid = new InputLoader(2023, 3).inputs
	static final int maxX = grid.size
	static final int maxY = grid.get(0).length
	static final Pattern number = Pattern.compile("\\d+")

	static final Map<Coordinate, List<Integer>> gears = newHashMap

	def static void main(String[] args) {

		val emptyLine = ".".repeat(maxY)
		grid.add(emptyLine)
		grid.add(0, emptyLine)

		println((1 .. maxX).fold(0) [ sum, i |
			val matcher = number.matcher(grid.get(i))
			var current = 0
			while (matcher.find()) {
				val matched = Integer.parseInt(matcher.group)
				val prev = matcher.start - 1
				val end = matcher.end
				val upper = hasSymbol(prev, end, grid.get(i - 1), i - 1)
				val lower = hasSymbol(prev, end, grid.get(i + 1), i + 1)
				val left = isSymbol(prev, grid.get(i), i)
				val right = isSymbol(end, grid.get(i), i)
				val allGears = newHashSet
				allGears.addAll(upper.value)
				allGears.addAll(lower.value)
				allGears.addAll(left.value)
				allGears.addAll(right.value)
				if(upper.key || lower.key || left.key || right.key) current += matched
				allGears.forEach [ g |
					gears.merge(g, newArrayList(matched)) [ o, n |
						o.addAll(n)
						o
					]
				]
			}
			sum + current
		])

		println(gears.entrySet.filter[x|x.value.size == 2].fold(0) [ acc, v |
			acc + (v.value.get(0) * v.value.get(1))
		])
	}

	def static Pair<Boolean, HashSet<Coordinate>> hasSymbol(int i, int j, String s, int x) {
		(i .. j).fold(false -> newHashSet) [ acc, e |
			val sub = isSymbol(e, s, x)
			acc.value.addAll(sub.value)
			(acc.key || sub.key) -> acc.value
		]
	}

	def static Pair<Boolean, HashSet<Coordinate>> isSymbol(int i, String s, int x) {
		try
			switch cAsInt : s.charAt(i) as int {
				case (cAsInt >= 49 && cAsInt <= 57) || cAsInt == 46 : false -> newHashSet
				case 42 : true -> newHashSet(new Coordinate(x, i))
				default : true -> newHashSet
			}
		catch (IndexOutOfBoundsException _)
			false -> newHashSet
	}
}
