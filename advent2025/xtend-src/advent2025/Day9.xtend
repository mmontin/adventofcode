package advent2025

import adventutils.collection.CollectionUtils
import adventutils.collection.ListUtils
import adventutils.geometry.Coordinate
import adventutils.geometry.Rectangle
import adventutils.geometry.Segment
import adventutils.input.InputLoader
import java.util.ArrayList
import java.util.List

class Day9 {
	def static void main(String[] args) {
		val List<Coordinate> coords = new ArrayList(new InputLoader(2025, 9).inputs.map[new Coordinate(it)])
		val rectangles = ListUtils.pairs(coords, newArrayList)[e1, e2|new Rectangle(e1, e2)]
		val segments = (0 ..< coords.size).fold(newArrayList) [ acc, el |
			CollectionUtils.cons(new Segment(coords.get(el), coords.get((el + 1) % coords.size)), acc)
		]
		val maxY = coords.maxBy[y].y
		println("Part1: " + rectangles.maxBy[area].area)

		println("Part2: " + rectangles.filter [ rec |
			!rec.hasInterior || (segments.forall[seg|!rec.subRectangle.intersectsWith(seg)] && {
				segments.filter [
					it.intersect(new Segment(rec.pick, new Coordinate(rec.pick.x, maxY)))
				].size % 2 == 1
			})
		].maxBy[area].area)
	}
}
