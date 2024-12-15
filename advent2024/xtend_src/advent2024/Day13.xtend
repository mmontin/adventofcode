package advent2024

import adventutils.geometry.Coordinate
import adventutils.geometry.Interval
import adventutils.input.InputLoader
import adventutils.maths.Arithmetics
import java.util.List
import java.util.Optional

class Day13 {
	def static void main(String[] args) {
		val input = new InputLoader(2024, 13).inputs

		val machines = newArrayList
		for (var i = 0; i < input.size; i += 4)
			machines.add(new Machine(input.subList(i, i + 3)))

		println(machines.map[solve].fold(0)[acc,el |
			acc + (el.isEmpty ? 0 : {
				val res = el.get
				res.key * 3 + res.value
			})
		])
	}

	static class Machine {
		Coordinate x_button
		Coordinate y_button
		Coordinate price

		new(List<String> input) {
			val split1 = input.get(0).split("(Button A: X\\+)|(, Y\\+)").map[Integer.parseInt(it)]
			x_button = new Coordinate(split1.get(1), split1.get(2))
			val split2 = input.get(1).split("(Button B: X\\+)|(, Y\\+)").map[Integer.parseInt(it)]
			y_button = new Coordinate(split2.get(1), split2.get(2))
			val split3 = input.get(2).split("(Prize: X=)|(, Y=)").map[Integer.parseInt(it)]
			price = new Coordinate(split3.get(1), split3.get(2))
		}

		def Optional<Pair<Integer, Integer>> solve() {
			val res1 = Arithmetics.diophantienne(x_button.x, y_button.x, price.x)
			if (res1.isEmpty)
				Optional.empty
			else {
				val resultX = res1.get
				val coord_1_X_a = resultX.key.value
				val coord_1_X_b = resultX.key.key
				val coord_1_X_itv = new Interval(-coord_1_X_b / coord_1_X_a, (100 - coord_1_X_b) / coord_1_X_a).swapIfNeeded
				val coord_2_X_a = resultX.value.value
				val coord_2_X_b = resultX.value.key
				val coord_2_X_itv = new Interval(-coord_2_X_b / coord_2_X_a, (100 - coord_2_X_b) / coord_2_X_a).swapIfNeeded
				val coord_X_itv = coord_1_X_itv.intersection(coord_2_X_itv)
				val possible_pairs = coord_X_itv.isEmpty
						? newHashSet
						: (coord_X_itv.leftBound as int .. coord_X_itv.rightBound as int).fold(newHashSet) [ acc, el |
						acc.add(coord_1_X_a * el + coord_1_X_b -> coord_2_X_a * el + coord_2_X_b)
						acc
					]
				Optional.ofNullable(possible_pairs.findFirst[
					x_button.y * it.key + y_button.y * it.value == price.y
				])
			}
		}
	}
}
