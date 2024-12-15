package advent2024

import adventutils.geometry.Coordinate
import adventutils.geometry.Dir
import adventutils.geometry.Direction
import adventutils.input.InputLoader
import java.util.List
import java.util.Set

class Day15 {
	def static void main(String[] args) {
		val input = new InputLoader(2024, 15).inputs
		val blank = input.indexOf("")

		val max_i = blank - 1
		val max_j = input.get(0).length - 1

		var Coordinate robot
		val walls = newHashSet
		var boxes = newHashSet

		for (i : 0 .. max_i) {
			val current_line = input.get(i).toCharArray.map[it + ""]
			for (j : 0 .. max_j) {
				val current = new Coordinate(i, j)
				switch (current_line.get(j)) {
					case "@": robot = current
					case "#": walls.add(current)
					case "O": boxes.add(current)
				}
			}
		}

		val directions = input.drop(blank + 1).join.toCharArray.map[Dir.directionFromStringArrows(it + "")]

		for (d : directions)
			robot = robot.move1(d, walls, boxes)

		println(boxes.fold(0)[acc, el|acc + 100 * el.x + el.y])

		val obstacles = newHashSet
		walls.clear

		for (i : 0 .. max_i) {
			val current_line = input.get(i).toCharArray.map[it + ""]
			for (j : 0 .. max_j) {
				val current_left = new Coordinate(i, j * 2)
				val current_right = new Coordinate(i, j * 2 + 1)
				switch (current_line.get(j)) {
					case "@":
						robot = current_left
					case "#":
						walls.addAll(#{current_left, current_right})
					case "O":
						obstacles.add(new Obstacle(current_left))
				}
			}
		}

		for (d : directions)
			robot = robot.move2(d, walls, obstacles)

		println(obstacles.fold(0)[acc, el|acc + 100 * el.left.x + el.left.y])
	}

	static class Obstacle {
		Coordinate left
		Coordinate right

		new(Coordinate left_) {
			left = left_
			right = left.addY(1)
		}

		def allCoords() {
			#{left, right}
		}

		def nextCoords(Direction d) {
			switch (d) {
				case Direction.LEFT: #{left.addY(-1)}
				case Direction.RIGHT: #{right.addY(1)}
				case Direction.UP: allCoords.map[it.addX(-1)].toSet
				case Direction.DOWN: allCoords.map[it.addX(1)].toSet
			}
		}

		def move(Direction d) {
			switch (d) {
				case Direction.LEFT: {
					left = left.addY(-1)
					right = right.addY(-1)
				}
				case Direction.RIGHT: {
					right = right.addY(1)
					left = left.addY(1)
				}
				case Direction.UP: {
					left = left.addX(-1)
					right = right.addX(-1)
				}
				case Direction.DOWN: {
					left = left.addX(1)
					right = right.addX(1)
				}
			}
		}

		override toString() {
			left + " ; " + right
		}
	}

	def static move2(Coordinate robot, Direction dir, Set<Coordinate> walls, Set<Obstacle> obstacles) {
		val next_coord = robot.otherMove(dir)
		var next_coords = #{next_coord}
		val List<Obstacle> all_obstacles = newArrayList
		while (!next_coords.exists[walls.contains(it)] && next_coords.exists [ c |
			obstacles.exists[it.allCoords.contains(c)]
		]) {
			val next_coords_bis = next_coords
			val next_obstacles = obstacles.filter[o|next_coords_bis.exists[o.allCoords.contains(it)]]
			all_obstacles.addAll(next_obstacles)
			next_coords = next_obstacles.fold(newHashSet)[acc, o|acc.addAll(o.nextCoords(dir)); acc]
		}
		if (next_coords.exists[walls.contains(it)]) {
			robot
		} else {
			all_obstacles.forEach[move(dir)]
			next_coord
		}
	}

	def static move1(Coordinate robot, Direction dir, Set<Coordinate> walls, Set<Coordinate> boxes) {
		switch (next_coord : robot.otherMove(dir)) {
			case walls.contains(next_coord):
				robot
			case boxes.contains(next_coord): {
				val box_line = newHashSet(next_coord)
				var next_box = next_coord.otherMove(dir)
				while (boxes.contains(next_box)) {
					box_line.add(next_box)
					next_box = next_box.otherMove(dir)
				}
				if (walls.contains(next_box))
					robot
				else {
					boxes.remove(next_coord)
					boxes.add(next_box)
					next_coord
				}
			}
			default:
				next_coord
		}
	}
}
