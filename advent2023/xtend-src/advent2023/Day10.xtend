package advent2023

import adventutils.geometry.Coordinate
import adventutils.geometry.Coordinate.Direction
import adventutils.input.InputLoader

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
						coordinates.put(current, newHashSet(Direction.RIGHT, Direction.DOWN).
							map[current.otherMove(it)])
					case "L":
						coordinates.put(current, newHashSet(Direction.UP, Direction.RIGHT).map[current.otherMove(it)])
					case "S":
						starting.add(current)
				}
			]
		]

		val start = starting.get(0)
		coordinates.put(start, start.noDiagonalUnboundedNeighbours.filter[coordinates.get(it).contains(start)])

		var length = 1
		var prev = start
		var current = coordinates.get(start).head
		while (!current.equals(start)) {
			val nprev = prev
			prev = current
			current = coordinates.get(current).findFirst[!it.equals(nprev)]
			length ++
		}
		
		println(length / 2)
	}
}
