package advent2024

import adventutils.geometry.Coordinate
import adventutils.input.InputLoader
import adventutils.pathfinding.AStar
import adventutils.pathfinding.State
import java.util.List
import java.util.Set

class Day20 {

	static final Set<Coordinate> free_spots = newHashSet
	static Coordinate start
	static Coordinate finish
	static Coordinate min_coordinate = new Coordinate(0, 0)
	static Coordinate max_coordinate = new InputLoader(2024, 20).applyOnGrid [ s, c |
		switch s {
			case ".":
				free_spots.add(c)
			case "S":
				free_spots.add(start = c)
			case "E":
				free_spots.add(finish = c)
			default:
				false
		}
	]
	static List<Coordinate> min_path = new AStar(new MyCoordinate(start)).run.minPath.map[it as Coordinate]

	def static void main(String[] args) {
		println(compute(2))
		println(compute(20))
	}

	static def compute(int max_cheat_size) {
		var nb = 0
		for (i : 0 ..< min_path.size) {
			val current_i = min_path.get(i)
			for (j : i + 100 ..< min_path.size) {
				val distance = current_i.manhattanDistanceTo(min_path.get(j))
				if(distance <= max_cheat_size && j - i - distance >= 100) nb++
			}
		}
		nb
	}

	static class MyCoordinate extends Coordinate implements State {

		new(Coordinate c) {
			super(c)
		}

		override isGoal() {
			equals(finish)
		}

		override minToGoal() {
			manhattanDistanceTo(finish)
		}

		override neighbours() {
			this.noDiagonalBoundedNeighbours(min_coordinate, max_coordinate).filter [
				free_spots.contains(it)
			].map [
				new MyCoordinate(it) -> 1
			]
		}
	}
}
