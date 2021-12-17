package advent2016.puzzle17

import java.util.List

class Coordinates {

	final int x
	final int y
	final int hCode

	new(int x_, int y_) {
		x = x_
		y = y_
		val tmp = (y + ((x + 1) / 2))
		hCode = x + (tmp * tmp)
	}

	override equals(Object o) {
		val other = o as Coordinates
		this.x == other.x && this.y == other.y
	}

	override hashCode() {
		hCode
	}

	def neighbours(List<Boolean> bools) {
		val output = newHashMap
		if (bools.get(0) && y!=0) output.put("U", new Coordinates(x,y-1))
		if (bools.get(1) && y!=3) output.put("D", new Coordinates(x,y+1))
		if (bools.get(2) && x!=0) output.put("L", new Coordinates(x-1,y))
		if (bools.get(3) && x!=3) output.put("R", new Coordinates(x+1,y))
		output
	}
	
	def isFinal() {
		this.x == 3 && this.y == 3
	}

	override toString() {
		'(' + this.x + ',' + this.y + ')'
	}
}
