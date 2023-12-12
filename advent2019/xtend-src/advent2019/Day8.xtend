package advent2019

import adventutils.input.InputLoader

class Day8 {

	static final int max_y = 25
	static final int max_x = 6
	static final int layer_size = max_x * max_y

	def static void main(String[] args) {
		val line = new InputLoader(2019, 8).chars.get(0)
		val full_size = line.size
		val nb_of_layers = full_size / layer_size
		val layers = (0 .. nb_of_layers - 1).map[line.subList(it * layer_size, (it + 1) * layer_size)]
		val min_0 = layers.minBy[it.groupBy[it].get("0").size].groupBy[it]
		println(min_0.get("1").size * min_0.get("2").size)
		val image = (0 .. layer_size - 1).fold(newArrayList) [ acc, el |
			var i = 0
			while (layers.get(i).get(el).equals("2"))
				i++
			acc.add(layers.get(i).get(el))
			acc
		]
		for (i : 0 .. max_x - 1) {
			var current_line = ""
			for (j : (0 .. max_y - 1))
				current_line += (image.get(i * 25 + j).equals("1") ? "#" : ".")
			println(current_line)
		}
	}
}
