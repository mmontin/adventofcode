package adventutils.geometry

import java.util.List

class Intervals {

	public List<Interval> content

	new() {
		content = newArrayList
	}
	
	new(List<Interval> content_) {
		this()
		content_.forEach[addInterval(it)]
	}

	def addInterval(Interval itv) {

		var i = 0
		var res_left = 1

		while (res_left == 1 && i < content.size)
			res_left = content.get(i++).position(itv.leftBound)
		i--

		if (res_left == 1) {
			content.add(itv)
			merge(content.size - 2)
		} else {
			var j = i
			var res_right = 1

			while (res_right == 1 && j < content.size)
				res_right = content.get(j++).position(itv.rightBound)
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
			merge(i - 1)
		}
	}

	def private merge(int index) {
		if (index >= 0 && index + 1 < content.size &&
			content.get(index + 1).leftBound == content.get(index).rightBound + 1) {
			content.get(index).rightBound = content.get(index + 1).rightBound
			content.remove(index + 1)
		}
	}

	def long nbOfElements() {
		content.fold(0L)[acc , el | acc + el.nbOfElements]
	}

	override toString() {
		content.toString
	}
}
