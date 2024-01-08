package advent2023

import adventutils.input.InputLoader
import adventutils.pathfinding.AStar
import adventutils.pathfinding.State
import java.util.HashSet
import java.util.Map
import java.util.Random
import java.util.Set

class Day25 {

	static StringState target
	static Map<StringState, Set<StringState>> connections = newHashMap

	def static void main(String[] args) {
		val lines = new InputLoader(2023, 25).inputs
		lines.forEach [
			val split = it.split(": ")
			val split1 = split.get(1).split(" ")
			split1.forEach [
				connections.merge(new StringState(split.get(0)), newHashSet(new StringState(it)))[x, y|x.addAll(y); x]
				connections.merge(new StringState(it), newHashSet(new StringState(split.get(0))))[x, y|x.addAll(y); x]
			]
		]

		val all_states = connections.keySet
		val size = all_states.size
		val stats_results = newHashMap
		val my_random = new Random;
		(0 ..< 1000).forEach [
			val fst = all_states.get(my_random.nextInt(size))
			val snd = all_states.get(my_random.nextInt(size))
			val path = getPath(fst, snd)
			if (path.size > 1)
				(0 .. path.size - 2).forEach [
					stats_results.merge(newHashSet(path.get(it), path.get(it + 1)), 1)[x, y|x + y]
				]
		]
		
		// Magic of stats: paths will be very more likely to pass through the 3 most uses links
		stats_results.entrySet.sortBy[value].reverse.take(3).forEach[
			val to_cut = it.key
			connections.get(to_cut.get(0)).remove(to_cut.get(1))
			connections.get(to_cut.get(1)).remove(to_cut.get(0))
		]
		
		val first = all_states.get(0)
		val first_half = newHashSet(first)
		val border = newHashSet(first)
		while (!border.empty) {
			val tmp = new HashSet(border)
			border.clear
			tmp.forEach[
				connections.get(it).forEach[
					if(!first_half.contains(it)) {
						first_half.add(it)
						border.add(it)
					}
				]
			]
		}
		println(first_half.size * (size - first_half.size))
	}

	def static getPath(StringState source, StringState target_) {
		target = target_
		val astar = new AStar(source)
		astar.run.minPath.map[it as StringState]
	}

	static class StringState implements State {

		String content

		new(String content_) {
			content = content_
		}

		override isGoal() {
			equals(target)
		}

		override minToGoal() {
			1
		}

		override neighbours() {
			connections.get(this).map[it -> 1]
		}

		override hashCode() {
			content.hashCode
		}

		override equals(Object other) {
			switch (other) {
				StringState: other.content.equals(content)
				default: false
			}
		}

		override toString() {
			content
		}
	}
}
