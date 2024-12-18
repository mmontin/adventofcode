package advent2024

import adventutils.geometry.Coordinate
import adventutils.geometry.Dir
import adventutils.geometry.Direction
import adventutils.input.InputLoader
import adventutils.pathfinding.AStar
import adventutils.pathfinding.DFS
import adventutils.pathfinding.State
import java.util.HashSet
import java.util.Set

class Day16 {

	static Coordinate start
	static Coordinate finish
	static Set<Coordinate> free_spots = newHashSet

	def static void main(String[] args) {

		new InputLoader(2024, 16).applyOnGrid [s,c|
			switch s {
				case "S": start = c
				case "E": finish = c
				case ".": free_spots.add(c)
			}
		]
		free_spots.addAll(#{start, finish})

		val aStar = new AStar(new MyCoordinate(start, Direction.RIGHT)).run
		println(aStar.minDistance)
		println(new DFS(aStar).run.all_min_paths.fold(newHashSet) [ acc, el |
			acc.addAll(el.path.map[(it as MyCoordinate).coord])
			acc
		].size)
	}

	static class MyCoordinate implements State {

		Coordinate coord
		Direction dir

		new(Coordinate c, Direction d) {
			coord = c
			dir = d
		}

		override isGoal() {
			coord.equals(finish)
		}

		override minToGoal() {
			coord.manhattanDistanceTo(finish)
		}

		override hashCode() {
			coord.hashCode * dir.hashCode
		}

		override equals(Object other) {
			switch other {
				MyCoordinate: other.coord.equals(coord) && other.dir.equals(dir)
				default: false
			}
		}

		override toString() {
			coord + " : " + dir
		}

		override neighbours() {
			val next_dirs = #{Dir.nextDirection(dir), Dir.clockWise(dir)}.map[new MyCoordinate(coord, it) -> 1000].toSet
			val next_coord = coord.otherMove(dir)
			if (free_spots.contains(next_coord))
				next_dirs.add(new MyCoordinate(next_coord, dir) -> 1)
			new HashSet(next_dirs)
		}
	}
}
