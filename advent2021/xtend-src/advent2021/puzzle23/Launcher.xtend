package advent2021.puzzle23

import adventutils.pathfinding.AStar

class Launcher {
	def static void main(String[] args) {
		val timer = System.currentTimeMillis
		println(new AStar(new AmphipodState).run.minDistance)
		println("Result computed in " + (System.currentTimeMillis - timer) + "ms")
	}
}