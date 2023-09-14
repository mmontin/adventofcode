package advent2018

import adventutils.Either
import adventutils.geometry.Coordinate
import adventutils.geometry.Coordinate.Direction
import adventutils.geometry.CoordinateSet
import adventutils.input.InputLoader
import java.util.List
import java.util.Optional
import java.util.Set

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

	static int flows = 0

	static final int maxX = walls.maxBy[x].x

	static final Set<Coordinate> water = new CoordinateSet

	static final Coordinate source = new Coordinate(0, 500)

	def static void main(String[] args) {
		flowDown(source)
//		myPrint
		println(water.size)
	}

	def static myPrint() {
		val minX = walls.minBy[x].x
		val maxX = walls.maxBy[x].x
		val minY = walls.minBy[y].y
		val maxY = walls.maxBy[y].y
		println(minX + " " + maxX + " " + minY + " " + maxY)
		var output = ""
		for (i : minX - 1 .. maxX) {
			for (j : minY .. maxY) {
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

	// Returns true if the bottom has been reached, false otherwise
	//
	// Side effect : fills all water from the source
	def static boolean flowDown(Coordinate source) {

		if (flows % 50 == 0) {
			println("--------------------")
			println("Flowing down")
			println(source)
			println(water.size)
			println("--------------------")
		}
		flows ++

		val downs = goDown(source)
		if (!downs.isPresent)
			// we reached the bottom
			false
		else {
			val downStream = downs.get
			var i = 0
			var finished = false
			while (i < downStream.size && !finished)
				finished = !flowBothSides(downStream.get(i++))
			i >= downStream.size ? true : !finished
		}
	}

	def static boolean flowBothSides(Coordinate source) {
		var lefts = flowOneSide(source, true)
		var rights = flowOneSide(source, false)
		var wallOnLeft = lefts.isRight
		var wallOnRight = rights.isRight

		if (wallOnLeft && wallOnRight) {
			walls.addAll(lefts.getRight)
			walls.addAll(rights.getRight)
			walls.add(source)
			true
		} else if (wallOnLeft)
			flowDown(rights.getLeft) ? flowBothSides(source) : false
		else if (wallOnRight)
			flowDown(lefts.getLeft) ? flowBothSides(source) : false
		else {
			val resLeft = flowDown(lefts.getLeft)
			val resRight = flowDown(rights.getLeft)
			resLeft && resRight ? flowBothSides(source) : false
		}
	}

	// Returns the list of coordinates reached by going down until a wall,
	// was found, or Empty when the bottom was reached instead.
	//
	// Side effect : each tile reached by water is added to the water set.
	def static goDown(Coordinate source) {
		val output = newArrayList
		var next = source.otherMove(Direction.DOWN)
		while (!walls.contains(next) && next.x < maxX) {
			output.add(0, next)
			next = next.otherMove(Direction.DOWN)
		}
		water.addAll(output)
		walls.contains(next)
			? Optional.of(output)
			: {
			water.add(next)
			Optional.empty
		}
	}

	// Returns the list of coordinates reached up to reaching a wall, 
	// or the first coordinate reached with no wall beneath
	//
	// Side effect : each tile reached by water is added to the water set
	def static Either<Coordinate, List<Coordinate>> flowOneSide(Coordinate source, boolean left) {
		val reached = newArrayList
		var next = source.otherMove(left ? Direction.LEFT : Direction.RIGHT)
		while (!walls.contains(next) && walls.contains(next.otherMove(Direction.DOWN))) {
			reached.add(next)
			next = next.otherMove(left ? Direction.LEFT : Direction.RIGHT)
		}
		water.addAll(reached)
		walls.contains(next)
			? Either.fromRight(reached)
			: {
			water.add(next);
			Either.fromLeft(next)
		}
	}
}
