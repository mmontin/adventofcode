package advent2016.puzzle11

import java.util.Set

class Launcher {
	
	static Set<Building> toVisit = newHashSet(new Building(0))
	static Set<Building> visited = newHashSet
	static int best_score = 0
	
	def static void main(String[] args) {

		var Building first
		var time = System.currentTimeMillis

		while (!(first = toVisit.min).getFinal) {
			if (first.score > best_score) best_score = first.score
			first.step(toVisit,visited)
			toVisit.remove(first)
			visited.add(first)
		}
		println(first.distance + ' minimal steps computed is ' + (System.currentTimeMillis - time) + "ms")
	}
}
