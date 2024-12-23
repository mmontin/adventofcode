package advent2024

import adventutils.input.InputLoader

class Day22 {

	def static void main(String[] args) {

		val numbers = new InputLoader(2024, 22).inputs.fold(newArrayList) [ acc, el |
			var current = Long.parseLong(el)
			val current_list = newArrayList(current)
			acc.add(current_list)
			for (i : 1 .. 2000)
				current_list.add(current = current.next_secret_number)
			acc
		]

		println(numbers.fold(0L)[acc, el|acc + el.last])

		val sequences = numbers.fold(newHashMap) [ acc, el |
			val known_sequences = newHashSet
			for (i : 0 .. 1990) {
				val current_i = el.get(i) % 10
				val current_i1 = el.get(i + 1) % 10
				val current_i2 = el.get(i + 2) % 10
				val current_i3 = el.get(i + 3) % 10
				val current_i4 = el.get(i + 4) % 10
				val current_sequence = "" + (current_i1 - current_i) + (current_i2 - current_i1) +
					(current_i3 - current_i2) + (current_i4 - current_i3)
				if (!known_sequences.contains(current_sequence)) {
					acc.merge(current_sequence, current_i4)[x, y|x + y]
					known_sequences.add(current_sequence)
				}
			}
			acc
		]

		println(sequences.entrySet.maxBy[value].value)
	}

	def static next_secret_number(long secret_number) {
		var res = secret_number
		res = res.bitwiseXor(res * 64L) % 16777216
		res = res.bitwiseXor(res / 32L) % 16777216
		res.bitwiseXor(res * 2048L) % 16777216
	}
}
