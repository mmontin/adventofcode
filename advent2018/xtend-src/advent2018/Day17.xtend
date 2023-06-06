package advent2018

import adventutils.geometry.Coordinate
import adventutils.geometry.CoordinateSet
import adventutils.input.InputLoader
import java.util.Set
import adventutils.geometry.Coordinate.Direction

class Day17 {

	static final Set<Coordinate> walls = {
		val output = new CoordinateSet
		new InputLoader(2018, 17).inputs.forEach [
			val split1 = it.split(", ")
			val split2 = split1.get(0).split("=")
			val split3 = split1.get(1).split("=")
			val split4 = split3.get(1).split("\\.\\.")
			val first = split2.get(0)
			val firstValue = Integer.parseInt(split2.get(1))
			val secondValue1 = Integer.parseInt(split4.get(0))
			val secondValue2 = Integer.parseInt(split4.get(1))
			val coord1 = first.equals("x")
					? new Coordinate(secondValue1, firstValue)
					: new Coordinate(firstValue, secondValue1)
			val coord2 = first.equals("x")
					? new Coordinate(secondValue2, firstValue)
					: new Coordinate(firstValue, secondValue2)
			output.addAll(Coordinate.getAllCoordsOnLine(coord1, coord2))
		]
		output
	}

	static final int maxX = walls.maxBy[x].x

	static final Set<Coordinate> water = new CoordinateSet

	static final Coordinate source = new Coordinate(0, 500)

	def static void main(String[] args) {
		flow(source)
		//myPrint
		println(water.size)
	}				

	def static myPrint() {
		val minX = walls.minBy[x].x
		val maxX = walls.maxBy[x].x
		val minY = walls.minBy[y].y
		val maxY = walls.maxBy[y].y
		// println(minX + " " + maxX + " " + minY + " " + maxY)
		var output = ""
		for (i : 0 .. 100) {
			for (j : 450 .. 550) {
				val newCoord = new Coordinate(i, j)
				output += {
					val isWall = walls.contains(newCoord)
					val isWater = water.contains(newCoord)
					if (isWall && isWater)
						"~"
					else if (newCoord.equals(source))
						"+"
					else if (isWall)
						"#"
					else if(isWater) "|" else "."
				}
			}
			output += "\n"				
		}
		println(output)
	}

	def static boolean flow(Coordinate source) {
		myPrint()
		val nextSource = goDown(source)

		if (nextSource.value.equals(source)) {
			true
		} else if (!nextSource.key) {
			false
		} else {
			val left = goSideways(nextSource.value, true)
			val right = goSideways(nextSource.value, false)
			water.addAll(left.value)
			water.addAll(right.value)
			
			// A wall on both sides
			if (left.key && right.key) {
				walls.addAll(left.value)
				walls.addAll(right.value)
				flow(source)
			// A single wall on the right
			} else if (!left.key && right.key) {
				if (flow(left.value.get(0))) flow(source) else false
			// A single wall on the left
			} else if (left.key && !right.key) {
				if (flow(right.value.get(0))) flow(source) else false
			// No wall on either side
			} else {
				val fLeft = flow(left.value.get(0))
				val fRight = flow(right.value.get(0))
				if (fLeft && fRight) flow(source) else false			
			}
		}
	}


	// Returns the coordinate reached by going down as much as possible
	// adds the coordinates as being reachable by water in the process
	// Also returns true if something has been reached, false otherwise
	def static goDown(Coordinate source) {
		var current = source
		var next = current.otherMove(Direction.DOWN)
		while (!walls.contains(next) && next.x < maxX) {
			current = next
			water.add(current)
			next = current.otherMove(Direction.DOWN)
		}
		if (next.x == maxX && !walls.contains(next)) {
			water.add(next)
			false -> current
		} else
			true -> current
	}

	def static goSideways(Coordinate source, boolean left) {
		var current = source
		val reached = newArrayList(source)
		var next = current.otherMove(left ? Direction.LEFT : Direction.RIGHT)
		while (!walls.contains(next) && walls.contains(next.otherMove(Direction.DOWN))) {
			current = next
			reached.add(current)
			next = current.otherMove(left ? Direction.LEFT : Direction.RIGHT)
		}
		(walls.contains(next) ?	true : {
			reached.add(0, next)
			false 
		}) -> reached
	}
}
