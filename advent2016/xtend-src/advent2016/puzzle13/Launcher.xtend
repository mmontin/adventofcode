package advent2016.puzzle13

class Launcher {
	
	static final int target_x = 31
	static final int target_y = 39
	
	def static void main(String[] args) {
		var start = new Coordinates(1,1)
		start.updateDistance(0)
		
		var visited = newHashSet
		var toVisit = newHashSet(start)
		
		var shown = false
		var size = 0
		val finish = new Coordinates(target_x,target_y)
		while (!(start = toVisit.minBy[distance]).equals(finish)) {
			if (!shown && start.distance > 50) {
				size = visited.size
				shown = true
			}
			start.step(visited,toVisit)
			toVisit.remove(start)
			visited.add(start)
		}
		println("PART 1: " + start.distance)
		println("PART 2: " + size)
	}
}