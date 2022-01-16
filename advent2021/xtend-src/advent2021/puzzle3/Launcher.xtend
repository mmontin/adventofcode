package advent2021.puzzle3

import adventutils.input.InputLoader
import java.util.ArrayList
import java.util.List

class Launcher {

	static class Pair {

		int nbOfZeros
		int nbOfOnes

		new() {
			nbOfZeros = 0
			nbOfOnes = 0
		}

		def add(char c) {
			(c + '') == '0' ? nbOfZeros++ : nbOfOnes++
			this
		}

		def most() {
			nbOfOnes >= nbOfZeros ? 1 : 0
		}
	}

	def static void main(String[] args) {

		val input = new InputLoader(2021,3).getInputs[toCharArray]

		// Exercice n°1
		val list = input.fold(new ArrayList<Pair>, [ v, l |
			if(v.isEmpty) (0 ..< l.size).forEach[v.add(new Pair)]
			for (i : 0 ..< l.size) v.get(i).add(l.get(i))
			v
		])

		println(Integer::parseInt(list.fold("", [v, l| v + l.most]), 2) * 
			Integer::parseInt(list.fold("", [ v, l | v + (1 - l.most)]), 2))

		// Exercice n°2
		println(Integer::parseInt(String::valueOf(helper(input, true)), 2) * 
			Integer::parseInt(String::valueOf(helper(input, false)), 2))
	}
	
	def static helper(List<char[]> input, boolean most) {
		var myL = new ArrayList(input)
		var i = 0
		while (i < input.get(0).size && myL.size > 1) {
			val loop = i
			val p = myL.fold(new Pair, [v, l|v.add(l.get(loop))])
			myL.removeIf([l|Integer::parseInt(String::valueOf(l.get(loop))) != (most ? p.most : 1 - p.most)])
			i++
		}
		myL.get(0)
	}
}
