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
			for (i : minX..maxX) {
				for (j : minY.. maxY)
					output += (this.contains(new Coordinate(i,j)) ? "#" : ".")
				output += "\n"
			}
			output
		}
	}
}