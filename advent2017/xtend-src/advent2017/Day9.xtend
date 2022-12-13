package advent2017

import adventutils.input.InputLoader
import java.util.Stack

class Day9 {
	def static void main(String[] args) {
		val stream = new InputLoader(2017, 9).inputs.head.toCharArray.map[it + ""];
		var i = 0
		var inGarbage = false
		val scores = new Stack
		var totalScore = 0
		var nbGarbage = 0
		while (i < stream.size) {
			switch (stream.get(i)) {
				case "<": if (!inGarbage) inGarbage = true else nbGarbage ++
				case ">": inGarbage = false
				case "{": if(!inGarbage) scores.push(scores.isEmpty ? 1 : scores.peek + 1) else nbGarbage ++
				case "}": if(!inGarbage) totalScore += scores.pop else nbGarbage ++
				case "!": if(inGarbage) i++
				default : if (inGarbage) nbGarbage ++
			}
			i++
		}
		println(totalScore)
		println(nbGarbage)
	}
}
