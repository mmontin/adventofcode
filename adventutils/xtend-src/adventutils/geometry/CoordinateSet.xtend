package adventutils.geometry

import java.util.HashSet

class CoordinateSet extends HashSet<Coordinate> {
	
	new() {
		super()
	}
	
	override toString() {
		if (this.empty)
			println("This set is empty")
		else {
			val minX = this.minBy[x].x
			val maxX = this.maxBy[x].x
			val minY = this.minBy[y].y
			val maxY = this.maxBy[y].y
			var output = ""
			for (i : minX-1..maxX+1) {
				for (j : minY-1.. maxY+1)
					output += (this.contains(new Coordinate(i,j)) ? "#" : ".")
				output += "\n"
			}
			output
		}
	}
}