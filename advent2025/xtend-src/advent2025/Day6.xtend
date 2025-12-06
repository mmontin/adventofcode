package advent2025

import adventutils.input.InputLoader
import java.util.ArrayList
import org.eclipse.xtext.xbase.lib.Functions.Function2

class Day6 {

	def static toOp(String s) {
		switch s {
			case "+": [long x, long y|y + y]
			case "*": [long x, long y|x * y]
			default: return null
		}
	}

	def static void main(String[] args) {
		val inputs = new InputLoader(2025, 6).inputs

		val inputs1 = inputs.map [
			val res = new ArrayList(it.split("\\s+"))
			if(res.get(0) == "") res.remove(0)
			res
		]

		val results = new ArrayList(inputs1.last.map[it == "*" ? 1L : 0L])
		val numbers = inputs1.subList(0, inputs1.size - 1).map[it.map[Long.parseLong(it)]]
		for (j : 0 .. inputs1.get(0).size - 1)
			for (i : 0 .. numbers.size - 1)
				results.set(j, toOp(inputs1.last.get(j)).apply(
					results.get(j),
					numbers.get(i).get(j)
				))
		println("Part1: " + results.reduce[x, y|x + y])

		val inputs2 = inputs.map[toCharArray.map[it + ""]]

		var result = 0L
		var Function2<Long,Long,Long> currentOp
		var currentRes = 0L
		for (j : 0 .. inputs2.get(0).size - 1) {
			val maybeNewOp = inputs2.last.get(j)
			if (maybeNewOp != " ") {
				result += currentRes
				currentOp = toOp(maybeNewOp)
				currentRes = maybeNewOp == "+" ? 0 : 1
			}
			val currentCol = (0 .. inputs2.size - 2).fold("") [ acc, i |
				acc + inputs2.get(i).get(j)
			].trim
			if (!currentCol.isEmpty)
				currentRes = currentOp.apply(currentRes,Long.parseLong(currentCol))
		}
		println("Part2: " + (result + currentRes))
	}
}
