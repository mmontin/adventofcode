package advent2017

import adventutils.geometry.Coordinate

class Day3 {

	static final int input = 361527

	def static void main(String[] args) {

		var int layer = 0
		var int blocks = 0
		while (input > blocks)
			blocks = Math.pow(2*(layer++)+1,2) as int

		layer -- 
		val prev = (2*(layer-1)+1)*(2*(layer-1)+1)
		
		val dist1 = Math.abs(input-(prev+layer))
		val dist2 = Math.abs(input-(prev+3*layer))
		val dist3 = Math.abs(input-(prev+5*layer))
		val dist4 = Math.abs(input-(prev+7*layer))

		println(Math.min(dist1,Math.min(dist2,Math.min(dist3,dist4)))+layer)

		val coordinates = newHashMap
		var currentPosition = new Coordinate
		coordinates.put(currentPosition, 1)
		var currentDirection = Direction.RIGHT
		do {
			currentPosition = currentPosition.move(currentDirection)
			val neighbours = currentPosition.allAroundFilteredNeighbours(coordinates.keySet)
			coordinates.put(currentPosition, neighbours.fold(0)[acc, e|acc + coordinates.get(e)])
			if (neighbours.size <= 2) currentDirection = currentDirection.next
		} while (coordinates.get(currentPosition) < input)
		
		print(coordinates.get(currentPosition))
	}

	static enum Direction {
		UP,
		DOWN,
		LEFT,
		RIGHT
	}

	def static Direction next(Direction d) {
		switch d {
			case UP: Direction.LEFT
			case LEFT: Direction.DOWN
			case DOWN: Direction.RIGHT
			case RIGHT: Direction.UP
		}
	}

	def static Coordinate move(Coordinate c, Direction d) {
		switch d {
			case UP: c.addY(1)
			case DOWN: c.addY(-1)
			case RIGHT: c.addX(1)
			case LEFT: c.addX(-1)
		}
	}
}
