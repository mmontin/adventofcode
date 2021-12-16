package advent2016.puzzle11

import java.util.Set

class Launcher {
	
	static Set<Building> toVisit = newHashSet(new Building(0))
	static Set<Building> visited = newHashSet
	static int best_score = 0
	
	def static void main(String[] args) {

		var Building first
		var time_abs = System.currentTimeMillis
		var time = System.currentTimeMillis
		var i = 0
		
		while (!(first = toVisit.min).isFinal) {
			update(first.score)
			first.step(toVisit,visited)
			toVisit.remove(first)
			visited.add(first)
			if (i++ % 10000 == 0) {
				var time_1 = System.currentTimeMillis
				println((time_1 - time) + "ms for the last 10000 states")
				time = time_1
				println((i - 1) + " states explored so far in " + ((System.currentTimeMillis - time_abs) / 1000) + " seconds")
			}
		}
		println(i + " states visited in total.")
		println(first.distance)
	}
	
	def static update(int score_) {
		if (score_ > best_score) {
			println("New best score : " + score_)
			best_score = score_ 
		}
	}
}
