package adventutils.geometry

import java.util.Collection
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
		setBoundaries(0,0,0,0)
	}

	new(Collection<? extends Coordinate> col) {
		super(col)
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
					otherSet.add(new Coordinate(i, j))
			]
		]
	}
	
	def setBoundaries(int minX_, int maxX_, int minY_, int maxY_) {
		minX = minX_
		maxX = maxX_
		minY = minY_
		maxY = maxY_
	}

	override add(Coordinate c) {
		if(c.x < minX) minX = c.x
		if(c.x > maxX) maxX = c.x
		if(c.y < minY) minY = c.y
		if(c.y > maxY) maxY = c.y
		super.add(c)
	}
	
	override remove(Object c) {
		val res = super.remove(c)
		val myCoord = c as Coordinate
		if (myCoord.x == minX)
			minX = minBy[x].x
		if (myCoord.x == maxX)
			maxX = maxBy[x].x
		if (myCoord.y == minY)
			minY = minBy[y].y
		if (myCoord.y == maxY)
			maxY = maxBy[y].y
		res
	}

	def line(int x) {
		this.filter[it.x == x]
	}

	def column(int y) {
		this.filter[it.y == y]
	}

	def invertSet() {
		val output = new CoordinateSet;
		(minX .. maxX).forEach [ i |
			(minY .. maxY).forEach [ j |
				val newCoord = new Coordinate(i, j)
				if (!contains(newCoord))
					output.add(newCoord)
			]
		]
		output
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
