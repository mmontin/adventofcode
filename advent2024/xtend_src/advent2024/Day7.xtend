package advent2024

import adventutils.input.InputLoader

class Day7 {
	def static void main(String[] args) {
		val inputs = new InputLoader(2024, 7).inputs.map[it.split(":? ").map[Long.parseLong(it)]]
		val res1 = inputs.fold(0L -> 0L) [ acc, el |
			val target = el.get(0)
			val seed = el.get(1)
			val numbers = el.drop(2)
			var candidates = numbers.fold(newHashSet(seed)) [total, current |
				val res = newHashSet
				total.forEach[
					res.add(it + current)
					res.add(it * current)
				]
				res
			]
			if (candidates.contains(target))
				acc.key + target -> acc.value
			else {
				candidates = numbers.fold(newHashSet(seed)) [total, current |
					val res = newHashSet
					total.forEach[
						res.add(it + current)
						res.add(it * current)
						res.add(Long.parseLong("" + it + current))
					]
					res
				]
				acc.key -> acc.value + (candidates.contains(target) ? target : 0L)
			}
		]
		println(res1.key)
		println(res1.key + res1.value)
	}
}
