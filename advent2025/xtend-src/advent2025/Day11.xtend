package advent2025

import adventutils.MemoryRunner
import adventutils.collection.CollectionUtils
import adventutils.input.InputLoader
import java.util.List
import java.util.Map
import java.util.Set
import adventutils.collection.ListUtils

class Day11 {

	static final Map<String, Set<String>> nodes = CollectionUtils.aggregateToMap(new InputLoader(2025, 11).inputs) [ s, m |
		val split = s.split(": ")
		m.put(split.get(0), split.get(1).split(" ").toSet)
	]

	static final MemoryRunner<String, List<Long>> runner = new MemoryRunner[compute2]

	// Order of outputs: "dac" "ftt" 00 10 01 11
	def static List<Long> compute2(String s) {
		if (s == "out")
			newArrayList(1L, 0L, 0L, 0L)
		else {
			val fromChildren = nodes.get(s).fold(newArrayList(0L, 0L, 0L, 0L)) [ acc, el |
				val res = runner.call(el)
				(0 .. 3).forEach[i|ListUtils.modify(acc, i)[x|x + res.get(i)]]
				acc
			]
			if (s == "dac")
				#[3, 1].forEach [
					ListUtils.modify(fromChildren, it)[x|x + fromChildren.get(it - 1)]
					fromChildren.set(it - 1, 0L)
				]
			else if (s == "fft")
				#[3, 2].forEach [
					ListUtils.modify(fromChildren, it)[x|x + fromChildren.get(it - 2)]
					fromChildren.set(it - 2, 0L)
				]
			fromChildren
		}
	}

	def static void main(String[] args) {
		println("Part 1: " + runner.call("you").reduce[x, y|x + y])
		println("Part 1: " + runner.call("svr").get(3))
	}
}
