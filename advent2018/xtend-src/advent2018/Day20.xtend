package advent2018

import adventutils.geometry.Coordinate
import adventutils.input.InputLoader
import adventutils.pathfinding.AStar
import adventutils.pathfinding.NotInitializedException
import adventutils.pathfinding.State
import java.util.List
import java.util.Set
import java.util.Stack

class Day20 {

	def static void main(String[] args) {

		val MyCoordinate start = new MyCoordinate(0, 0)

		val List<MyCoordinate> discovered = newArrayList(start)

		val Stack<Set<MyCoordinate>> current_stack = new Stack
		current_stack.push(newHashSet(start))

		new InputLoader(2018, 20).inputs.get(0).toCharArray.map[it + ''].forEach [ s |
			switch (s) {
				case "(": {
					val new_last = newHashSet
					new_last.addAll(current_stack.peek)
					current_stack.push(new_last)
				}
				case "|": {
					val last = current_stack.pop
					val before_last = current_stack.pop
					current_stack.push(last)
					current_stack.push(before_last)
				}
				case ")": {
					val last = current_stack.pop
					current_stack.peek.addAll(last)
				}
				default: {
					val direction = Coordinate.directionFromPole(s)
					val next_coords = newHashSet
					current_stack.pop.forEach [ c |
						val next_coord = c.otherMove(direction)
						val index = discovered.indexOf(next_coord)
						val my_next_coord = index == -1
								? {
								val tmp = new MyCoordinate(next_coord.x, next_coord.y)
								discovered.add(tmp)
								tmp
							}
								: discovered.get(index)
						my_next_coord.addFriend(c)
						next_coords.add(my_next_coord)
					]
					current_stack.push(next_coords)
				}
			}
		]
		println(discovered.size)

		val AStar searcher = new AStar(start)
		try
			searcher.run
		catch (NotInitializedException _) // Throws this exception when all states are done since none is the goal
			println(searcher.gScore.values.max)
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

		override toString() {
			super.toString + " : " + friends.size
		}
	}
}
