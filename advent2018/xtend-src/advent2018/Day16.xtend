package advent2018

import adventutils.input.InputLoader
import java.util.ArrayList
import java.util.List
import java.util.Set

class Day16 {

	static final Set<String> instructions = newHashSet(
		"addr",
		"addi",
		"mulr",
		"muli",
		"borr",
		"bori",
		"banr",
		"bani",
		"setr",
		"seti",
		"gtir",
		"gtri",
		"gtrr",
		"eqir",
		"eqri",
		"eqrr"
	)

	def static void main(String[] args) {
		val br = new InputLoader(2018, 16).inputReader

		var i = 0
		var before = br.readLine
		var command = br.readLine
		var after = br.readLine
		br.readLine

		val rules = newHashMap

		while (!before.equals("")) {
			val my_command = command.split(" ").map[Integer.parseInt(it)]
			val possible_instructions = possible(
				my_command,
				before.split("Before: ").get(1).stringToList,
				after.split("After:  ").get(1).stringToList
			)
			if(possible_instructions.size >= 3) i++

			rules.merge(my_command.get(0), possible_instructions) [ u, v |
				u.retainAll(v)
				u
			]

			before = br.readLine
			command = br.readLine
			after = br.readLine
			br.readLine
		}

		val assigned = newHashSet

		var next = rules.values.findFirst[it.size == 1]
		while (next !== null) {
			val current_next = next.head
			rules.values.forEach [ v |
				if(v.size > 1) v.remove(current_next)
			]
			assigned.add(current_next)
			next = rules.values.findFirst[it.size == 1 && !assigned.contains(it.head)]
		}

		println(i)

		val all_commands = newArrayList(after)
		var current_line = br.readLine
		while (current_line !== null) {
			all_commands.add(current_line)
			current_line = br.readLine
		}

		br.close

		var initial_state = newArrayList(0, 0, 0, 0)
		for (c : all_commands) {
			val indices = c.split(" ").map[Integer.parseInt(it)]
			execute(rules.get(indices.get(0)).head, indices.get(1), indices.get(2), indices.get(3), initial_state)
		}

		println(initial_state.get(0))
	}

	def static stringToList(String s) {
		s.substring(1, s.length - 1).split(", ").map[Integer.parseInt(it)]
	}

	def static possible(List<Integer> command, List<Integer> before, List<Integer> after) {
		val a = command.get(1)
		val b = command.get(2)
		val c = command.get(3)
		instructions.fold(newHashSet) [ acc, v |
			val input = new ArrayList(before)
			execute(v, a, b, c, input)
			if (input.equals(after))
				acc.add(v)
			acc
		]
	}

	def static execute(String instr, int a, int b, int c, List<Integer> registry) {
		registry.set(c, switch instr {
			case "addr": registry.get(a) + registry.get(b)
			case "addi": registry.get(a) + b
			case "mulr": registry.get(a) * registry.get(b)
			case "muli": registry.get(a) * b
			case "borr": registry.get(a).bitwiseOr(registry.get(b))
			case "bori": registry.get(a).bitwiseOr(b)
			case "banr": registry.get(a).bitwiseAnd(registry.get(b))
			case "bani": registry.get(a).bitwiseAnd(b)
			case "setr": registry.get(a)
			case "seti": a
			case "gtir": a > registry.get(b) ? 1 : 0
			case "gtri": registry.get(a) > b ? 1 : 0
			case "gtrr": registry.get(a) > registry.get(b) ? 1 : 0
			case "eqir": a == registry.get(b) ? 1 : 0
			case "eqri": registry.get(a) == b ? 1 : 0
			case "eqrr": registry.get(a) == registry.get(b) ? 1 : 0
		})
	}
}
