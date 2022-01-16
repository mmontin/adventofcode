package advent2021.puzzle20

import adventutils.input.InputLoader
import java.util.Set
import adventutils.geometry.Coordinate

class Launcher {

	static Set<Integer> table = newHashSet

	def static void main(String[] args) {

		val ir = new InputLoader(2021,20).getInputReader
		val first = ir.readLine
		for (i : 0 ..< first.length)
			if ((first.charAt(i) + '').equals("#"))
				table.add(i)

		var ones = newHashSet

		var current = ir.readLine
		var i = 0
		while ((current = ir.readLine) !== null) {
			for (j : 0 ..< current.length)
				if ((current.charAt(j) + '').equals('#'))
					ones.add(new Coordinate(i, j))
			i++
		}

		val start_time = System.currentTimeMillis

		var flicker = 0
		for (rep : 0 ..< 50) {
			ones = step(ones,flicker)
			flicker = 1 - flicker
			if (rep == 1)
				println('PART 1: ' + ones.size)
		}

		println('PART 2: ' + ones.size)
		println('Computation time: ' + (System.currentTimeMillis - start_time) + 'ms')
	}

	def static step(Set<Coordinate> input, int flicker) {
		var minx = input.minBy[x].x
		var maxx = input.maxBy[x].x
		var miny = input.minBy[y].y
		var maxy = input.maxBy[y].y
		val output = newHashSet
		for (i : minx - 1 .. maxx + 1)
			for (j : miny - 1 .. maxy + 1) {
				var s = ''
				for (k : i - 1 .. i + 1)
					for (l : j - 1 .. j + 1)
						s += k < minx || k > maxx || l < miny || l > maxy
							? flicker : (input.contains(new Coordinate(k, l)) ? '1' : '0')
				if (table.contains(Integer::parseInt(s, 2)))
					output.add(new Coordinate(i, j))
			}
		output
	}
}
