package advent2025

import adventutils.MemoryRunner
import adventutils.collection.CollectionUtils
import adventutils.input.InputLoader
import java.util.List
import java.util.Map
import java.util.Set

class Day11 {

	static final Map<String, Set<String>> nodes = CollectionUtils.aggregateToMap(new InputLoader(2025, 11).inputs) [ s, m |
		val split = s.split(": ")
		val split2 = split.get(1).split(" ").toSet
		m.put(split.get(0), split2)
	]

	static final MemoryRunner<String, Long> runner = new MemoryRunner[compute]

	def static Long compute(String s) {
		s == "out" ? 1L : nodes.get(s).fold(0L)[acc, s2|acc + runner.call(s2)]
	}

	static final MemoryRunner<String, List<Long>> runner2 = new MemoryRunner[compute2]

	// Order of outputs: "dac" "ftt" 00 10 01 11
	def static List<Long> compute2(String s) {
		if (s == "out")
			newArrayList(1L, 0L, 0L, 0L)
		else {
			val fromChildren = nodes.get(s).fold(newArrayList(0L, 0L, 0L, 0L)) [ acc, el |
				val res = runner2.call(el)
				(0 .. 3).forEach[i|acc.set(i, acc.get(i) + res.get(i))]
				acc
			]
			if (s == "dac") {
				fromChildren.set(3, fromChildren.get(3) + fromChildren.get(2))
				fromChildren.set(2, 0L)
				fromChildren.set(1, fromChildren.get(1) + fromChildren.get(0))
				fromChildren.set(0, 0L)
			} else if (s == "fft") {
				fromChildren.set(3, fromChildren.get(3) + fromChildren.get(1))
				fromChildren.set(1, 0L)
				fromChildren.set(2, fromChildren.get(2) + fromChildren.get(0))
				fromChildren.set(0, 0L)
			}
			fromChildren
		}
	}

	def static void main(String[] args) {
		println("Part 1: " + runner.call("you"))
		println("Part 1: " + runner2.call("svr").get(3))
	}
}
