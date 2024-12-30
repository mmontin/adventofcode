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

		val rules = input.subList(split_index + 1, input.size).fold(newHashSet -> 0) [ acc, el |
			acc.key.add(new Link(el, acc.value))
			acc.key -> acc.value + 1
		].key

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

		val edges = valuations.keySet.fold(newArrayList) [ acc, el |
			val left_node = treated_rules.values.findFirst[result == el]
			val left_node_name = left_node === null ? el : left_node.operator + "_" + left_node.id
			val right_nodes = treated_rules.values.filter[left == el || right == el].map[operator + "_" + id + ""]
			val right_nodes_names = right_nodes.size == 0 ? #[el] : right_nodes
			right_nodes_names.forEach[acc.add(left_node_name + " -> " + it + " [label=\"" + el + "\"]")]
			acc
		]

		val graph = edges.fold("digraph {\n")[acc, el|acc + "\t" + el + ";\n"] + "}"

		new ProcessBuilder("/bin/sh", "-c", "echo \"" + graph + "\"> ./xtend-src/advent2024/graph.svg").start

		println(#["z08","thm","wss","wrm","hwq","z22","gbs","z29"].sort.join(","))
	}

	static class Link {

		int id
		String left
		String right
		String operator
		String result

		new(String s, int id_) {
			val split = s.split(" ")
			left = split.get(0)
			right = split.get(2)
			operator = split.get(1)
			result = split.get(4)
			id = id_
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
