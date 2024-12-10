package advent2018

import adventutils.MemoryRunner
import adventutils.geometry.Coordinate
import adventutils.pathfinding.AStar
import adventutils.pathfinding.State
import java.util.List
import java.util.Set

class Day22 {

	final static int rocky = 0
	final static int wet = 1
	final static int narrow = 2
	final static Set<Integer> surfaces = #{rocky, wet, narrow}

	// Tools: climbing gear, torch, neither
	// rocky (0) : climbing gear, torch
	// wet (1) : climbing gear, neither
	// narrow (2) : torch, neither
	// So: neither = 0, torch = 1, climbing gear = 2
	final static int depth = 11109
	final static Coordinate source = new Coordinate(0, 0)
	final static Coordinate target = new Coordinate(9, 731)
	final static int modulo = 20183

	def static void main(String[] args) {
		println((0 .. target.x).fold(0) [ acc, i |
			(0 .. target.y).fold(acc) [ acc1, j |
				acc1 + runner.call(new Coordinate(i, j)).get(2)
			]
		])

		println(new AStar(new Position(source, 1)).run.minDistance)
	}

	final static MemoryRunner<Coordinate, List<Integer>> runner = new MemoryRunner[populate]

	def static List<Integer> populate(Coordinate c) {
		val geo = if (c.equals(source) || c.equals(target))
				0
			else if (c.y == 0)
				(c.x * 16807)
			else if (c.x == 0)
				(c.y * 48271)
			else
				runner.call(c.addX(-1)).get(1) * runner.call(c.addY(-1)).get(1)
		val ero = (geo + depth) % modulo
		newArrayList(geo, ero, ero % 3)
	}

	static class Position implements State {

		Coordinate position
		int currentTool

		new(Coordinate c, int tool) {
			position = c
			currentTool = tool
		}

		override equals(Object other) {
			switch other {
				Position: other.position.equals(position) && other.currentTool == currentTool
				default: false
			}
		}

		override hashCode() {
			position.hashCode * currentTool
		}

		override isGoal() {
			position.equals(target) && currentTool == 1
		}

		override minToGoal() {
			position.manhattanDistanceTo(target) + (currentTool == 1 ? 0 : 7)
		}

		override toString() {
			"{" + position + " ; " + currentTool + "}"
		}

		override neighbours() {

			if (position.equals(target))
				#{new Position(position, 1) -> 7}
			else {
				val current_value = runner.call(position).get(2)
				position.noDiagonalUnboundedNeighbours.filter[it.x >= 0 && it.y >= 0].map [
					val next_value = runner.call(it).get(2)
					if (currentTool != next_value)
						new Position(it, currentTool) -> 1
					else {
						val nextTool = surfaces.filter[!#{current_value, next_value}.contains(it)].head
						new Position(it, nextTool) -> 8
					}
				]
			}
		}
	}
}
