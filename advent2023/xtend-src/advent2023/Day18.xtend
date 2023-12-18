package advent2023

import adventutils.advanced.Map
import adventutils.collection.ListUtils
import adventutils.geometry.Coordinate
import adventutils.geometry.Dir
import adventutils.geometry.Rectangle
import adventutils.input.InputLoader
import java.math.BigInteger
import java.util.ArrayList
import java.util.List

class Day18 {

	def static void main(String[] args) {

		val List<String> input = new InputLoader(2023, 18).inputs
		val Coordinate start = new Coordinate(0, 0)

		val first_list = newArrayList(start)
		val second_list = newArrayList(start)

		input.forEach [ line |
			val split = line.split(" ")

			val dir = Dir.directionFromString(split.get(0))
			val number = Integer.parseInt(split.get(1))
			first_list.add(first_list.last.otherMove(dir,number))

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
			ListUtils.cons(new Coordinate(xs.indexOf(c.x) * 2, ys.indexOf(c.y) * 2), l)
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

		val used_rectangles = inside.fold(newHashSet) [ set, el |	
			val rect = all_rectangles.findFirst[it.key.strictlyContains(el)]
			if (rect !== null) set.add(rect.value)
			set
		]

		val overSize = used_rectangles.fold(BigInteger.ZERO -> (newHashSet -> newHashSet)) [ sum, el |
			val tmp = el.bordersAndCorners
			val borders = tmp.value
			val corners = tmp.key
			sum.value.key.addAll(borders)
			sum.value.value.addAll(corners)
			sum.key + el.innerArea -> sum.value
		]

		val size = overSize.key + BigInteger.valueOf(overSize.value.value.size)
			 + overSize.value.key.fold(BigInteger.ZERO)[acc,el|
			 	acc + BigInteger.valueOf(el.get(0).manhattanDistanceTo(el.get(1))+1)
			 ]
		
		println(size)
	}
}
