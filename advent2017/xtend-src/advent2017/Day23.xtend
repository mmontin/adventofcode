package advent2017

import adventutils.input.InputLoader
import java.util.List
import java.util.Map

class Day23 {

	static final List<List<String>> commands = new InputLoader(2017, 23).inputs.map[it.split(" ").toList]

	def static void main(String[] args) {

		val registers = newHashMap
		var position = 0
		var nb_of_mul = 0
		while (position >= 0 && position < commands.size) {
			var current = executeThisCommand(commands.get(position), registers, position)
			position = current.value
			if(current.key) nb_of_mul++
		}
		println(nb_of_mul)

		var x = 108400
		var non_prime = 0
		var int f
		do {
			f = 1
			for (d : 2 .. Math.sqrt(x) as int)
				if (x % d == 0)
					f = 0
			if (f == 0) non_prime ++
			x = x + 17
		} while (x <= 125400)
		println(non_prime)
		
	}

	def static executeThisCommand(List<String> l, Map<String, Long> registers, Integer position) {
		var int new_position = position
		var is_mul = false
		switch (l.get(0)) {
			case "set":
				registers.put(l.get(1), registers.getMeAValue(l.get(2)))
			case "sub":
				registers.put(l.get(1), registers.getMeAValue(l.get(1)) - registers.getMeAValue(l.get(2)))
			case "mul": {
				is_mul = true
				registers.put(l.get(1), registers.getMeAValue(l.get(1)) * registers.getMeAValue(l.get(2)))
			}
			default:
				if(registers.getMeAValue(l.get(1)) != 0) new_position += (registers.getMeAValue(l.get(2)) - 1) as int
		}
		is_mul -> new_position + 1
	}

	def static getMeAValue(Map<String, Long> registers, String s) {
		try
			Long.parseLong(s)
		catch (NumberFormatException nfe)
			registers.containsKey(s)
				? registers.get(s)
				: {
				registers.put(s, 0L)
				0L
			}
	}
}
