package advent2018

import adventutils.geometry.Coordinate
import adventutils.geometry.Dir
import adventutils.input.InputLoader
import adventutils.pathfinding.AStar
import adventutils.pathfinding.NotInitializedException
import adventutils.pathfinding.State
import java.util.HashSet
import java.util.Map
import java.util.Set
import java.util.Stack

class Day20 {

	static final Coordinate start = new Coordinate(0, 0)
	static final Map<Coordinate, Set<Coordinate>> adjacency = newHashMap(start -> newHashSet)

	def static void main(String[] args) {

		val Stack<Set<Coordinate>> current_stack = new Stack
		current_stack.push(newHashSet(start))

		new InputLoader(2018, 20).inputs.get(0).toCharArray.map[it + ''].forEach [ s |
			switch (s) {
				case "(": {
					// we keep at the top the parent state
					val current = current_stack.peek
					// We push an empty set representing the reachable coordinates in all the branches
					current_stack.push(newHashSet)
					// We push a copy of the parent state, to be used by the first branch
					current_stack.push(new HashSet(current))
				}
				case "|": {
					// We get rid of the current branch, treated coordinates and parent branch
					val current_branch = current_stack.pop
					val already_treated = current_stack.pop
					val before_branching = current_stack.pop
					// We push the parent branch back
					current_stack.push(before_branching)
					// We add the current branch to the treated values and push it
					already_treated.addAll(current_branch)
					current_stack.push(already_treated)
					// We push a copy of the parent state, to be used by the next branch
					current_stack.push(new HashSet(before_branching))
				}
				case ")": {
					// We get rid of the current branch, treated coordinates and parent branch
					val current_branch = current_stack.pop
					val already_treated = current_stack.pop
					current_stack.pop
					// We add the current branch to the treated values and push it
					already_treated.addAll(current_branch)
					current_stack.push(already_treated)
				}
				default: {
					val direction = Dir.directionFromPole(s)
					val next_coords = newHashSet
					current_stack.pop.forEach [ c |
						val next_coord = c.move(direction)
						if(!adjacency.containsKey(next_coord)) adjacency.put(next_coord, newHashSet)
						adjacency.get(c).add(next_coord)
						adjacency.get(next_coord).add(c)
						next_coords.add(next_coord)
					]
					current_stack.push(next_coords)
				}
			}
		]

		val AStar searcher = new AStar(new MyCoordinate(start))
		try
			searcher.run
		catch (NotInitializedException _) { // Throws this exception when all states are done since none is the goal
			println(searcher.gScore.values.max)
			println(searcher.gScore.values.filter[it >= 1000].size)
		}
	}

	static class MyCoordinate extends Coordinate implements State {

		new(Coordinate c) {
			super(c)
		}

		override isGoal() {
			false
		}

		override minToGoal() {
			1
		}

		override neighbours() {
			adjacency.get(this).map[x|new MyCoordinate(x) -> 1]
		}
	}
}
