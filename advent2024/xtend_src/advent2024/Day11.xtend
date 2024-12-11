package advent2024

import adventutils.input.InputLoader
import java.util.HashMap

class Day11 {
	def static void main(String[] args) {
		val input = new InputLoader(2024, 11).inputs.get(0).split(" ").map[Long.parseLong(it + "")]
		var HashMap<Long, Long> list = newHashMap(input.map[it -> 1L])
		for (i : 1 .. 75) {
			list = list.entrySet.fold(newHashMap) [ acc, el |
				el.key.next.forEach[acc.merge(it, el.value)[x, y|x + y]]
				acc
			]
			if (i == 25) println(list.values.reduce[x,y | x +y])
		}
		println(list.values.reduce[x,y | x +y])
	}

	def static next(long l) {
		switch (s : l.toString) {
			case "0":
				#[1L]
			case s.length % 2 == 0: {
				val middle = s.length / 2
				#[Long.parseLong(s.substring(0, middle)), Long.parseLong(s.substring(middle, s.length))]
			}
			default:
				#[l * 2024]
		}
	}
}
