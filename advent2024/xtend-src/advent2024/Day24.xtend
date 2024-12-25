package advent2024

import adventutils.input.InputLoader
import java.util.Map

class Day24 {

	def static void main(String[] args) {

		val input = new InputLoader(2024, 24).inputs
		val split_index = input.indexOf("")

		val valuations = input.subList(0, split_index).fold(newHashMap) [ acc, el |
			val split = el.split(": ")
			acc.put(split.get(0), Integer.parseInt(split.get(1)))
			acc
		]

		val rules = input.subList(split_index + 1, input.size).fold(newHashSet)[acc, el|acc.add(new Link(el)); acc]

		val treated_rules = newHashMap

		while (!rules.isEmpty) {
			val rule = rules.findFirst[computable(valuations)]
			rule.compute(valuations)
			rules.remove(rule)
			treated_rules.put(rule.result, rule)
		}

		println(Long.parseLong(valuations.entrySet.filter [
			it.key.startsWith("z")
		].sortBy [
			-Integer.parseInt(key.substring(1))
		].map[value.toString].join, 2))

		println(treated_rules.get("z01"))
	}

	static class Link {

		String left
		String right
		String operator
		String result

		new(String s) {
			val split = s.split(" ")
			left = split.get(0)
			right = split.get(2)
			operator = split.get(1)
			result = split.get(4)
		}

		def computable(Map<String, Integer> valuations) {
			valuations.containsKey(left) && valuations.containsKey(right)
		}

		def compute(Map<String, Integer> valuations) {
			valuations.put(result, switch (operator) {
				case "AND": valuations.get(left).bitwiseAnd(valuations.get(right))
				case "OR": valuations.get(left).bitwiseOr(valuations.get(right))
				default: valuations.get(left).bitwiseXor(valuations.get(right))
			})
		}
		
		override toString() {
			"[ " + left + " " + operator + " " + right + " = " + result + " ]"
		}
	}
}
