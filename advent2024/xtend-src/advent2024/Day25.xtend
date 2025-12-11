package advent2024

import adventutils.collection.CollectionUtils
import adventutils.input.InputLoader
import java.util.List

class Day25 {

	static List<List<Integer>> keys = newArrayList
	static List<List<Integer>> locks = newArrayList

	def static void main(String[] args) {
		val input = new InputLoader(2024, 25).inputs.map[toCharArray.map[it + ""]]
		for (var i = 0; i < input.size; i += 8) {
			val subl = input.subList(i, i + 7)
			(subl.get(0).join == "....." ? locks : keys).add((0 .. 4).fold(newArrayList) [ acc, j |
				CollectionUtils.cons((0 .. 6).filter[subl.get(it).get(j) == "#"].size, acc)
			])
		}

		println(keys.fold(0) [ acc, key |
			acc + locks.filter [ lock |
				(0 .. 4).fold(true) [ acc1, el |
					acc1 && key.get(el) + lock.get(el) <= 7
				]
			].size
		])
	}
}
