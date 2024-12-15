package advent2024

import adventutils.geometry.Coordinate
import adventutils.input.InputLoader

class Day14 {

	static final int max_i = 101
	static final int max_j = 103

	def static void main(String[] args) {
		val input = new InputLoader(2024, 14).inputs.map [
			val split = it.split("p=| v=")
			new Coordinate(split.get(1)) -> new Coordinate(split.get(2))
		].toSet

		val res1 = input.fold(newHashSet) [ acc, el |
			acc.add(el.step(100))
			acc
		].map[key]

		val middle_x = max_i / 2
		val middle_y = max_j / 2
		
		val top_left = res1.filter [it.x < middle_x && it.y < middle_y].size
		val bot_left = res1.filter [it.x < middle_x && it.y > middle_y].size
		val top_right = res1.filter [it.x > middle_x && it.y < middle_y].size
		val bot_right = res1.filter [it.x > middle_x && it.y > middle_y].size

		println(top_left * top_right * bot_left * bot_right)
		
		val all_states = newArrayList
		var current = input
		while (!all_states.contains(current)) {
			all_states.add(current)
			current = current.map[step(1)].toSet
		}
		
		val sizes = all_states.map[s |
			s.map[key].filter[it.x <= middle_x + (it.y /2) && middle_x - (it.y /2) <= it.x].size
		]
		val max_size = sizes.max
		println(sizes.indexOf(max_size))
	}
	
	def static step(Pair<Coordinate, Coordinate> coord, int n) {
		var new_x = (coord.key.x + coord.value.x * n) % max_i
		if(new_x < 0) new_x = max_i + new_x
		var new_y = (coord.key.y + coord.value.y * n) % max_j
		if(new_y < 0) new_y = max_j + new_y
		new Coordinate(new_x, new_y) -> coord.value
	}
}
