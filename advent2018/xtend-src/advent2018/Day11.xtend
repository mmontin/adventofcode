package advent2018

import adventutils.geometry.Coordinate
import java.util.Map

class Day11 {

	static final int serial_id = 1723
	static final Map<Pair<Integer,Integer>, Integer> fuel_values = newHashMap

	def static void main(String[] args) {
		var current_max_fuel_value = 0
		var int current_max_i
		var int current_max_j
		for (i : 1 .. 298) {
			for (j : 1 .. 298) {
				var current_fuel_value = getSquareFuelValue(i,j)
				if (current_fuel_value > current_max_fuel_value) {
					current_max_fuel_value = current_fuel_value
					current_max_i = i
					current_max_j = j
				}
			}
		}
		println(current_max_i + "," + current_max_j)
		
		var current_max_size = 3
		for (i : 1..300) {
			for (j : 1..300) {
				var current_square_value = 0
				for (size : 0 .. 300 - Math.max(i,j)) {
					for (k : j .. j + size)
						current_square_value += getFuelValue(i+size,k)
					for (k : i .. i + size - 1)
						current_square_value += getFuelValue(k,j+size)
					if (current_square_value > current_max_fuel_value) {
						current_max_fuel_value = current_square_value
						current_max_i = i
						current_max_j = j
						current_max_size = size + 1
					}
				}
			}
		}
		println(current_max_i + "," + current_max_j + "," + current_max_size)
	}

	def static getSquareFuelValue(int i, int j) {
		val current = new Coordinate(i + 1, j + 1)
		val neighbours = current.allAroundUnboundedNeighbours
		neighbours.fold(getFuelValue(current.x, current.y)) [ acc, v |
			acc + getFuelValue(v.x,v.y)
		]
	}

	def static getFuelValue(int i, int j) {
		if (fuel_values.containsKey(i->j))
			fuel_values.get(i->j)
		else {
			var rack_id = i + 10
			var power_level = rack_id * j
			power_level += serial_id
			power_level *= rack_id
			val digits = power_level.toString.toCharArray
			power_level = Integer.parseInt(digits.get(digits.size - 3).toString) - 5
			fuel_values.put(i->j, power_level)
			power_level
		}
	}
}
