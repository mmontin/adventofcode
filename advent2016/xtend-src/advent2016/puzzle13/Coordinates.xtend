package advent2016.puzzle13

import java.util.Set

class Coordinates {

	static final int favourite_nb = 1358

	final int x
	final int y
	final int hCode
	final boolean passable
	int distance
	
	new(int x_, int y_) {
		x = x_
		y = y_
		val tmp = (y + ((x + 1) / 2))
		hCode = x + (tmp * tmp)
		passable = Integer::toBinaryString(x*(x+3+2*y)+y*(1+y)+favourite_nb).toCharArray.fold(0)[v , c |
			v + ((c + '').equals('1') ? 1 : 0)
		] % 2 == 0
		distance = Integer::MAX_VALUE
	}

	override equals(Object o) {
		val other = o as Coordinates
		this.x == other.x && this.y == other.y
	}

	override hashCode() {
		hCode
	}

	def step(Set<Coordinates> visited, Set<Coordinates> toVisit) {
		newHashSet(
			new Coordinates(this.x - 1, this.y),
			new Coordinates(this.x + 1, this.y),
			new Coordinates(this.x, this.y - 1),
			new Coordinates(this.x, this.y + 1)
		).filter[it.passable && it.x >= 0 && it.y >= 0 && !visited.contains(it)].forEach[ s |
			var c = toVisit.findFirst[it.equals(s)]
			if (c === null) {
				c = s
				toVisit.add(c)
			}
			c.updateDistance(distance+1)
		]
	}

	def getDistance() {
		distance
	}

	def updateDistance(int newDistance) {
		distance = Math.min(distance, newDistance)
	}

	override toString() {
		'(' + this.x + ',' + this.y + ')'
	}
}
