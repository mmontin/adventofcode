package advent2016.puzzle11

import java.util.Set

class Launcher {
	
	static Set<Building> visited = newHashSet
	static Integer min_depth = Integer::MAX_VALUE

	def static void main(String[] args) {
		process(new Building(),0)
		println(min_depth)
	}

	def static void process(Building current, int depth) {
		if (current.isFinal)
			min_depth = depth
		else if (depth < min_depth) {
			visited.add(current)
			current.steps.filter[!visited.contains(it)].forEach[process(it,depth+1)]
		}
	}
}
