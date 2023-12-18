package advent2022

import adventutils.geometry.Coordinate
import adventutils.geometry.Dir
import adventutils.input.InputLoader
import java.util.ArrayList
import java.util.Set

class Day9 {

	// Required for Q1: current head, tail and tail positions
	static Coordinate head = new Coordinate
	static Coordinate tail = new Coordinate
	static Set<Coordinate> tail_positions = newHashSet(tail)

	// Required for Q2: the whole rope, and tail positions
	static ArrayList<Coordinate> rope = {
		val ans = newArrayList;
		(1 .. 10).forEach[ans.add(new Coordinate)]
		ans
	}
	static Set<Coordinate> long_tail_positions = newHashSet(rope.get(9))

	def static void main(String[] args) {

		new InputLoader(2022, 9).inputs.forEach [
			val split = it.split(" ")
			val direction = Dir.directionFromString(split.get(0))
			(0 ..< Integer.parseInt(split.get(1))).forEach [ i |
				// For Q1, we move the head and then update the tail
				head = head.move(direction)
				tail = newPosition(head, tail)
				tail_positions.add(tail)
				
				// For Q2, we move the head and then update each node consecutively
				rope.set(0, rope.get(0).move(direction))
				(0 ..< 9).forEach[j|rope.set(j + 1, newPosition(rope.get(j), rope.get(j + 1)))]
				long_tail_positions.add(rope.get(9))
			]
		]

		println(tail_positions.size)
		print(long_tail_positions.size)
	}

	// There are 3 cases here, either the Manhattan distance is 2 or 3
	// in which case the tail is updated on one of the 4 direct sides of the head
	// or the distance is 4 in which case the tails remains in diagonal, but closer.
	// Otherwise, the tail remains unchanged
	def static newPosition(Coordinate _head, Coordinate _tail) {
		val distance = _head.manhattanDistanceTo(_tail)
		if (_tail.x == _head.x - 2 && distance < 4)
			new Coordinate(_head.x - 1, _head.y)
		else if (_tail.x == _head.x + 2 && distance < 4)
			new Coordinate(_head.x + 1, _head.y)
		else if (_tail.y == _head.y - 2 && distance < 4)
			new Coordinate(_head.x, _head.y - 1)
		else if (_tail.y == _head.y + 2 && distance < 4)
			new Coordinate(_head.x, _head.y + 1)
		else if (distance == 4)
			new Coordinate((_head.x + _tail.x) / 2, (_head.y + _tail.y) / 2)
		else
			_tail
	}
}
