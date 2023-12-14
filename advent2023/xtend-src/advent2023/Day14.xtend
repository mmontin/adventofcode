package advent2023

import adventutils.geometry.Coordinate
import adventutils.geometry.CoordinateSet
import adventutils.input.InputLoader
import java.util.ArrayList
import java.util.HashSet
import java.util.List

class Day14 {

	static final List<String> lines = {
		val output = new InputLoader(2023, 14).inputs
		output.add(0, "#".repeat(output.get(0).length))
		output.add("#".repeat(output.get(0).length))
		new ArrayList(output.map["#" + it + "#"])
	}

	static final int max_x = lines.size - 1
	static final int max_y = lines.get(0).length - 1

	static final CoordinateSet rolling = new CoordinateSet
	static final CoordinateSet steady = new CoordinateSet(lines, "O", rolling)

	def static void main(String[] args) {

		process(true, true)
		println(load)
		process(false, true)
		
		var cycles = newArrayList
		var current = new HashSet(rolling)
		var i = 0
		var pos = -1
		while (pos == -1) {
			cycles.add(current)
			i ++
			cycle
			current = new HashSet(rolling)
			pos = cycles.indexOf(current)
		}

		val equivalent = (999999999 - pos) % (i - pos) + pos + 1
		rolling.clear
		rolling.addAll(cycles.get(equivalent))
		println(load)
	}
	
	def static cycle() {
		process(true,true)
		process(true,false)
		process(false, true)
		process(false,false)
	}

	def static process(boolean up, boolean col) {
		(1 .. (col ? max_y : max_x) - 1).forEach[processCol(up, col)]
	}

	def static load() {
		rolling.fold(0) [ sum, el |
			sum + (max_x - el.x)
		]
	}

	def static processCol(int j, boolean up, boolean col) {

		val max = col ? max_x : max_y

		var last_wall = up ? 0 : max
		var nb_of_rollings = 0
		var i = up ? 1 : max - 1
		while (up ? i <= max : i >= 0) {
			val current = col ? new Coordinate(i, j) : new Coordinate(j, i)
			if (steady.contains(current)) {
				for (k : 0 ..< nb_of_rollings)
					rolling.add(
						col ? new Coordinate(last_wall + (up ? k + 1 : -k - 1), j) : new Coordinate(j,
							last_wall + (up ? k + 1 : -k - 1))
					)
				last_wall = col ? current.x : current.y
				nb_of_rollings = 0
			} else if (rolling.contains(current)) {
				nb_of_rollings++
				rolling.remove(current)
			}
			up ? i++ : i--
		}
	}
}
