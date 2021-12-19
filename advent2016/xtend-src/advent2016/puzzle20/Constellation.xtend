package advent2016.puzzle20

import java.util.List

class Constellation {

	static final long max_value = 2L * Integer::MAX_VALUE + 1L

	List<Interval> content

	new() {
		content = newArrayList
	}

	def addInterval(Interval itv) {

		var i = 0
		var res_left = 1

		while (res_left == 1 && i < content.size)
			res_left = content.get(i++).contains(itv.leftBound)
		i--

		if (res_left == 1) {
			content.add(itv)
			merge(content.size-2)
		} else {
			var j = i
			var res_right = 1

			while (res_right == 1 && j < content.size)
				res_right = content.get(j++).contains(itv.rightBound)
			if(res_right != 1) j--

			if (res_left == 0)
				itv.leftBound = content.get(i).leftBound

			if (res_right == 0) {
				itv.rightBound = content.get(j).rightBound
				j++
			}

			for (k : i ..< j)
				content.remove(i)
			content.add(i, itv)
			merge(i)
			merge(i-1)
		}
	}

	def void merge(int index) {
		if (index >= 0 && index + 1 < content.size &&
			content.get(index + 1).leftBound == content.get(index).rightBound + 1) {
			content.get(index).rightBound = content.get(index + 1).rightBound
			content.remove(index + 1)
		}
	}

	override toString() {
		content.toString
	}

	def firstValid() {
		content.get(0).rightBound + 1
	}
	
	def nb_of_valids() {
		(0..<content.size-1).fold(content.get(0).leftBound + max_value - content.get(content.size-1).rightBound)[sum , i |
			sum + (content.get(i+1).leftBound - content.get(i).rightBound - 1)
		]
	}
}
