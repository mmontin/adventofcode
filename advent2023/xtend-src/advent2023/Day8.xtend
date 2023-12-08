package advent2023

import adventutils.Arithmetics
import adventutils.input.InputLoader
import java.util.Map

class Day8 {

	static Map<String, Pair<String, String>> locations = newHashMap

	def static void main(String[] args) {

		val inputs = new InputLoader(2023, 8).inputs
		val directions = inputs.remove(0).toCharArray.toList.map[it + ""]
		inputs.remove(0)

		inputs.forEach [
			val split1 = it.split(" = ")
			val split2 = split1.get(1).substring(1, 9).split(", ")
			locations.put(split1.get(0), split2.get(0) -> split2.get(1))
		]

		var i = 0
		var current = "AAA"
		while (!current.equals("ZZZ")) {
			val next_direction = directions.get(i % directions.size)
			current = nextLocation(current, next_direction)
			i++
		}

		println(i)

		val data = locations.keySet.filter[it.endsWith("A")].map [
			val states = newArrayList
			var current_state = it -> 0
			while (!states.contains(current_state)) {
				states.add(current_state)
				var pos = current_state.value
				var current_location = current_state.key
				current_state = nextLocation(current_location, directions.get(pos)) -> (pos + 1) % directions.size
			}
			states -> current_state
		]

		println(data.map[it.key.size - it.value.value].fold(1L)[acc,el|Arithmetics.lcm(acc,el)])
	}

	def static nextLocation(String current, String direction) {
		val current_pair = locations.get(current)
		direction.equals("R") ? current_pair.value : current_pair.key
	}
}
