package advent2017

import adventutils.geometry.Coordinate
import adventutils.geometry.Coordinate.Direction
import adventutils.input.InputLoader
import java.util.List
import java.util.Map

class Day19 {
	
	static final Map<Coordinate,String> routes = newHashMap
	
	static final List<String> visited = newArrayList
	
	static Coordinate previous_location
	static Coordinate current_location
	static Direction current_direction
	
	def static void main(String[] args) {
		
		val input = new InputLoader(2017,19).inputs.map[it.toCharArray.map[toString]] ;
		(0..<input.size).forEach[i|
			val current_line = input.get(i)
			(0..<current_line.size).forEach[j|
				if (!current_line.get(j).equals(" ")) routes.put(new Coordinate(i,j),current_line.get(j))
			]
		]
		
		previous_location = null
		current_location = routes.keySet.minBy[x]
		current_direction = Direction.DOWN
		
		while (current_location !== null) {
			visited.add(routes.get(current_location))
			val next_step = current_location.otherMove(current_direction)
			if (routes.keySet.contains(next_step)) {
				previous_location = current_location
				current_location = next_step
			} else {
				val next = current_location.noDiagonalUnboundedNeighboursWithDirection.filter[
					routes.keySet.contains(it.key) && !it.key.equals(previous_location)
				].head
				previous_location = current_location
				current_location = next === null ? null : next.key
				current_direction = next === null ? null : next.value
			}
		}
		
		println(visited.filter[!it.equals("|") && !it.equals("+") && !it.equals("-")].join(""))
		println(visited.size)
	}
}