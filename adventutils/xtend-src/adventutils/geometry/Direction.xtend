package adventutils.geometry

import java.util.Set

enum Direction {
	UP,
	DOWN,
	LEFT,
	RIGHT
}

class Dir {

	def static Set<Direction> allDirections() {
		newHashSet(Direction.DOWN, Direction.UP, Direction.RIGHT, Direction.LEFT)
	}

	def static Direction fromLeftRight(String s) {
		switch s {
			case "<": Direction.LEFT
			default: Direction.RIGHT
		}
	}

	def static Direction directionFromPole(String s) {
		switch s {
			case "N": Direction.UP
			case "S": Direction.DOWN
			case "W": Direction.LEFT
			default: Direction.RIGHT
		}
	}

	def static Direction opposite(Direction d) {
		switch d {
			case UP: Direction.DOWN
			case LEFT: Direction.RIGHT
			case DOWN: Direction.UP
			case RIGHT: Direction.LEFT
		}
	}

	def static Direction directionFromString(String s) {
		switch s {
			case "U": Direction.UP
			case "D": Direction.DOWN
			case "L": Direction.LEFT
			default: Direction.RIGHT
		}
	}
	
	def static Direction directionFromStringNb(String s) {
		switch s {
			case "0": Direction.RIGHT
			case "1": Direction.DOWN
			case "2": Direction.LEFT
			case "3": Direction.UP
		}
	}

	def static Direction nextDirection(Direction d) {
		switch d {
			case UP: Direction.LEFT
			case LEFT: Direction.DOWN
			case DOWN: Direction.RIGHT
			case RIGHT: Direction.UP
		}
	}

	def static Direction clockWise(Direction d) {
		switch d {
			case UP: Direction.RIGHT
			case RIGHT: Direction.DOWN
			case DOWN: Direction.LEFT
			case LEFT: Direction.UP
		}
	}

	def static Direction directionFromStringArrows(String s) {
		switch s {
			case "^": Direction.UP
			case "v": Direction.DOWN
			case ">": Direction.RIGHT
			default : Direction.LEFT
		}
	}

	def static Direction counterClockWise(Direction d) {
		d.nextDirection
	}

	def static int directionValue(Direction d) {
		switch d {
			case UP: 3
			case RIGHT: 0
			case DOWN: 1
			case LEFT: 2
		}
	}
}
