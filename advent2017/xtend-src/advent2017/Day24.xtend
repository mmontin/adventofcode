package advent2017

import adventutils.astar.State
import java.util.Set
import java.util.List
import java.util.HashSet
import adventutils.input.InputLoader
import adventutils.astar.AStar

class Day24 {

	static final List<Pair<Integer, Integer>> elements = new InputLoader(2017, 24).getInputs [
		val split = it.split("/")
		Integer.parseInt(split.get(0)) -> Integer.parseInt(split.get(1))
	]

	static final int MAX_ELEMNT_VALUE = elements.map[it.value + it.key].max

	def static void main(String[] args) {
		println(elements.size)
		val computation = new AStar(new Bridge).run
		computation.minPath.forEach[println(it)]
		println(elements.filter[!(computation.minPath.last as Bridge).remaining.contains(it)].fold(0) [ acc, v |
			acc + v.key + v.value
		])
	}

	static class Bridge implements State {

		final Set<Pair<Integer, Integer>> remaining
		final int last_plug

		final List<Pair<State, Integer>> neighbours
		final boolean isGoal
		final int minToGoal

		final int hashCode

		new() {
			this(new HashSet(elements), 0)
		}

		new(Set<Pair<Integer, Integer>> _remaining, int _last_plug) {

			remaining = _remaining
			last_plug = _last_plug

			neighbours = newArrayList
			remaining.filter[it.key == last_plug || it.value == last_plug].forEach [
				neighbours.add(new Bridge(
					{
						val output = new HashSet(remaining)
						output.remove(it)
						output
					},
					it.key == last_plug ? it.value : it.key
				) as State -> MAX_ELEMNT_VALUE - (it.key + it.value))
			]

			isGoal = neighbours.isEmpty
			minToGoal = remaining.fold(0) [ acc, v |
				acc + MAX_ELEMNT_VALUE - (v.key + v.value)
			]

			hashCode = remaining.hashCode
		}

		override isGoal() {
			isGoal
		}

		override minToGoal() {
			minToGoal
		}

		override neighbours() {
			neighbours
		}

		override hashCode() {
			hashCode
		}

		override equals(Object other) {
			switch other {
				Bridge: other.remaining.equals(remaining) && other.last_plug == last_plug
				default: false
			}
		}

		override toString() {
			last_plug + " ; " + remaining
		}
	}
}
