package advent2018

import adventutils.Either
import adventutils.geometry.Coordinate
import adventutils.geometry.Coordinate.Direction
import adventutils.geometry.CoordinateSet
import adventutils.input.InputLoader
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
		println(water.size-2)
		walls.retainAll(water)
		println(walls.size)
	}

	def static myPrint() {
		val minX = water.minBy[x].x
		val maxX = water.maxBy[x].x
		val minY = water.minBy[y].y
		val maxY = water.maxBy[y].y
		var output = ""
		for (i : minX - 1 .. maxX + 1) {
			for (j : minY - 1 .. maxY + 1) {
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
		
		// We have reached a wall
		if (walls.contains(next)) {
			val alreadyHandled = water.contains(output.get(0))
			water.addAll(output)
			alreadyHandled ? Optional.empty : Optional.of(output)
		} else {
			water.addAll(output)
			water.add(next)
			Optional.empty
		}
	}

	// Returns the list of coordinates reached up to reaching a wall, 
	// or the first coordinate reached with no wall beneath
	//
	// Side effect : each tile reached by water is added to the water set
	def static Either<Coordinate, Set<Coordinate>> getOneSide(Coordinate source, boolean left) {
		val reached = newHashSet
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

	// Flows the water in the given direction until one of the two happens:
	// - The bottom is reached: Empty is returned
	// - The section is filled with water: coordinates reaching a wall returned
	//
	// Side effect : each tile in the section is marked as being water and
	// possibly a wall, except for the possibly empty returned set.
	def static Optional<Set<Coordinate>> flowOneSide(Coordinate source, boolean left) {
		var reached = getOneSide(source, left)
		reached.isRight
			? Optional.of(reached.getRight)
			: {
			flowDown(reached.getLeft)
				? // It's been filled so we continue flowing
			flowOneSide(source, left)
				: // It's reached bottom so we notify it
			Optional.empty

		}
	}

	// Flows the water in both directions until one of the two happens:
	// - The bottom is reached: false is returned
	// - Both sides are filled: true is returned
	//
	// Side effect : below tiles are marked as water or / and walls
	// as well as the current line in case of both walls on the sides
	def static boolean flowBothSides(Coordinate source) {

		var leftFlow = flowOneSide(source, true)
		var rightFlow = flowOneSide(source, false)

		// There are walls on both sides
		if (leftFlow.present && rightFlow.present) {
			walls.addAll(leftFlow.get)
			walls.addAll(rightFlow.get)
			walls.add(source)
			true
		} else
			false
	}
}
