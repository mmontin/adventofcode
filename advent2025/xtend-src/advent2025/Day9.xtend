package advent2025

import adventutils.collection.ListUtils
import adventutils.geometry.Coordinate
import adventutils.geometry.Rectangle
import adventutils.input.InputLoader
import java.util.ArrayList
import java.util.List

class Day9 {
	def static void main(String[] args) {
		val List<Coordinate> coords = new ArrayList(new InputLoader(2025, 9).inputs.map[new Coordinate(it)])
		val rectangles = ListUtils.pairs(coords, newArrayList)[e1, e2|new Rectangle(e1, e2)]
		val segments = (0 ..< coords.size).fold(newArrayList) [ acc, el |
			ListUtils.cons(new Segment(coords.get(el), coords.get((el + 1) % coords.size)), acc)
		]
		val maxY = coords.maxBy[y].y
		println("Part1: " + rectangles.maxBy[area].area)

		println("Part2: " + rectangles.filter[ rec |
			val can_be_reduced = rec.top_right.y - rec.top_left.y > 1 && rec.bot_right.x - rec.top_right.x > 1
			!can_be_reduced 
			|| (segments.forall[seg | !seg.intersect(rec)] 
				&& isInterior(rec.top_left.addX(1).addY(1),maxY,segments)
			)
		].maxBy[area].area)
	}

	def static isInterior(Coordinate c, int maxY, List<Segment> polygon) {
		val segment_right = new Segment(c, new Coordinate(c.x, maxY))
		polygon.filter[it.intersect(segment_right)].size % 2 == 1
	}

	static class Segment {
		boolean vertical
		int fixed
		IntegerRange variable

		// Assuming these coordinate make for a vertical or horizontal segment
		new(Coordinate c1, Coordinate c2) {
			if (c1.x == c2.x) {
				vertical = false
				fixed = c1.x
				variable = Math.min(c1.y, c2.y) .. Math.max(c1.y, c2.y)
			} else {
				vertical = true
				fixed = c1.y
				variable = Math.min(c1.x, c2.x) .. Math.max(c1.x, c2.x)
			}
		}

		// Intersection, with the assumption that only orthogonal segments may intersect
		def intersect(Segment other) {
			other.vertical != vertical && variable.contains(other.fixed) && other.variable.contains(fixed)
		}

		// Here it is assumed that the rectangle legth and with are at least 2
		def intersect(Rectangle r) {
			val rectangle_segments = newArrayList
			val tr = r.top_right.addX(1).addY(-1)
			val tl = r.top_left.addX(1).addY(1)
			val br = r.bot_right.addX(-1).addY(-1)
			val bl = r.bot_left.addX(-1).addY(1)
			
			rectangle_segments.add (new Segment(tl, tr))
			rectangle_segments.add (new Segment(tr, br))
			rectangle_segments.add (new Segment(br, bl))
			rectangle_segments.add(new Segment(bl, tl))
			
			rectangle_segments.exists[it.intersect(this)]
		}
	}
}
