package advent2022

import java.util.Set
import adventutils.geometry.Triplet
import java.util.HashSet
import adventutils.input.InputLoader

class Day18 {

	static final Set<Triplet> elements = new HashSet(
		new InputLoader(2022, 18).inputs.map[new Triplet(it)]
	)

	static final int min_value = -1
	static final int max_value = 22

	def static void main(String[] args) {

		val toVisit = newHashSet(new Triplet(min_value, min_value, min_value))
		val exterior = newHashSet
		while (!toVisit.isEmpty) {
			val current = toVisit.head
			toVisit.remove(current)
			exterior.add(current)
			val neighbours = current.face_neighbours.filter [
				!exterior.contains(it) && !elements.contains(it) && !toVisit.contains(it) && it.x >= min_value &&
					it.x <= max_value && it.y >= min_value && it.y <= max_value && it.z >= min_value &&
					it.z <= max_value
			]
			toVisit.addAll(neighbours)
		}

		println(elements.fold(0->0) [ acc, triplet |
			val current_neighbours = triplet.face_neighbours
			acc.key + current_neighbours.reject[elements.contains(it)].size ->
			acc.value + current_neighbours.filter[exterior.contains(it)].size
		])
	}
}
