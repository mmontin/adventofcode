package advent2018

import adventutils.geometry.Coordinate
import adventutils.geometry.Dir
import adventutils.geometry.Direction
import adventutils.input.InputLoader
import java.util.Map
import java.util.Set

class Day13 {

	static final Map<Coordinate, String> terrain = newHashMap
	static final Set<Robot> robots = newHashSet

	static class Robot {

		public Coordinate position
		Direction facing
		Direction next_direction

		new(Coordinate _position, Direction _facing) {
			position = _position
			facing = _facing
			next_direction = Direction.LEFT
		}

		def turn() {
			switch (next_direction) {
				case LEFT: {
					facing = Dir.counterClockWise(facing)
					next_direction = Direction.UP
				}
				case RIGHT: {
					facing = Dir.clockWise(facing)
					next_direction = Direction.LEFT
				}
				default:
					next_direction = Direction.RIGHT
			}
		}

		def move() {
			position = position.otherMove(facing)
			switch (terrain.get(position)) {
				case "+":
					turn
				case "/":
					facing = switch facing {
						case UP: Direction.RIGHT
						case RIGHT: Direction.UP
						case LEFT: Direction.DOWN
						case DOWN: Direction.LEFT
					}
				case "\\":
					facing = switch facing {
						case UP: Direction.LEFT
						case LEFT: Direction.UP
						case RIGHT: Direction.DOWN
						case DOWN: Direction.RIGHT
					}
				default: {
				}
			}
		}

		override toString() {
			position.toString + " ; facing " + facing + " ; next_turn : " + next_direction
		}
	}

	// this returns the robot of the first collision, if any, and stops there
	def static tick() {
		robots.sortBy[position.toString].findFirst [
			it.move
			robots.exists[other|other != it && other.position.equals(it.position)]
		]
	}

	// this does the whole tick, while removing colliding carts
	def static wholeTick() {
		robots.sortBy[position.toString].forEach [
			// It might have been removed
			if (robots.contains(it)) {
				it.move
				val other = robots.findFirst[other|other != it && other.position.equals(it.position)]
				if (other !== null) {
					robots.remove(it)
					robots.remove(other)
				}
			}
		]
	}
	
	def static init() {
		robots.clear
		terrain.clear
		val input = new InputLoader(2018, 13).inputs.map[toCharArray.map[toString]]
		val max_x = input.size - 1
		val max_y = input.get(0).size - 1
		(0 .. max_x).forEach [ i |
			(0 .. max_y).forEach [ j |
				val current = new Coordinate(i, j)
				switch (x : input.get(i).get(j)) {
					case " ": {
					}
					case "<": {
						robots.add(new Robot(current, Direction.LEFT))
						terrain.put(current, "-")
					}
					case ">": {
						robots.add(new Robot(current, Direction.RIGHT))
						terrain.put(current, "-")
					}
					case "v": {
						robots.add(new Robot(current, Direction.DOWN))
						terrain.put(current, "|")
					}
					case "^": {
						robots.add(new Robot(current, Direction.UP))
						terrain.put(current, "|")
					}
					default:
						terrain.put(current, x)
				}
			]
		]
	}

	def static void main(String[] args) {
		init
		var Robot first_collision = null
		while (first_collision === null)
			first_collision = tick
		println(first_collision.position.y + "," + first_collision.position.x)
		
		init
		while (robots.size != 1)
			wholeTick
		println(robots.head.position.y + "," + robots.head.position.x)
	}
}
