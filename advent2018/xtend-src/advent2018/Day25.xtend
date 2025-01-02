package advent2018

import adventutils.Grouper
import adventutils.input.InputLoader

class Day25 {
	def static void main(String[] args) {
		println(Grouper.groupFromMembers(new InputLoader(2018, 25).inputs.map [
			it.split(",").map[Integer.parseInt(it)]
		], false) [ q1, q2 |
			Math.abs(q1.get(0) - q2.get(0)) + Math.abs(q1.get(1) - q2.get(1)) + Math.abs(q1.get(2) - q2.get(2)) +
				Math.abs(q1.get(3) - q2.get(3)) <= 3
		].size)
	}
}
