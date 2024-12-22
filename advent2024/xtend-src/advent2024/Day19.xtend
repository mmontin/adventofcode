package advent2024

import adventutils.MemoryRunner
import adventutils.input.InputLoader
import java.util.List

class Day19 {

	static List<String> inputs = new InputLoader(2024, 19).inputs
	static List<String> patterns = inputs.get(0).split(", ")

	def static void main(String[] args) {

		val res = inputs.drop(2).map[solver.call(it)].filter[it != 0]
		println(res.size)
		println(res.reduce[x, y|x + y])
	}

	static final MemoryRunner<String, Long> solver = {
		val MemoryRunner<String, Long> res = new MemoryRunner
		res.bind [ s |
			if (s.isEmpty)
				1L
			else
				patterns.fold(0L) [ acc, el |
					acc + (s.startsWith(el) ? res.call(s.substring(el.length)) : 0)
				]
		]
	}
}
