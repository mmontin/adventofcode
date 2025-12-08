package advent2025

import adventutils.collection.ListUtils
import adventutils.geometry.Triplet
import adventutils.input.InputLoader
import java.util.ArrayList
import java.util.List
import java.util.PriorityQueue
import java.util.Set

class Day8 {
	def static void main(String[] args) {
		val List<Set<Triplet>> sets = new ArrayList(new InputLoader(2025, 8).inputs.map[newHashSet(new Triplet(it))])
		val distances = ListUtils.pairs(sets, new PriorityQueue<Pair<Triplet, Triplet>> [ p1, p2 |
			p1.key.distanceTo(p1.value).compareTo(p2.key.distanceTo(p2.value))
		])[e1, e2|e1.get(0) -> e2.get(0)]

		var count = 0
		while (sets.size != 1) {
			if(count++ == 1000) println("Part 1: " + sets.map[it.size].sort.reverse.take(3).reduce[x, y|x * y])
			val left_set = (0 ..< sets.size).findFirst[sets.get(it).contains(distances.peek.key)]
			val right_set = (0 ..< sets.size).findFirst[sets.get(it).contains(distances.peek.value)]
			if (right_set != left_set) {
				sets.get(left_set).addAll(sets.get(right_set))
				sets.remove(right_set as int)
			}
			if (sets.size == 1) println("Part 2: " + distances.peek.key.x as long * distances.peek.value.x as long)
			distances.remove
		}
	}
}
