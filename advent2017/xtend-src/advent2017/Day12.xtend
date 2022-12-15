package advent2017

import adventutils.input.InputLoader

class Day12 {
	
	def static void main(String[] args) {
		
		val sets = newArrayList
		
		new InputLoader(2017,12).inputs.forEach[
			val split = it.split(" <-> ")
			val currentSet = newHashSet
			currentSet.add(Integer.parseInt(split.get(0)))
			currentSet.addAll(split.get(1).split(", ").map[Integer.parseInt(it)])
			sets.add(currentSet)
		]
		
		val disjoint_sets = newHashSet
		while(sets.size != 0) {
			val current = sets.remove(0)
			val toFill = sets.findFirst[ s|
				s.findFirst[
					current.contains(it)
				] !== null
			]
			if (toFill === null)
				disjoint_sets.add(current)
			else
				toFill.addAll(current)
		}
		println(disjoint_sets.findFirst[it.contains(0)].size)
		print(disjoint_sets.size)
	}
}