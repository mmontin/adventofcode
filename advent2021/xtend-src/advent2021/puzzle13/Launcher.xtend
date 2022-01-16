package advent2021.puzzle13

import adventutils.input.InputLoader
import java.util.HashSet
import adventutils.geometry.Coordinate

class Launcher {
	def static void main(String[] args) {
		val input = new InputLoader(2021,13).getInputs
		val index = input.indexOf("")

		val dots = input.take(index).map[new Coordinate(it)].toSet

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
				print(dots.contains(new Coordinate(i,j)) ? "0" : " ")
			println
		}
	}
}
