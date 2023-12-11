package advent2023

import adventutils.geometry.Coordinate
import adventutils.geometry.Coordinate.Direction
import adventutils.input.InputLoader
import java.util.HashSet

class Day10 {

	def static void main(String[] args) {

		val coordinates = newHashMap
		val starting = newArrayList

		val lines = new InputLoader(2023, 10).inputs.map[it.toCharArray.map[it + ""]]
		(0 .. lines.size - 1).forEach [ i |
			(0 .. lines.get(0).size - 1).forEach [ j |
				val current = new Coordinate(i, j)
				switch lines.get(i).get(j) {
					case "|":
						coordinates.put(current, newHashSet(Direction.UP, Direction.DOWN).map[current.otherMove(it)])
					case "-":
						coordinates.put(current, newHashSet(Direction.LEFT, Direction.RIGHT).map[current.otherMove(it)])
					case "7":
						coordinates.put(current, newHashSet(Direction.LEFT, Direction.DOWN).map[current.otherMove(it)])
					case "J":
						coordinates.put(current, newHashSet(Direction.LEFT, Direction.UP).map[current.otherMove(it)])
					case "F":
						coordinates.put(current, newHashSet(Direction.RIGHT, Direction.DOWN).map[current.otherMove(it)])
					case "L":
						coordinates.put(current, newHashSet(Direction.UP, Direction.RIGHT).map[current.otherMove(it)])
					case "S":
						starting.add(current)
					default:
						coordinates.put(current, newHashSet)
				}
			]
		]

		val start = starting.get(0)
		coordinates.put(start, start.noDiagonalUnboundedNeighbours.filter[coordinates.get(it).contains(start)])

		var prev = start
		var current = coordinates.get(start).head
		val path = newArrayList(prev)
		while (!current.equals(start)) {
			path.add(current)
			val nprev = prev
			prev = current
			current = coordinates.get(current).findFirst[!it.equals(nprev)]
		}
		path.add(current)

		println(path.size / 2)

		val max = coordinates.keySet.maxBy[x].x * 2

		val reached = (0 .. path.size - 2).fold(newHashSet) [ acc, el |
			val left = path.get(el).scale(2)
			val right = path.get(el + 1).scale(2)
			val middle = new Coordinate(
				(left.x + right.x) / 2,
				(right.y + left.y) / 2
			)
			acc.add(left)
			acc.add(middle)
			acc
		]

		val frontier = newHashSet(new Coordinate(-1, -1))

		while (!frontier.empty) {
			val tmp = new HashSet(frontier)
			reached.addAll(frontier)
			frontier.clear
			tmp.forEach [
				frontier.addAll(it.noDiagonalBoundedNeighbours(-2, max + 2).filter[!reached.contains(it)])
			]
		}

		println(coordinates.keySet.map[scale(2)].filter[!reached.contains(it)].size)
	}
}
