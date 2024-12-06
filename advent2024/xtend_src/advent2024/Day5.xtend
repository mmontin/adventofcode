package advent2024

import adventutils.input.InputLoader

class Day5 {
	def static void main(String[] args) {

		// Parsing the input
		val inputs = new InputLoader(2024, 5).inputs
		val emptyInput = inputs.indexOf("")
		val rules = inputs.subList(0, emptyInput)

		// Creating the rule map, mapping each page with the set of pages that should appear after
		val ruleMap = newHashMap
		rules.forEach [
			val split = it.split("\\|")
			val left = Integer.parseInt(split.get(0))
			val right = Integer.parseInt(split.get(1))
			val present = ruleMap.getOrDefault(left, newHashSet)
			present.add(right)
			ruleMap.put(left, present)
		]

		// Creating the list of updates
		val changes = inputs.subList(emptyInput + 1, inputs.size).map[it.split(",").map[el|Integer.parseInt(el)]]

		// Generating the sum of middle values for correct updates, and the set of incorrect updates
		val sum1AndIncorrect = changes.fold(0 -> newHashSet) [ acc, el |
			if ((0 ..< el.size).fold(true) [ acc1, i |
				acc1 && (i + 1 ..< el.size).fold(true) [ acc2, j |
					acc2 && ruleMap.get(el.get(i)).contains(el.get(j))
				]
			])
				acc.key + el.get(el.size / 2) -> acc.value
			else {
				acc.value.add(el)
				acc
			}
		]
		
		// Printing the result for part 1
		println(sum1AndIncorrect.key)
		
		// Generating the sum of middle values for incorrect updates, by correcting them
		println(sum1AndIncorrect.value.fold(0)[acc, el |
			val toOrder = newHashSet
			toOrder.addAll(el)
			val ordered = newArrayList
			while (!toOrder.isEmpty) {
				val next = toOrder.findFirst[el1 | 
					val currentMap = ruleMap.get(el1)
					toOrder.forall[el2 | el1 == el2 || currentMap.contains(el2)]
				]
				ordered.add(next)
				toOrder.remove(next)
			}
			acc + ordered.get(ordered.size / 2)
		])
	}
}
