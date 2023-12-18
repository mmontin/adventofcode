package advent2019

import adventutils.geometry.Coordinate
import adventutils.geometry.Dir
import adventutils.geometry.Direction
import adventutils.input.InputLoader
import java.util.List

class Day3 {
	def static void main(String[] args) {
		val inputs = new InputLoader(2019, 3).inputs
		val path1 = inputs.get(0).split(",").map [
			Dir.directionFromString(it.substring(0, 1)) -> Integer.parseInt(it.substring(1))
		]
		val path2 = inputs.get(1).split(",").map [
			Dir.directionFromString(it.substring(0, 1)) -> Integer.parseInt(it.substring(1))
		]

		val coords1 = navigate(path1)
		val coords2 = navigate(path2)
		
		val intersection = coords1.keySet
		intersection.retainAll(coords2.keySet)
		
		println(intersection.minBy[it.manhattanDistanceToZero].manhattanDistanceToZero)
		
		val better2 = intersection.minBy[coords1.get(it) + coords2.get(it)]
		println(coords1.get(better2) + coords2.get(better2))
	}

	def static navigate(List<Pair<Direction, Integer>> path) {
		val output = newHashMap
		var duration = 0
		var currentCoord = new Coordinate(0, 0)
		for (line : path) {
			for (i : 1 .. line.value) {
				currentCoord = currentCoord.otherMove(line.key)
				duration++
				if(!output.containsKey(currentCoord)) output.put(currentCoord, duration)
			}
		}
		output
	}
}
