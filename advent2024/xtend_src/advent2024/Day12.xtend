package advent2024

import adventutils.geometry.Coordinate
import adventutils.geometry.Direction
import adventutils.input.InputLoader
import java.util.HashMap
import java.util.HashSet
import java.util.List
import java.util.Set

class Day12 {

	static List<List<String>> inputs = new InputLoader(2024, 12).inputs.map[toCharArray.map[it + ""]]
	static int max_i = inputs.size - 1
	static int max_j = inputs.get(0).size - 1
	static HashMap<Coordinate, String> coordinates = {
		val output = newHashMap
		for (i : 0 .. max_i)
			for (j : 0 .. max_j)
				output.put(new Coordinate(i, j), inputs.get(i).get(j))
		output
	}

	def static void main(String[] args) {
		val areas = newArrayList
		val remaining = new HashSet(coordinates.keySet)
		while (!remaining.empty) {
			val current = remaining.head
			remaining.remove(current)
			val current_area = newHashSet
			val next_to_proceed = newHashSet(new BorderedCoordinate(current))
			while (!next_to_proceed.empty) {
				current_area.addAll(next_to_proceed)
				val next_next_to_proceed = newHashSet
				for (c : next_to_proceed)
					next_next_to_proceed.addAll(c.similarNeighbours.map[new BorderedCoordinate(it)].filter [
						!current_area.contains(it)
					])
				next_to_proceed.clear
				next_to_proceed.addAll(next_next_to_proceed)
			}
			areas.add(current_area)
			remaining.removeAll(current_area.map[coord])
		}

		println(areas.fold(0) [ acc, el |
			acc + el.size * el.fold(0)[acc1, el1|acc1 + el1.getBorderCount]
		])
		
		println(areas.map[toList].fold(0) [acc,el |
			acc + el.size * {
				val all_borders = el.fold(0)[acc1, el1|acc1 + el1.getBorderCount]
				val size_el = el.size
				var to_remove_borders = 0
				for (i : 0 ..< size_el) {
					for (j : i+1 ..< size_el) 
						to_remove_borders += el.get(i).similarBordersCount(el.get(j))
				}
				all_borders - to_remove_borders
			}
		])
	}

	static class BorderedCoordinate {

		Coordinate coord
		Set<Direction> borders
		Set<Coordinate> similarNeighbours

		new(Coordinate c) {
			coord = c
			borders = newHashSet
			similarNeighbours = newHashSet
			c.noDiagonalUnboundedNeighboursWithDirection.forEach [ neighbour |
				if (coordinates.get(neighbour.key) == coordinates.get(c))
					similarNeighbours.add(neighbour.key)
				else
					borders.add(neighbour.value)
			]
		}

		def getBorderCount() {
			borders.size
		}

		def similarBordersCount(BorderedCoordinate other) {
			if (similarNeighbours.contains(other.coord)) 
				borders.filter[other.borders.contains(it)].size
			else 0
		}

		override hashCode() {
			coord.hashCode
		}

		override equals(Object other) {
			switch other {
				BorderedCoordinate: coord.equals(other.coord)
				default: false
			}
		}
	}
}
