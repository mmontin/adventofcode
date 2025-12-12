package advent2019

import adventutils.geometry.Coordinate
import adventutils.input.InputLoader
import adventutils.pathfinding.AStar
import adventutils.pathfinding.NotInitializedException
import adventutils.pathfinding.State
import java.util.HashMap
import java.util.List
import java.util.Map
import java.util.Set

class Day20 {

	static final Map<Coordinate, Coordinate> bridges = newHashMap
	static final Set<Coordinate> available = newHashSet
	static final HashMap<Coordinate, HashMap<Coordinate, Integer>> connexions = newHashMap
	static final Set<Coordinate> outers = newHashSet

	def static void main(String[] args) {

		val List<Pair<Set<Coordinate>, Set<String>>> letters = newArrayList

		new InputLoader(2019, 20).applyOnGrid [ s, c |
			switch s {
				case ".":
					available.add(c)
				case " ":
					true
				case "#":
					true
				default: {
					val location = letters.findFirst[it.key.exists[c.noDiagonalUnboundedNeighbours.contains(it)]]
					if (location === null)
						letters.add(newHashSet(c) -> newHashSet(s))
					else {
						location.key.add(c)
						location.value.add(s)
					}
				}
			}
		]

		letters.forEach [ l |
			val closest = available.findFirst [ c |
				c.noDiagonalUnboundedNeighbours.exists[l.key.contains(it)]
			]
			l.key.clear
			l.key.add(closest)
		]

		val pairs = letters.fold(newHashMap) [ acc, el |
			acc.merge(el.value, el.key)[x, y|x.addAll(y); x]
			acc
		]


		val all_points_of_interest = pairs.values.fold(newArrayList)[acc, el|acc.addAll(el); acc]
		val minX = all_points_of_interest.minBy[x].x
		val maxX = all_points_of_interest.maxBy[x].x
		val minY = all_points_of_interest.minBy[y].y
		val maxY = all_points_of_interest.maxBy[y].y

		all_points_of_interest.forEach [
			if (it.x == minX || it.x == maxX || it.y == minY || it.y == maxY)
				outers.add(it)
		]
		
		val start = pairs.remove(newHashSet("A")).get(0)
		val finish = pairs.remove(newHashSet("Z")).get(0)

		pairs.values.forEach[bridges.put(it.get(0), it.get(1)); bridges.put(it.get(1), it.get(0))]

		println("Part 1: " + new AStar(new Square(start, finish, true)).run.minDistance)


		for (i : 0 ..< all_points_of_interest.size) {
			for (j : i + 1 ..< all_points_of_interest.size) {
				val c1 = all_points_of_interest.get(i)
				val c2 = all_points_of_interest.get(j)
				try {
					val dist = new AStar(new Square(c1, c2, false)).run.minDistance
					connexions.merge(c1, newHashMap(c2 -> dist))[m1, m2|m1.putAll(m2); m1]
					connexions.merge(c2, newHashMap(c1 -> dist))[m1, m2|m1.putAll(m2); m1]
				} catch (NotInitializedException nie) {
				}
			}
		}

		connexions.entrySet.forEach[it.value.remove(start)]

		println("Part 2: " + new AStar(new QuantumSquare(start, finish, 0)).run.minDistance)
	}

	static class QuantumSquare implements State {

		Coordinate current
		int current_level
		Coordinate goal

		new(Coordinate current_, Coordinate goal_, int current_level_) {
			current = current_
			current_level = current_level_
			goal = goal_
		}

		override isGoal() {
			current == goal && current_level == 0
		}

		override minToGoal() {
			current_level + 1
		}

		override neighbours() {

			val jumps = newArrayList

			val jump = bridges.get(current)
			if (jump !== null)
				jumps.add(new QuantumSquare(jump, goal, current_level + (outers.contains(current) ? -1 : 1)) -> 1)

			// Regular neighbours from the same level. We always add them if they are inners.
			// Otherwise, we only add the goal if we are level 0. If not, we add all the other outers
			// except the goal.
			val connexion = connexions.get(current)
			if (connexion !== null)
				connexion.entrySet.fold(jumps) [ acc, entry |
					if (!outers.contains(entry.key) || (current_level != 0).xor(entry.key == goal))
						acc.add(new QuantumSquare(entry.key, goal, current_level) -> entry.value)
					acc
				]
			else
				jumps
		}

		override hashCode() {
			current.hashCode + current_level.hashCode
		}

		override equals(Object other) {
			switch other {
				QuantumSquare: other.current == current && other.current_level == current_level
				default: false
			}
		}

		override toString() {
			current.toString + " ; " + current_level
		}
	}

	static class Square implements State {

		Coordinate current
		Coordinate goal
		boolean take_bridges

		new(Coordinate current_, Coordinate goal_, boolean take_bridges_) {
			current = current_
			goal = goal_
			take_bridges = take_bridges_
		}

		override isGoal() {
			current == goal
		}

		override minToGoal() {
			1
		}

		override neighbours() {
			val jump = bridges.get(current)
			val neigh = current.noDiagonalFilteredNeighbours(available).toList
			if(take_bridges && jump !== null) neigh.add(jump)
			neigh.map[new Square(it, goal, take_bridges) -> 1]
		}

		override hashCode() {
			current.hashCode
		}

		override equals(Object other) {
			switch other {
				Square: other.current == current
				default: false
			}
		}
	}
}
