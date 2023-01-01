package advent2017

import java.util.Set

class Day25 {

	static String state = "A"
	static int position = 0
	static Set<Integer> ons = newHashSet

	def static void main(String[] args) {
		
		(0..<12683008).forEach[step]
		println(ons.size)
	}

	def static void step() {
		switch state {
			case "A": {
				if (!ons.contains(position)) {
					ons.add(position)
					position++
					state = "B"
				} else {
					ons.remove(position)
					position--
					state = "B"
				}
			}
			case "B": {
				if (!ons.contains(position)) {
					ons.add(position)
					position--
					state = "C"
				} else {
					ons.remove(position)
					position++
					state = "E"
				}
			}
			case "C": {
				if (!ons.contains(position)) {
					ons.add(position)
					position++
					state = "E"
				} else {
					ons.remove(position)
					position--
					state = "D"
				}
			}
			case "D": {
				if (!ons.contains(position)) {
					ons.add(position)
					position--
					state = "A"
				} else {
					position--
					state = "A"
				}
			}
			case "E": {
				if (!ons.contains(position)) {
					position++
					state = "A"
				} else {
					ons.remove(position)
					position++
					state = "F"
				}
			}
			default: {
				if (!ons.contains(position)) {
					ons.add(position)
					position++
					state = "E"
				} else {
					position++
					state = "A"
				}
			}
		}
	}
}
