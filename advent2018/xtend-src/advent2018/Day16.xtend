package advent2018

import adventutils.input.InputLoader
import java.util.ArrayList
import java.util.List

class Day16 {

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

		var engine = new MiniLang(newArrayList(0, 0, 0, 0))

		for (c : all_commands) {
			val indices = c.split(" ").map[Integer.parseInt(it)]
			engine.execute(rules.get(indices.get(0)).head, indices.get(1), indices.get(2), indices.get(3))
		}

		println(engine.registry.get(0))
	}

	def static stringToList(String s) {
		s.substring(1, s.length - 1).split(", ").map[Integer.parseInt(it)]
	}

	def static possible(List<Integer> command, List<Integer> before, List<Integer> after) {
		val a = command.get(1)
		val b = command.get(2)
		val c = command.get(3)
		MiniLang.instructions.fold(newHashSet) [ acc, v |
			val input = new ArrayList(before)
			val engine = new MiniLang(input)
			engine.execute(v, a, b, c)
			if (engine.registry.equals(after))
				acc.add(v)
			acc
		]
	}
}
