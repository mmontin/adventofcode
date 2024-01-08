package advent2023

import adventutils.geometry.Coordinate
import adventutils.geometry.Dir
import adventutils.geometry.Direction
import adventutils.input.InputLoader
import java.util.ArrayList
import java.util.HashMap
import java.util.HashSet
import java.util.List
import java.util.Optional

class Day23 {

	static final List<List<String>> chars = new InputLoader(2023, 23).chars
	static final int maxx = chars.size - 1
	static final int maxy = chars.get(0).size - 1
	static final HashMap<Coordinate, HashMap<Coordinate, Integer>> neighbours1 = {
		val neighbours = newHashMap;
		(0 .. maxx).forEach [ i |
			(0 .. maxy).forEach [ j |
				val current = new Coordinate(i, j)
				switch (chars.get(i).get(j)) {
					case ".": neighbours.put(current, newHashMap(Dir.allDirections.map[current.otherMove(it) -> 1]))
					case "<": neighbours.put(current, newHashMap(current.otherMove(Direction.LEFT) -> 1))
					case ">": neighbours.put(current, newHashMap(current.otherMove(Direction.RIGHT) -> 1))
					case "^": neighbours.put(current, newHashMap(current.otherMove(Direction.UP) -> 1))
					case "v": neighbours.put(current, newHashMap(current.otherMove(Direction.DOWN) -> 1))
				}
			]
		]
		neighbours
	}

	static final HashMap<Coordinate, HashMap<Coordinate, Integer>> neighbours2 = {
		val neighbours = newHashMap;
		(0 .. maxx).forEach [ i |
			(0 .. maxy).forEach [ j |
				val current = new Coordinate(i, j)
				if (!chars.get(i).get(j).equals("#"))
					neighbours.put(current, newHashMap(Dir.allDirections.map[current.otherMove(it) -> 1]))
			]
		]
		neighbours
	}

	static HashMap<Coordinate, HashMap<Coordinate, Integer>> neighbours = null

	static final Coordinate target = new Coordinate(maxx, maxy - 1)
	static final Coordinate start = new Coordinate(0, 1)

	def static processNeigbours(HashMap<Coordinate, HashMap<Coordinate, Integer>> neighbours) {

		neighbours.values.forEach [ value |
			new HashSet(value.keySet).filter[!neighbours.containsKey(it)].forEach[value.remove(it)]
		]

		val final_neighbours = newHashMap
		val tmp_neighbours = newHashSet
		neighbours.entrySet.forEach [ e |
			if (e.value.size == 2)
				e.value.entrySet.map[key].forEach[tmp_neighbours.add(new Pair(e.key, it))]
			else
				final_neighbours.put(e.key, e.value)
		]

		for (node : new HashSet(final_neighbours.entrySet)) {
			for (start : new HashSet(node.value.entrySet)) {
				var current = start.key
				var previous = node.key
				var length = start.value
				while (current !== null && !final_neighbours.containsKey(current)) {
					val my_current = current
					val my_previous = previous
					val next = tmp_neighbours.findFirst[it.key.equals(my_current) && !it.value.equals(my_previous)]
					if (next === null)
						current = null
					else {
						previous = current
						current = next.value
						length++
					}
				}
				val actual_node_value = final_neighbours.get(node.key)
				actual_node_value.remove(start.key)
				if (current !== null)
					actual_node_value.put(current, length)
			}
		}

		final_neighbours
	}

	def static void main(String[] args) {
		neighbours = processNeigbours(neighbours1)
		println(max_path(newArrayList(start)).get)
		neighbours = processNeigbours(neighbours2)
		println(max_path(newArrayList(start)).get)
	}

	def static Optional<Integer> max_path(List<Coordinate> path) {

		val current = path.last
		if (!current.equals(target))
			neighbours.get(current).entrySet.filter [
				!path.subList(0, path.size - 1).contains(it.key)
			].fold(Optional.empty) [ acc, next |
				val new_path = new ArrayList(path)
				new_path.add(next.key)
				maxOp(acc, max_path(new_path).map[it + next.value])
			]
		else
			Optional.of(0)
	}

	def static maxOp(Optional<Integer> n, Optional<Integer> p) {
		if (n.empty)
			p
		else if (p.empty)
			n
		else
			Optional.of(Math.max(n.get, p.get))
	}
}
