package advent2021.puzzle5

import java.util.Map

class Segment {

	Point p1
	Point p2
	int slopeX
	int slopeY

	new(String s) {
		val split = s.split(" -> ")
		val p3 = new Point(split.get(0))
		val p4 = new Point(split.get(1))
		if (p3.smaller(p4)) {
			p1 = p3
			p2 = p4
		} else {
			p1 = p4
			p2 = p3
		}
		val sY = p1.yDiff(p2)
		val sX = p1.xDiff(p2)
		val pgcd = gcd(Math.abs(sY), Math.abs(sX))
		slopeY = sY / pgcd
		slopeX = sX / pgcd
	}

	def line() {
		p1.sameLine(p2)
	}

	def addPointsOnGrid(Map<Point,Integer> points) {
		var p = p1 ;
		while (p.smaller(p2)) {
			points.merge(p, 1)[x , y | x + y]
			p = new Point(p, slopeX, slopeY)
		}
	}

	def private int gcd(int a, int b) {
		b == 0 ? a : gcd(b, a % b)
	}
}
