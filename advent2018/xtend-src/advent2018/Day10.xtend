package advent2018

import adventutils.geometry.Coordinate
import java.util.List
import adventutils.input.InputLoader
import adventutils.geometry.Interval
import adventutils.geometry.CoordinateSet

class Day10 {

	static final List<Pair<Coordinate, Coordinate>> initial_conditions = new InputLoader(2018, 10).getInputs [
		new Coordinate(it.substring(10, 24)) -> new Coordinate(it.substring(36, 42))

	]

	def static void main(String[] args) {
		// Let's find the time when every star is at most 7 units away from the first vertically
		val first = initial_conditions.get(0)
		var current = new Interval(0,Long.MAX_VALUE)
		var i = 1
		while (!current.unity) {
			var next = getTimeInterval(first,initial_conditions.get(i))
			current = new Interval(Math.max(current.leftBound,next.leftBound),Math.min(current.rightBound,next.rightBound))
		}
		val right_time = current.leftBound as int
		// Let's wait for the time in question and collect stars at that time
		println(initial_conditions.fold(new CoordinateSet)[acc,v|
			acc.add(new Coordinate(v.key.y + right_time * v.value.y, v.key.x + right_time * v.value.x))
			acc
		])
		println(right_time)
	}
	
	def static getTimeInterval(Pair<Coordinate, Coordinate> c1, Pair<Coordinate, Coordinate> c2) {
		getTimeInterval(c1.key.y, c2.key.y, c1.value.y, c2.value.y)
	}
	
	def static getTimeInterval(int xA, int xB, int vA, int vB) {
		switch (x : vB - vA) {
			case 0 : 
				new Interval(0,Long.MAX_VALUE)
			case x > 0 : 
				new Interval((-7 + xA - xB) / x + 1, (7 + xA - xB) / x)
			default : 
				new Interval((-7 + xB - xA) / -x + 1, (7 + xB - xA) / -x)
		}
	}
}
