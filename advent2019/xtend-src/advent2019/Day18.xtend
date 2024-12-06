package advent2019

import adventutils.geometry.Coordinate
import adventutils.input.InputLoader
import adventutils.pathfinding.AStar
import adventutils.pathfinding.State
import java.util.HashSet
import java.util.List
import java.util.Map
import java.util.Set

class Day18 {

	static final List<List<Character>> inputs = new InputLoader(2019, 18).inputs.map[toCharArray.toList]
	static final int rows = inputs.size
	static final int cols = inputs.get(0).size
	static Coordinate start
	static final Map<Coordinate, Character> keys = newHashMap
	static final Map<Coordinate, Character> doors = newHashMap
	static final Set<Coordinate> free = {
		val ans = newHashSet
		var List<Character> current_line
		var Coordinate current_coord
		for (i : 0 .. rows - 1) {
			current_line = inputs.get(i)
			for (j : 0 .. cols - 1) {
				current_coord = new Coordinate(i, j)
				switch (c : current_line.get(j)) {
					case (c + '').equals('.'):
						ans.add(current_coord)
					case (c + '').equals('@'): {
						start = current_coord
						ans.add(current_coord)
					}
					case Character.isLowerCase(c): {
						keys.put(current_coord, c)
						ans.add(current_coord)
					}
					case Character.isUpperCase(c):
						doors.put(current_coord, c)
				}
			}
		}
		ans
	}

	def static void main(String[] args) {
		val runner = new AStar(new MyState(start, newHashSet))
//		val runner = new AStar(new MapState(start, keys.keySet))
		runner.run
		println(runner.run.minDistance)
	}

	static class MyState extends Coordinate implements State {

		Set<Character> current_keys

		new(Coordinate c, Set<Character> current_keys_) {
			super(c)
			current_keys = current_keys_
		}

		override toString() {
			"[" + super.toString + " ; " + current_keys + "]"
		}

		override hashCode() {
			super.hashCode * current_keys.hashCode
		}

		override equals(Object other) {
			val otherState = other as MyState
			super.equals(otherState) && current_keys.equals(otherState.current_keys)
		}

		override isGoal() {
			current_keys.size.equals(keys.size)
		}

		override minToGoal() {
			keys.size - current_keys.size
		}

		override neighbours() {
			val output = newHashSet
			super.noDiagonalUnboundedNeighbours.forEach [
				val next_keys = new HashSet(current_keys)
				if (keys.containsKey(it)) {
					next_keys.add(keys.get(it))
					output.add(new MyState(it, next_keys) -> 1)
				} else if (free.contains(it))
					output.add(new MyState(it, next_keys) -> 1)
				else if (doors.containsKey(it) && current_keys.exists[k|doors.get(it).equals(Character.toUpperCase(k))]) {
					output.add(new MyState(it, next_keys) -> 1)
				}
			]
			output
		}

	}

//	static class MapState implements State {
//
//		Coordinate current_pos
//		Set<Character> remaining_keys
//
//		Set<Pair<? extends State, Integer>> neighbours_
//		Set<Coordinate> available
//
//		new(Coordinate current_pos_, Set<Character> remaining_keys_) {
//			current_pos = current_pos_
//			remaining_keys = remaining_keys_
//			neighbours_ = null
//			available = null
//		}
//
//		override toString() {
//			"[" + current_pos.toString + " ; " + remaining_keys.toString + "]"
//		}
//
//		override hashCode() {
//			current_pos.hashCode * remaining_keys.hashCode
//		}
//
//		override equals(Object other) {
//			(other as MapState).current_pos.equals(current_pos) &&
//				(other as MapState).remaining_keys.equals(remaining_keys)
//		}
//
//		override isGoal() {
//			remaining_keys.empty
//		}
//
//		def void computeAvailable() {
//			if (available === null) {
//				available = newHashSet
//				available.addAll(free)
//				val found_keys = new HashSet(keys.keySet)
//				found_keys.removeAll(remaining_keys)
//				found_keys.forEach [
//					available.add(doors.get(Character.toUpperCase(it)))
//				]
//			}
//		}
//
//		override minToGoal() {
//			remaining_keys.size
//		}
//
//		override neighbours() {
//			if (neighbours_ === null) {
//				val time = System.currentTimeMillis
//				computeAvailable
//				val runner = new AStar(new MyCoordinate(current_pos, available))
//				try
//					runner.run
//				catch (NotInitializedException nie) {
//					neighbours_ = newHashSet
//					neighbours_.addAll(remaining_keys.map [
//						val next_coord = keys.get(it)
//						val next_length = runner.gScore.get(next_coord)
//						val next_remaining = newHashSet
//						next_remaining.addAll(remaining_keys)
//						next_remaining.remove(it)
//						new MapState(next_coord, next_remaining) as State -> next_length
//					].filter[it.value !== null])
//				}
//				println(System.currentTimeMillis - time + " ms")
//			}
//			neighbours_
//		}
//
//		static class MyCoordinate extends Coordinate implements State {
//
//			Set<Coordinate> available
//
//			new(Coordinate c, Set<Coordinate> available_) {
//				super(c)
//				available = available_
//			}
//
//			override isGoal() {
//				false
//			}
//
//			override minToGoal() {
//				0
//			}
//
//			override neighbours() {
//				this.noDiagonalFilteredNeighbours(available).map[new MyCoordinate(it, available) -> 1]
//			}
//
//		}
//	}
}
