package advent2024

import adventutils.geometry.Coordinate
import adventutils.input.InputLoader
import adventutils.pathfinding.AStar
import adventutils.pathfinding.State
import java.util.Set

class Day20 {

	static final Set<Coordinate> free_spots = newHashSet
	static final Set<Coordinate> walls = newHashSet
	static final Set<Coordinate> min_path = newHashSet
	static Coordinate start
	static Coordinate finish
	static Coordinate min_coordinate = new Coordinate(0, 0)
	static Coordinate max_coordinate

	def static void main(String[] args) {
		max_coordinate = new InputLoader(2024, 20).applyOnGrid [ s, c |
			switch s {
				case ".":
					free_spots.add(c)
				case "S": {
					start = c
					free_spots.add(c)
				}
				case "E": {
					finish = c
					free_spots.add(c)
				}
				default:
					walls.add(c)
			}
		]

		val astar = new AStar(new MyCoordinate(start,free_spots,finish))
		val best_without_cheating = astar.run.minDistance
		min_path.addAll(astar.minPath.map[it as Coordinate])
		println(best_without_cheating)

		val map1 = compute(2)
		println(map1.entrySet.map[best_without_cheating - it.key -> it.value].filter[it.key >= 100].map[value].reduce[x,y|x+y])

//		println(best_without_cheating)
//
//		var cheats = newHashMap
//
//		for (i : 1 .. max_coordinate.x - 1) {
//			for (j : 1 .. max_coordinate.y - 1) {
//				val current = new Coordinate(i, j)
//				if (!free_spots.contains(current) &&
//					current.noDiagonalBoundedNeighbours(min_coordinate, max_coordinate).filter[free_spots.contains(it)].
//						size >= 2) {
//					free_spots.add(current)
//					astar.initialize(new MyCoordinate(start))
//					cheats.merge(best_without_cheating - astar.run.minDistance, 1)[x, y|x + y]
//					free_spots.remove(current)
//				}
//			}
//		}
//
//		println(cheats.entrySet.filter[key >= 100].map[value].reduce[x, y|x + y])
	}

	static def compute(int max_cheat_size) {

		val cheats = newHashMap

		var n_free_spots = min_path.size
		println(n_free_spots)
		for (i : 0 ..< n_free_spots) {
			println(i)
			val current_i = min_path.get(i)
			for (j : i + 100 ..< n_free_spots) {
				val current_j = min_path.get(j)
				if (current_i.manhattanDistanceTo(current_j) <= max_cheat_size) {
					walls.add(current_j)
					val astar = new AStar(new MyCoordinate(current_i, walls, current_j))
					try {
						astar.run
						val wall_path = astar.minPath
						if (wall_path.size > 2) {
							val walls_to_remove = wall_path.subList(1, wall_path.size - 1).map[it as MyCoordinate]
							free_spots.addAll(walls_to_remove)
							val astar2 = new AStar(new MyCoordinate(start, free_spots, finish)).run
							cheats.merge(astar2.minDistance, 1)[x, y|x + y]
							free_spots.removeAll(walls_to_remove)
						}
					} finally
						walls.remove(current_j)
				}

			}
		}
		
		cheats
	}

	static class MyCoordinate extends Coordinate implements State {

		Set<Coordinate> candidates
		Coordinate target

		new(Coordinate c, Set<Coordinate> candidates_, Coordinate target_) {
			super(c)
			candidates = candidates_
			target = target_
		}

		override isGoal() {
			equals(target)
		}

		override minToGoal() {
			manhattanDistanceTo(target)
		}

		override neighbours() {
			this.noDiagonalBoundedNeighbours(min_coordinate, max_coordinate).filter [
				candidates.contains(it)
			].map [
				new MyCoordinate(it, candidates, target) -> 1
			]
		}
	}
}
