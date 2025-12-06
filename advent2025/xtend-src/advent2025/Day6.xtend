package advent2025

import adventutils.input.InputLoader
import java.util.ArrayList

class Day6 {
	def static void main(String[] args) {
		val inputs = new InputLoader(2025, 6).inputs
		
		val inputs1 = inputs.map [
			val res = new ArrayList(it.split("\\s+"))
			if(res.get(0) == "") res.remove(0)
			res
		]
		val operators = inputs1.last
		val results = new ArrayList(operators.map[it == "*" ? 1L : 0L])
		val numbers = inputs1.subList(0, inputs1.size - 1).map[it.map[Long.parseLong(it)]]
		for (i : 0 .. operators.size - 1) {
			for (j : 0 .. numbers.size - 1) {
				if (operators.get(i) == "+")
					results.set(i, results.get(i) + numbers.get(j).get(i))
				else
					results.set(i, results.get(i) * numbers.get(j).get(i))
			}
		}
		println("Part1: " + results.reduce[x, y|x + y])
		
		val inputs2 = inputs.map[toCharArray.map[it + ""]]
		
		var result = 0L
		var String currentOp
		var currentRes = 0L
		for (j : 0 .. inputs2.get(0).size-1) {
			val maybeNewOp = inputs2.last.get(j)
			if (maybeNewOp != " ") {
				result += currentRes
				currentOp = maybeNewOp
				currentRes = currentOp == "+" ? 0 : 1
			}
			val currentCol = (0..inputs2.size-2).fold("")[acc,i |
				acc + inputs2.get(i).get(j)
			].trim
			if (!currentCol.isEmpty)
				if (currentOp == "+")
					currentRes += Long.parseLong(currentCol)
				else 
					currentRes *= Long.parseLong(currentCol)
		}
		println("Part2: " + (result + currentRes))
	}
}
