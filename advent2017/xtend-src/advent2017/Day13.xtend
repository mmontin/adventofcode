package advent2017

import java.util.Map
import adventutils.input.InputLoader

class Day13 {

	static final Map<Integer, Integer> firewalls = new InputLoader(2017, 13).inputs.fold(newHashMap) [ acc, line |
		val split = line.split(": ").map[Integer.parseInt(it)]
		acc.put(split.get(0), split.get(1))
		acc
	]

	static final int last_layer = firewalls.keySet.max

	def static void main(String[] args) {
		var score = 0
		var position = 0
		while (position <= last_layer) {
			if (firewalls.containsKey(position)) {
				// The depth of the current firewall
				val current_size = firewalls.get(position)
				if (scanner_depth(current_size, position) == 0)
					score += position * current_size
			}
			position++
		}
		println(score)

		var delay = 0
		while (!delay.valid)
			delay++
		println(delay)
	}

	def static scanner_depth(int depth, int time) {
		// The length of the circle 0 .. current_size-1 .. 1
		val possible_depths = (depth - 1) * 2
		// The position of the scanner within these possible depths
		var scanner_depth = time % possible_depths
		// The value only matches the position when < current_size, otherwise it needs flipping
		if (scanner_depth >= depth)
			scanner_depth = possible_depths - scanner_depth
		scanner_depth
	}

	def static boolean valid(int delay) {
		firewalls.entrySet.fold(true) [acc,firewall|
			acc && scanner_depth(firewall.value,delay+firewall.key) != 0
		]
	}
}
