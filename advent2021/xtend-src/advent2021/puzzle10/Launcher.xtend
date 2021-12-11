package advent2021.puzzle10

import advent2021.Utils
import java.math.BigInteger
import java.util.List
import java.util.Stack

class Launcher {
	def static void main(String[] args) {
		val output = Utils.getInputs(10)[it.toCharArray().toList].fold(newArrayList) [ list , input |
			var processed = process(input.map[it + ''])
			if (processed.compareTo(BigInteger.valueOf(0)) > 0)
				list.add(processed)
			list
		].sort
		println(output.get(output.size/2))
	}

	def static BigInteger process(List<String> input) {
		val stack = new Stack()
		var error = 0
		var i = 0
		while (error == 0 && i < input.size) {
			val v = input.get(i++)
			switch (v) {
				case '<',
				case '(',
				case '{',
				case '[': stack.push(v)
				case '>': if(!stack.pop().equals('<')) error = 25137
				case ')': if(!stack.pop().equals('(')) error = 3
				case '}': if(!stack.pop().equals('{')) error = 1197
				default: if(!stack.pop().equals('[')) error = 57
			}
		}
		error != 0
			? BigInteger.valueOf(-1)
			: {
			var score = BigInteger.valueOf(0)
			while (!stack.empty()) {
				var value = 0
				switch (stack.pop) {
					case '<': value = 4
					case '(': value = 1
					case '{': value = 3
					default: value = 2
				}
				score = BigInteger.valueOf(5).multiply(score).add(BigInteger.valueOf(value))
			}
			score
		}
	}
}
