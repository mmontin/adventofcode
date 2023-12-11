package advent2017

import adventutils.pathfinding.State
import java.util.Set
import java.util.List
import java.util.HashSet
import adventutils.input.InputLoader
import adventutils.pathfinding.AStar

class Day24 {

	static final List<Element> elements = new InputLoader(2017, 24).getInputs [
		val split = it.split("/")
		new Element(Integer.parseInt(split.get(0)), Integer.parseInt(split.get(1)))
	]

	static boolean round1 = true

	def static void main(String[] args) {
		val computation = new AStar(new Bridge).run
		println(elements.filter[!(computation.minPath.last as Bridge).remaining.contains(it)].fold(0) [ acc, v |
			acc + v.weight
		])

		round1 = false
		computation.initialize(new Bridge)
		computation.run
		println(elements.filter[!(computation.minPath.last as Bridge).remaining.contains(it)].fold(0) [ acc, v |
			acc + v.weight
		])
	}

	static class Element {

		int left
		int right

		new(int _left, int _right) {
			left = _left
			right = _right
		}

		def weight() {
			left + right
		}

		def connectsWithPort(int port) {
			left == port || right == port
		}

		def connectsWithOther(Element other) {
			connectsWithPort(other.left) || connectsWithPort(other.right)
		}

		def accessibleFrom(Set<Element> others) {
			others.exists[it.connectsWithOther(this)]
		}

		def otherPort(int port) {
			left == port ? right : left
		}

		override hashCode() {
			left * right
		}

		override equals(Object other) {
			switch other {
				Element: other.left == left && other.right == right
				default: false
			}
		}

		override toString() {
			"[ " + left + " , " + right + " ]"
		}
	}

	static class Bridge implements State {

		final Set<Element> remaining
		final int last_plug

		final Iterable<Pair<? extends State, Integer>> neighbours
		final boolean isGoal
		final int minToGoal

		final int hashCode

		new() {
			this(new HashSet(elements), 0)
		}

		new(Set<Element> _remaining, int _last_plug) {

			remaining = _remaining
			last_plug = _last_plug

			neighbours = remaining.filter[connectsWithPort(last_plug)].map [
				new Bridge(
					{
						val output = new HashSet(remaining)
						output.remove(it)
						output
					},
					it.otherPort(last_plug)
				) -> 0
			]

			isGoal = neighbours.isEmpty

			val accessible = newHashSet(new Element(last_plug, last_plug))
			val to_try = new HashSet(remaining)
			var next_accessible = to_try.findFirst[it.accessibleFrom(accessible)]
			while (next_accessible !== null) {
				accessible.add(next_accessible)
				to_try.remove(next_accessible)
				next_accessible = to_try.findFirst[it.accessibleFrom(accessible)]
			}

			minToGoal = to_try.fold(0)[acc, v|acc + v.weight] + (round1 ? 0 : to_try.size * 1000)

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
