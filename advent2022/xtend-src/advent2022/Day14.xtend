package advent2022

import adventutils.geometry.Coordinate
import adventutils.geometry.Direction
import adventutils.input.InputLoader
import java.util.List
import java.util.Set

class Day14 {

	static final List<String> inputs = new InputLoader(2022, 14).inputs
	static final Set<Coordinate> rocks = newHashSet
	static final int max_depth = {
		init
		rocks.maxBy[y].y
	}
	static final Coordinate source = new Coordinate(500, 0)

	def static init() {
		rocks.clear
		inputs.forEach [ line |
			val coords = line.split(" -> ").map[new Coordinate(it)]
			(0 .. coords.size - 2).forEach [
				rocks.addAll(Coordinate.getAllCoordsOnLine(coords.get(it), coords.get(it + 1)))
			]
		]
	}

	def static void main(String[] args) {
		var i = 0
		while(flow) i ++
		println(i)
		
		init
		i = 0
		while(!rocks.contains(source)) {
			flow_with_floor
			i ++
		}
		print(i)
	}
	
	def static boolean flow() {
		var current = source
		do {
			val down = current.move(Direction.UP)
			val possibilities = newArrayList(down,down.move(Direction.LEFT),down.move(Direction.RIGHT))
			possibilities.removeAll(rocks)
			if (possibilities.size == 0) {
				rocks.add(current)
				return true
			} else
				current = possibilities.get(0)
		} while (current.y < max_depth)
		false
	}
	
	def static flow_with_floor() {
		var current = source
		do {
			val down = current.move(Direction.UP)
			val possibilities = newArrayList(down,down.move(Direction.LEFT),down.move(Direction.RIGHT))
			possibilities.removeAll(rocks)
			possibilities.removeIf[it.y > max_depth+1]
			if (possibilities.size == 0)
				rocks.add(current)
			else
				current = possibilities.get(0)
		} while (!rocks.contains(current))
	}
}
