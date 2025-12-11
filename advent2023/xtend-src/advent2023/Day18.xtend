package advent2023

import adventutils.advanced.Map
import adventutils.collection.CollectionUtils
import adventutils.geometry.Coordinate
import adventutils.geometry.Dir
import adventutils.geometry.Rectangle
import adventutils.input.InputLoader
import java.math.BigInteger
import java.util.ArrayList
import java.util.Arrays
import java.util.List
import java.util.Set

class Day18 {

	def static void main(String[] args) {

		// Data preparation
		val List<String> input = new InputLoader(2023, 18).inputs
		val Coordinate start = new Coordinate(0, 0)

		val first_list = newArrayList(start)
		val second_list = newArrayList(start)

		input.forEach [ line |
			val split = line.split(" ")

			val dir = Dir.directionFromString(split.get(0))
			val number = Integer.parseInt(split.get(1))
			first_list.add(first_list.last.otherMove(dir, number))

			val other_number = Integer.parseInt(split.get(2).substring(2, split.get(2).length - 2), 16)
			val other_dir = Dir.directionFromStringNb(split.get(2).charAt(split.get(2).length - 2) + "")
			second_list.add(second_list.last.otherMove(other_dir, other_number))
		]

		// PART 1
		val output = Map.flow(first_list)
		println(output.value.key.size + output.value.value.size)

		// PART 2
		val xs = second_list.map[x].toSet.sort
		val ys = second_list.map[y].toSet.sort

		val second_list_shrinked = second_list.fold(new ArrayList) [ l, c |
			CollectionUtils.cons(new Coordinate(xs.indexOf(c.x) * 2, ys.indexOf(c.y) * 2), l)
		]

		val output_2 = Map.flow(second_list_shrinked)
		val inside = output_2.value.value

		val all_rectangles = (0 .. xs.size - 2).fold(newArrayList) [ list, x |
			(0 .. ys.size - 2).fold(list) [ list2, y |
				val small_rectangle = new Rectangle(2 * x, 2 * x + 2, 2 * y, 2 * y + 2)
				val big_rectangle = new Rectangle(xs.get(x), xs.get(x + 1), ys.get(y), ys.get(y + 1))
				list2.add(small_rectangle -> big_rectangle)
				list2
			]
			list
		]

		val t1 = System.currentTimeMillis

		val used_rectangles = smartSearch(all_rectangles, inside)

		val overSize = used_rectangles.fold(BigInteger.ZERO -> (newHashSet -> newHashSet)) [ sum, el |
			val tmp = el.bordersAndCorners
			val borders = tmp.value
			val corners = tmp.key
			sum.value.key.addAll(borders)
			sum.value.value.addAll(corners)
			sum.key + el.innerArea -> sum.value
		]
		println("TIME : " + (System.currentTimeMillis - t1))

		val size = overSize.key + BigInteger.valueOf(overSize.value.value.size) +
			overSize.value.key.fold(BigInteger.ZERO) [ acc, el |
				acc + BigInteger.valueOf(el.get(0).manhattanDistanceTo(el.get(1)) + 1)
			]

		println(size)
	}

	def static smartSearch(ArrayList<Pair<Rectangle, Rectangle>> all_rectangles, Set<Coordinate> inside) {

		val output = newHashSet
		val sorted_coords = inside.sort

		var left = 0
		var right = sorted_coords.size

		for (current : all_rectangles.sortBy[key]) {
			right = sorted_coords.size
			left = Arrays.binarySearch(sorted_coords, left, right, current.key.top_left)
			if(left < 0) left = -left - 1
			right = Arrays.binarySearch(sorted_coords, left, right, current.key.bot_right)
			if(right < 0) right = -right - 1
			val candidates = sorted_coords.subList(left, Math.min(right, sorted_coords.size))
			if (candidates.exists[current.key.strictlyContains(it)])
				output.add(current.value)
		}

		output
	}
}
