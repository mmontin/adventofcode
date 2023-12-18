package advent2023

import adventutils.collection.ListUtils
import adventutils.geometry.Coordinate
import adventutils.geometry.CoordinateSet
import adventutils.geometry.Dir
import adventutils.geometry.Direction
import adventutils.input.InputLoader
import java.math.BigInteger
import java.util.ArrayList
import java.util.HashSet
import java.util.List

class Day18 {

	def static Direction direction(String s) {
		switch s {
			case "0": Direction.RIGHT
			case "1": Direction.DOWN
			case "2": Direction.LEFT
			case "3": Direction.UP
		}
	}

	def static void main(String[] args) {

		val List<String> input = new InputLoader(2023, 18).inputs
		val Coordinate start = new Coordinate(0, 0)

		val first_list = newArrayList(start)
		val second_list = newArrayList(start)

		input.forEach [ line |
			val split = line.split(" ")

			val dir = Dir.directionFromString(split.get(0))
			val number = Integer.parseInt(split.get(1))
			for (i : 0 ..< number)
				first_list.add(first_list.last.otherMove(dir))

			val other_number = Integer.parseInt(split.get(2).substring(2, split.get(2).length - 2), 16)
			val other_dir = direction(split.get(2).charAt(split.get(2).length - 2) + "")
			second_list.add(second_list.last.otherMove(other_dir, other_number))
		]

		// PART 1
		println(spreadOutside(new CoordinateSet(first_list)).size)

		// PART 2
		val xs = second_list.map[x].toSet.sort
		val ys = second_list.map[y].toSet.sort

		val second_list_shrinked = second_list.fold(new ArrayList) [ l, c |
			ListUtils.cons(new Coordinate(xs.indexOf(c.x) * 2, ys.indexOf(c.y) * 2), l)
		]

		val shrinked_set = (0 ..< second_list_shrinked.size).fold(new CoordinateSet) [ set, i |
			val left = second_list_shrinked.get(i)
			val right = second_list_shrinked.get((i + 1) % second_list_shrinked.size)
			set.addAll(Coordinate.getAllCoordsOnLine(left, right))
			set
		]

		val reached = spreadOutside(shrinked_set)

		val rectangles = (0 .. xs.size - 2).fold(newArrayList) [ list, x |
			(0 .. ys.size - 2).fold(list) [ list2, y |
				val small_rectangle = new Rectangle(2 * x, 2 * x + 2, 2 * y, 2 * y + 2)
				val big_rectangle = new Rectangle(xs.get(x), xs.get(x + 1), ys.get(y), ys.get(y + 1))
				list2.add(small_rectangle -> big_rectangle)
				list2
			]
			list
		]

		val used_rectangles = reached.fold(newHashSet) [ set, el |
			val rect = rectangles.findFirst[it.key.strictlyContains(el)]
			if (rect !== null)
				set.add(rect.value)
			set
		]

		val overSize = used_rectangles.fold(BigInteger.ZERO -> newHashMap) [ sum, el |
			el.borders.forEach[sum.value.merge(it, 1)[x, y|x + y]]
			sum.key + el.area -> sum.value
		]

		val duplicateSize = overSize.value.entrySet.filter[it.value > 1].map[key].fold(BigInteger.ZERO) [ acc, el |
			acc + BigInteger.valueOf(el.get(0).manhattanDistanceTo(el.get(1))) + BigInteger.ONE
		]

		println(overSize.key.subtract(duplicateSize))
	}

	def static spreadOutside(CoordinateSet s) {
		val frontier = newHashSet(new Coordinate(-1, -1))
		val reached = new CoordinateSet(s)
		while (!frontier.empty) {
			val tmp = new HashSet(frontier)
			reached.addAll(frontier)
			frontier.clear
			tmp.forEach [
				frontier.addAll(it.noDiagonalBoundedNeighbours(s.minX - 1, s.maxX + 1, s.minY - 1, s.maxY + 1).filter [
					!reached.contains(it)
				])
			]
		}
		reached.removeAll(s)
		reached.invertSet
	}

	static class Rectangle {

		final int minX
		final int maxX
		final int minY
		final int maxY

		new(int x1, int x2, int y1, int y2) {
			minX = x1 <= x2 ? x1 : x2
			maxX = minX == x1 ? x2 : x1
			minY = y1 <= y2 ? y1 : y2
			maxY = minY == y1 ? y2 : y1
		}

		def area() {
			(BigInteger.valueOf(maxY + 1) - BigInteger.valueOf(minY)) *
				(BigInteger.valueOf(maxX + 1) - BigInteger.valueOf(minX))
		}

		def contains(Coordinate c) {
			minX <= c.x && c.x <= maxX && minY <= c.y && c.y <= maxY
		}

		def strictlyContains(Coordinate c) {
			minX < c.x && c.x < maxX && minY < c.y && c.y < maxY
		}

		def borders() {
			newHashSet(
				newHashSet(new Coordinate(minX, minY), new Coordinate(minX, maxY)),
				newHashSet(new Coordinate(minX, minY), new Coordinate(maxX, minY)),
				newHashSet(new Coordinate(minX, maxY), new Coordinate(maxX, maxY)),
				newHashSet(new Coordinate(maxX, minY), new Coordinate(maxX, maxY))
			)
		}

		override hashCode() {
			minX * maxX + minY * maxY
		}

		override equals(Object other) {
			val Rectangle o = other as Rectangle
			minX == o.minX && maxY == o.maxY && minY == o.minY && maxY == o.maxY
		}
	}
}
