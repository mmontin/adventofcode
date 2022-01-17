package advent2016.puzzle1

import adventutils.geometry.Coordinate
import adventutils.input.InputLoader
import java.util.List
import java.util.Set

class Launcher {
	
	static enum Instruction {
		R, L, A
	}
	
	static enum Direction {
		N, S, E, O
	}
	
	static final List<Direction> directions = newArrayList(Direction.N, Direction.E, Direction.S, Direction.O)
	
	static Set<Coordinate> visited = newHashSet
	
	static Coordinate position = new Coordinate(0,0)
	static Direction direction = Direction.N
	
	def static void main(String[] args) {
		
		val input = new InputLoader(2016,1).getInputReader.readLine.split(", ").toList
		
//		input.forEach[
//			it.substring(0,1).equals('R') ? turnRight : turnLeft
//			advance(Integer::parseInt(it.substring(1)))
//		]
//		
//		println(position.blocks)
		
		val steps = input.fold(newArrayList)[l , v | 
			l.add(v.substring(0,1).equals('R') ? Instruction.R : Instruction.L)
			(0..<Integer::parseInt(v.substring(1))).forEach[l.add(Instruction.A)]
			l
		]
		
		var i = 0
		while(!visited.contains(position)) {
			switch (steps.get(i)) {
				case Instruction.R : turnRight
				case Instruction.L : turnLeft
				default : {
					visited.add(position)
					advance(1)
				}
			}
			i++
		}
		println(position.manhattanDistanceToZero)
	}
	
	def static advance(int length) {
		position = switch (direction) {
			case N : position.addX(length)
			case S : position.addX(-length)
			case E : position.addY(length)
			default : position.addY(-length)
		}
	}
	
	def static turnRight() {
		val pos = directions.indexOf(direction) + 1
		direction = directions.get(pos == 4 ? 0 : pos)
	}
	
	def static turnLeft() {
		val pos = directions.indexOf(direction) - 1
		direction = directions.get(pos == -1 ? 3 : pos)
	}
}