package advent2019

import adventutils.input.InputLoader
import java.util.List
import java.util.Map

class Day14 {

	static final Map<String, Pair<Integer, List<Pair<String, Integer>>>> reactions = new InputLoader(2019, 14).inputs.
		fold(newHashMap) [ reactions, line |
			val split = line.split(" => ")
			val target = split.get(1).split(" ")
			val target_component = target.get(1)
			val target_amount = Integer.parseInt(target.get(0))
			val components = split.get(0).split(", ").map [
				val component = it.split(" ")
				component.get(1) -> Integer.parseInt(component.get(0))
			].toList
			reactions.put(target_component, target_amount -> components)
			reactions
		]

	static final Long ORE = 1000000000000L
	static final Map<String, Long> leftovers = newHashMap

	def static void initLeftovers() {
		leftovers.clear()
		leftovers.put("ORE", ORE)
	}

	def static void main(String[] args) {
		initLeftovers
		populate("FUEL", 1)
		val res1 = ORE - leftovers.get("ORE")
		println("Part 1: " + res1)

		var long min_bound = 0
		var long max_bound = 2 * ORE / res1
		while (min_bound != max_bound) {
			initLeftovers
			val long current = min_bound + Math.ceilDiv(max_bound - min_bound, 2)
			populate("FUEL", current)
			val res2 = leftovers.getOrDefault("ORE", 0L)
			if (res2 < 0)
				max_bound = current - 1
			else
				min_bound = current
		}
		println("Part 2: " + max_bound)
	}

	def static void populate(String component, long requirement) {
		val surplus = leftovers.getOrDefault(component, 0L) - requirement
		val reaction = reactions.get(component)
		if (surplus >= 0 || reaction === null)
			leftovers.put(component, surplus)
		else {
			val quantity_produced = reaction.key
			val reactives = reaction.value
			val quantity_needed = - surplus
			val number_of_reactions = Math.ceilDiv(quantity_needed, quantity_produced)
			val new_surplus = number_of_reactions * quantity_produced - quantity_needed
			if (new_surplus != 0)
				leftovers.put(component, new_surplus)
			else
				leftovers.remove(component)
			reactives.forEach[r|populate(r.key, r.value * number_of_reactions)]
		}
	}
}
