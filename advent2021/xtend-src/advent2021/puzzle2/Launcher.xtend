package advent2021.puzzle2

import adventutils.input.InputLoader

class Launcher {
	def static void main(String[] args) {
		var depth = 0
		var length = 0
		var aim = 0
		for (split : new InputLoader(2021,2).getInputs[x | x.split(" ")]) {
			val v = Integer::parseInt(split.get(1))
			switch (split.get(0)) {
				case 'forward' : {
					length += v
					depth += v * aim
				}
				case 'down' : aim += v
				default : aim -= v
			}
		}
		print(depth * length)
	}
}