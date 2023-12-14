package adventutils.geometry

import java.util.HashSet
import java.util.List
import java.util.Set

class CoordinateSet extends HashSet<Coordinate> {

	public int minX
	public int maxX
	public int minY
	public int maxY

	new() {
		super()
		minX = 0
		maxX = 0
		minY = 0
		maxY = 0
	}

	new(List<String> lines) {
		this()
		val chars = lines.map[it.toCharArray.map[it + ""]]
		val max_x = chars.size
		val max_y = chars.get(0).size;
		(0 ..< max_x).forEach [ i |
			val current_line = chars.get(i)
			(0 ..< max_y).forEach [ j |
				if (current_line.get(j).equals("#"))
					add(new Coordinate(i, j))
			]
		]
	}
	
	new(List<String> lines, String other, Set<Coordinate> otherSet) {
		this()
		val chars = lines.map[it.toCharArray.map[it + ""]]
		val max_x = chars.size
		val max_y = chars.get(0).size;
		(0 ..< max_x).forEach [ i |
			val current_line = chars.get(i)
			(0 ..< max_y).forEach [ j |
				if (current_line.get(j).equals("#"))
					add(new Coordinate(i, j))
				else if (current_line.get(j).equals(other))
					otherSet.add(new Coordinate(i,j))
			]
		]
	}	
	
	override add(Coordinate c) {
		if (c.x < minX) minX = c.x
		if (c.x > maxX) maxX = c.x
		if (c.y < minY) minY = c.y
		if (c.y > maxY) maxY = c.y
		super.add(c)
	}

	def line(int x) {
		this.filter[it.x == x]
	}
	
	def column(int y) {
		this.filter[it.y == y]
	}

	override toString() {
		if (this.empty)
			println("This set is empty")
		else {
			var output = ""
			for (i : minX .. maxX) {
				for (j : minY .. maxY)
					output += (this.contains(new Coordinate(i, j)) ? "#" : ".")
				output += "\n"
			}
			output
		}
	}
}
