package advent2018

import adventutils.geometry.Coordinate
import adventutils.input.InputLoader
import java.util.List
import java.util.Set

class Day18 {

	static class Map {

		final Set<Coordinate> lumberjacks
		final Set<Coordinate> trees
		final String rep
		final int code

		new(Set<Coordinate> _lumberjacks, Set<Coordinate> _trees) {
			lumberjacks = _lumberjacks
			trees = _trees
			rep = toString
			code = rep.hashCode
		}

		new() {
			lumberjacks = newHashSet
			trees = newHashSet
			for (i : 0 ..< lines) {
				val line = input.get(i).toCharArray
				for (j : 0 ..< cols) {
					switch (line.get(j) + '') {
						case "|": trees.add(new Coordinate(i, j))
						case "#": lumberjacks.add(new Coordinate(i, j))
					}
				}
			}
			rep = toString
			code = rep.hashCode
		}

		def value() {
			lumberjacks.size * trees.size
		}

		override toString() {
			var s = ''
			for (i : 0 .. lines - 1) {
				var line = ''
				for (j : 0 .. cols - 1) {
					var current = new Coordinate(i, j)
					line += trees.contains(current)
						? "|"
						: {
						lumberjacks.contains(current) ? "#" : "."
					}
				}
				s += line + "\n"
			}
			s
		}

		override hashCode() {
			code
		}

		override equals(Object other) {
			other instanceof Map && (other as Map).rep.equals(rep)
		}

		def round() {
			val newLumberjacks = newHashSet
			val newTrees = newHashSet
			for (i : 0 ..< lines) {
				for (j : 0 ..< cols) {
					val current = new Coordinate(i, j)
					val neighbours = current.allAroundBoundedNeighbours(upperLeft, bottomRight)
					val treeNeighbours = neighbours.filter[c|trees.contains(c)].size
					val lumberjackNeighbours = neighbours.filter[c|lumberjacks.contains(c)].size
					if (trees.contains(current))
						(lumberjackNeighbours >= 3 ? newLumberjacks : newTrees).add(current)
					else if (lumberjacks.contains(current)) {
						if(lumberjackNeighbours >= 1 && treeNeighbours >= 1) newLumberjacks.add(current)
					} else {
						if(treeNeighbours >= 3) newTrees.add(current)
					}

				}
			}
			new Map(newLumberjacks, newTrees)
		}
	}

	static final List<String> input = new InputLoader(2018, 18).inputs
	static final int lines = input.size
	static final int cols = input.get(0).length
	static final Coordinate upperLeft = new Coordinate(0, 0)
	static final Coordinate bottomRight = new Coordinate(lines, cols)

	def static void main(String[] args) {
		var current = new Map
		var history = newArrayList
		while (!history.contains(current)) {
			history.add(current)
			current = current.round
		}
		println(history.get(10).value)

		val offset = history.indexOf(current)
		val slope = history.size - offset
		println(history.get((1000000000 - offset) % slope + offset).value)
	}
}
