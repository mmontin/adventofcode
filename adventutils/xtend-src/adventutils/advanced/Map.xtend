package adventutils.advanced

import adventutils.geometry.Coordinate
import adventutils.geometry.CoordinateSet
import java.util.HashSet
import java.util.List

class Map {

	// This takes a border as input described as a list of coordinates
	// This flows from this outside and returns
	// - the outside tiles
	// - the border tiles
	// - the inside tiles
	def static Pair<CoordinateSet, Pair<CoordinateSet, CoordinateSet>> flow(List<Coordinate> border) {
		
		val border_set = (0 ..< border.size).fold(new CoordinateSet) [ set, i |
			val left = border.get(i)
			val right = border.get((i + 1) % border.size)
			set.addAll(Coordinate.getAllCoordsOnLine(left, right))
			set
		]
		
		val minX = border_set.minX
		val maxX = border_set.maxX
		val minY = border_set.minY
		val maxY = border_set.maxY
		
		val frontier = newHashSet(new Coordinate(minX-1, minY-1))
		val reached = new HashSet(border_set)
		while (!frontier.empty) {
			val tmp = new HashSet(frontier)
			reached.addAll(frontier)
			frontier.clear
			tmp.forEach [
				frontier.addAll(it.noDiagonalBoundedNeighbours(minX - 1, maxX + 1, minY - 1, maxY + 1).filter [
					!reached.contains(it)
				])
			]
		}
		
		reached.removeAll(border_set)
		reached.removeIf[it.x == minX - 1 || it.x == maxX + 1 || it.y == minY - 1 || it.y == maxY + 1]
		
		val outside_set = new CoordinateSet(reached)
		outside_set.setBoundaries(minX,maxX,minY,maxY)
		
		val inside_set = outside_set.invertSet
		inside_set.removeAll(border_set)
		inside_set.setBoundaries(minX,maxX,minY,maxY)
		
		outside_set -> (border_set -> inside_set)
	}
}
