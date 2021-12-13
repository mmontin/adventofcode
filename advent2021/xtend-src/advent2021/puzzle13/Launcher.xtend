package advent2021.puzzle13

import advent2021.Utils
import java.util.HashSet

class Launcher {
	def static void main(String[] args) {
		val input = Utils.getInputs(13)
		val index = input.indexOf("")

		val dots = input.take(index).map[new Coordinates(it)].toSet

		input.drop(index + 1).forEach [
			var split = it.split(" ").get(2).split("=")
			val ch = split.get(0)
			val offset = Integer::parseInt(split.get(1))
			val duplicates = new HashSet(dots)
			duplicates.forEach [
				if (ch.equals("x") && it.x > offset) {
					dots.add(it.symByX(offset))
					dots.remove(it)
				} else if (ch.equals("y") && it.y > offset) {
					dots.add(it.symByY(offset))
					dots.remove(it)
				}
			]
		]

		for (j : 0 .. dots.maxBy[y].y) {
			for (i : 0 .. dots.maxBy[x].x)
				print(dots.contains(new Coordinates(i,j)) ? "0" : " ")
			println
		}
	}
}
