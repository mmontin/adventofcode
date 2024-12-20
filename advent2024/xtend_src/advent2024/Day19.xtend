package advent2024

import adventutils.MemoryRunner
import adventutils.input.InputLoader
import java.util.List

class Day19 {

	static List<String> inputs = new InputLoader(2024, 19).inputs
	static List<String> patterns = inputs.get(0).split(", ")
	static String regexp = "(" + patterns.join("|") + ")*"

	def static void main(String[] args) {

		val possible_targets = inputs.drop(2).filter[it.matches(regexp)]

		println(possible_targets.size)
		println(possible_targets.fold(0L)[acc, el|acc + el.solve])
	}

	static final MemoryRunner<String, Long> runner = new MemoryRunner[solve(it)]

	static def long solve(String s) {
		if (s.isEmpty)
			1L
		else
			patterns.fold(0L) [ acc, el |
				if (s.startsWith(el))
					acc + runner.call(s.substring(el.length))
				else
					acc
			]
	}
}
