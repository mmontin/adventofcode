package advent2018

import adventutils.geometry.Coordinate
import adventutils.input.InputLoader
import adventutils.pathfinding.State
import java.util.List
import java.util.Set

class Day20 {

	static List<MyCoordinate> discovered = newArrayList
	static String input = new InputLoader(2018, 20).inputs.get(0)

	def static void main(String[] args) {
		val start = new MyCoordinate(0, 0)
		discovered.add(start)
		populate(start -> 0)
		println(discovered.size)
	}

	def static Pair<MyCoordinate, Integer> populate(Pair<MyCoordinate, Integer> pair) {
		if (pair.value >= input.length)
			pair
		else
			switch (s : input.charAt(pair.value) + "") {
				case "(":
					populate(populate(pair.key -> pair.value + 1))
				case "|":
					populate(populate(pair.key -> pair.value + 1))
				case ")":
					pair.key -> pair.value + 1
				default: {
					val direction = Coordinate.directionFromPole(s)
					val next_coord = pair.key.otherMove(direction)
					val index = discovered.indexOf(next_coord)
					val my_next_coord = index == -1
							? {
							val tmp = new MyCoordinate(next_coord.x, next_coord.y)
							discovered.add(tmp)
							tmp
						}
							: discovered.get(index)
					my_next_coord.addFriend(pair.key)
					populate(my_next_coord -> pair.value + 1)
				}
			}
	}

	static class MyCoordinate extends Coordinate implements State {

		Set<MyCoordinate> friends

		new(int x, int y) {
			super(x, y)
			friends = newHashSet
		}

		override isGoal() {
			false
		}

		override minToGoal() {
			1
		}

		def addFriend(MyCoordinate other) {
			if(friends.add(other)) other.friends.add(this)
		}

		override neighbours() {
			friends.map[x|x as State -> 1]
		}
	}
}
