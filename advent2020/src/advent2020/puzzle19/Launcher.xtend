package advent2020.puzzle19

import adventutils.input.InputLoader
import java.util.ArrayList
import java.util.HashMap
import java.util.List

class Launcher {

	static final HashMap<Integer, List<List<Integer>>> all_rules = newHashMap
	static Integer rule_a = null
	static Integer rule_b = null

	def static void main(String[] args) {

		val lines = new InputLoader(2020, 19).inputs
		val empty_line = lines.indexOf("")
		val rules = lines.subList(0, empty_line)
		val words = lines.subList(empty_line + 1, lines.size)

		for (r : rules) {
			val split = r.split(": ")
			val number = Integer.parseInt(split.get(0))
			val matches = split.get(1)

			switch (matches) {
				case "\"a\"":
					rule_a = number
				case "\"b\"":
					rule_b = number
				default:
					all_rules.put(number, matches.split(" \\| ").map[it.split(" ").map[Integer.parseInt(it)]])
			}
		}

		println(words.filter[it.matches(newArrayList(0))].size)

		all_rules.put(8, newArrayList(newArrayList(42), newArrayList(42, 8)))
		all_rules.put(11, newArrayList(newArrayList(42, 31), newArrayList(42, 11, 31)))

		println(words.filter[it.matches(newArrayList(0))].size)
	}

	static def boolean matches(String word, List<Integer> rules) {
		switch (r: rules.head) {
			case null:
				word.isEmpty
			case word.isEmpty:
				false
			case rule_a:
				word.startsWith("a") ? matches(word.substring(1), rules.drop(1).toList) : false
			case rule_b:
				word.startsWith("b") ? matches(word.substring(1), rules.drop(1).toList) : false
			default: {
				all_rules.get(r).findFirst [
					val next_rules = new ArrayList(it)
					next_rules.addAll(rules.drop(1))
					matches(word, next_rules)
				] !== null
			}
		}
	}
}
