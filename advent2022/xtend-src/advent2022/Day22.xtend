package advent2022

import adventutils.geometry.Coordinate
import adventutils.geometry.Dir
import adventutils.geometry.Direction
import adventutils.input.InputLoader
import java.util.List
import java.util.Map

class Day22 {

	static final List<String> inputs = new InputLoader(2022, 22).inputs

	static final Map<Coordinate, Boolean> tiles = {
		val output = newHashMap;
		(0 .. inputs.size - 3).forEach [ i |
			val line = inputs.get(i).toCharArray;
			(0 .. line.size - 1).forEach [ j |
				if (line.get(j).toString.equals("#"))
					output.put(new Coordinate(i + 1, j + 1), false)
				else if (line.get(j).toString.equals("."))
					output.put(new Coordinate(i + 1, j + 1), true)
			]
		]
		output
	}
	
	static final int face = 50
	static final int double_face = 2 * face
	static final int triple_face = 3 * face
	static final int quadruple_face = 4 * face

	static final List<String> movements = {
		val output = newArrayList
		val line = inputs.get(inputs.size - 1)
		line.split("L").forEach [ subL |
			subL.split("R").forEach [ subR |
				output.add(subR)
				output.add("R")
			]
			output.remove(output.size - 1)
			output.add("L")
		]
		output.remove(output.size - 1)
		output
	}

	def static nextPosition(Coordinate current_position, Direction current_orientation) {
		var next_position = current_position.otherMove(current_orientation)
		if (!tiles.containsKey(next_position)) {
			next_position = switch current_orientation {
				case RIGHT: tiles.keySet.filter[x == current_position.x].minBy[y]
				case LEFT: tiles.keySet.filter[x == current_position.x].maxBy[y]
				case UP: tiles.keySet.filter[y == current_position.y].maxBy[x]
				case DOWN: tiles.keySet.filter[y == current_position.y].minBy[x]
			}
		}
		next_position
	}

	def static nextPosition2(Pair<Coordinate, Direction> full_position) {
		val current_position = full_position.key
		val current_orientation = full_position.value
		var next_position = current_position.otherMove(current_orientation)
		if (!tiles.containsKey(next_position)) {
			// Here there's gonna be 14 cases for the 14 edges of the cube
			// that need to be glued together. The conditions could be made simpler
			// but knowing exactly which ones are irrelevant is cumbersome and can
			// very easily lead to errors so might as well put them all down, as
			// it is still instantaneous regardless. 
			// A1
			if (
				next_position.y == double_face + 1 && 
				next_position.x >= face + 1 && 
				next_position.x <= double_face &&
				current_orientation == Direction.RIGHT
				) new Coordinate(face, next_position.x + face) -> Direction.UP
			// A2
			else if (
				next_position.x == face + 1 && 
				next_position.y >= double_face + 1 &&
				next_position.y <= triple_face &&
				current_orientation == Direction.DOWN
			) new Coordinate(next_position.y - face, double_face) -> Direction.LEFT
			// B1
			else if (
				next_position.y == triple_face + 1 &&
				next_position.x >= 1 &&
				next_position.x <= face &&
				current_orientation == Direction.RIGHT
			) new Coordinate(triple_face + 1 - next_position.x, double_face) -> Direction.LEFT
			// B2
			else if (
				next_position.y == double_face + 1 && 
				next_position.x >= double_face + 1 &&
				next_position.x <= triple_face &&
				current_orientation == Direction.RIGHT
			) new Coordinate(face + 1 - (next_position.x - double_face), triple_face) -> Direction.LEFT
			// C1
			else if (
				next_position.x == 0 && 
				next_position.y >= double_face + 1 &&
				next_position.y <= triple_face &&
				current_orientation == Direction.UP
			) new Coordinate(quadruple_face, next_position.y - double_face) -> Direction.UP
			// C2
			else if (
				next_position.x == quadruple_face + 1 &&
				next_position.y >= 1 &&
				next_position.y <= face &&
				current_orientation == Direction.DOWN
			) new Coordinate(1, next_position.y + double_face) -> Direction.DOWN
			// D1
			else if (
				next_position.y == face + 1 &&
				next_position.x >= triple_face + 1 &&
				next_position.x <= quadruple_face && 
				current_orientation == Direction.RIGHT
			) new Coordinate(triple_face, next_position.x - double_face) -> Direction.UP
			// D2
			else if (
				next_position.x == triple_face + 1 &&
				next_position.y >= face + 1 &&
				next_position.y <= double_face && 
				current_orientation == Direction.DOWN
			) new Coordinate(next_position.y + double_face, face) -> Direction.LEFT
			// E1
			else if (
				next_position.y == face && 
				next_position.x >= face + 1 && 
				next_position.x <= double_face &&
				current_orientation == Direction.LEFT
			) new Coordinate(double_face + 1, next_position.x - face) -> Direction.DOWN
			// E2
			else if (
				next_position.x == double_face &&
				next_position.y >= 1 &&
				next_position.y <= face &&
				current_orientation == Direction.UP
			) new Coordinate(next_position.y + face, face + 1) -> Direction.RIGHT
			// F1
			else if (
				next_position.y == 0 &&
				next_position.x >= double_face + 1 && 
				next_position.x <= triple_face &&
				current_orientation == Direction.LEFT
			) new Coordinate(face + 1 - (next_position.x - double_face), face + 1) -> Direction.RIGHT
			// F2
			else if (
				next_position.y == face &&
				next_position.x >= 1 &&
				next_position.x <= face &&
				current_orientation == Direction.LEFT
			) new Coordinate(triple_face + 1 - next_position.x, 1) -> Direction.RIGHT
			// G1
			else if (
				next_position.x == 0 &&
				next_position.y >= face + 1 &&
				next_position.y <= double_face &&
				current_orientation == Direction.UP
			) new Coordinate(next_position.y + double_face, 1) -> Direction.RIGHT
			// G2
			else if (
				next_position.y == 0 &&
				next_position.x >= triple_face + 1 &&
				next_position.x <= quadruple_face &&
				current_orientation == Direction.LEFT
			) new Coordinate(1, next_position.x - double_face) -> Direction.DOWN
		} else
			next_position -> current_orientation
	}

	def static void main(String[] args) {
		var current_position = tiles.filter[k, v|k.x == 1 && v].keySet.minBy[y]
		var current_orientation = Direction.RIGHT

		var current_full_position = current_position -> current_orientation
		for (s : movements) {
			switch s {
				case "L": {
					current_orientation = Dir.counterClockWise(current_orientation)
					current_full_position = current_full_position.key ->
						Dir.counterClockWise(current_full_position.value)
				}
				case "R": {
					current_orientation = Dir.clockWise(current_orientation)
					current_full_position = current_full_position.key ->
						Dir.clockWise(current_full_position.value)
				}
				default: {
					val steps = Integer.parseInt(s)
					var i = steps
					var next_position = nextPosition(current_position, current_orientation)
					while (i != 0 && tiles.get(next_position)) {
						i--
						current_position = next_position
						next_position = nextPosition(current_position, current_orientation)
					}

					i = steps
					var next_full_position = nextPosition2(current_full_position)
					while (i != 0 && tiles.get(next_full_position.key)) {
						i--
						current_full_position = next_full_position
						next_full_position = nextPosition2(current_full_position)
					}
				}
			}
		}
		println(current_position.x * 1000 + 4 * current_position.y + Dir.directionValue(current_orientation))
		println(current_full_position.key.x * 1000 + 4 * current_full_position.key.y +
			Dir.directionValue(current_full_position.value))
	}
}
