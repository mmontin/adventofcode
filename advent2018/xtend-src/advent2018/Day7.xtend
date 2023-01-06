package advent2018

import adventutils.input.InputLoader

class Day7 {

	def static void main(String[] args) {

		val dependencies = new InputLoader(2018, 7).getInputs [
			val split = it.split(" ")
			split.get(1) -> split.get(7)
		]

		val letters = dependencies.fold(newHashSet) [ acc, v |
			acc.add(v.key)
			acc.add(v.value)
			acc
		]

		val completed = newArrayList

		while (!letters.isEmpty) {
			var next = letters.filter [ step |
				dependencies.filter[it.value == step].fold(true) [ acc, v |
					acc && completed.contains(v.key)
				]
			].sort.head
			letters.remove(next)
			completed.add(next)
		}

		println(completed.join)

		val letters_2 = dependencies.fold(newHashSet) [ acc, v |
			acc.add(v.key)
			acc.add(v.value)
			acc
		]

		val completed_2 = newArrayList

		// For part 2 we are gonna invert the role of completed and letters
		val inProgress = newHashMap
		var time = 0

		while (!letters_2.isEmpty) {
			// let's find the letters that can be crafted
			// and add them to the in progress elements
			letters_2.filter [ step |
				dependencies.filter[it.value == step].fold(true) [ acc, v |
					acc && completed_2.contains(v.key)
				]
			].sort.take(5 - inProgress.size).forEach [
				letters_2.remove(it)
				inProgress.put(it, it.charAt(0) as int - 4)
			]

			// Now it's time to jump to the next point in time when
			// at least a letter will become craftable and to update durations
			val next_craftables = inProgress.entrySet.groupBy[value].entrySet.minBy[key]
			time += next_craftables.key
			next_craftables.value.forEach[
				completed_2.add(it.key)
				inProgress.remove(it.key)
			]
			inProgress.keySet.forEach[inProgress.put(it,inProgress.get(it) - next_craftables.key)]
		}
		
		println(time)
	}
}
