package advent2017

import adventutils.input.InputLoader

class Day5 {
	def static void main(String[] args) {

		val inputs = new InputLoader(2017, 5).getInputs[Integer.parseInt(it)]
		val offsets_size = inputs.size

		val offsets = newArrayList
		offsets.addAll(inputs)
		var position = 0
		var steps = 0
		while (position >= 0 && position < offsets_size) {
			val current_offset = offsets.get(position)
			offsets.set(position, current_offset + 1)
			position += current_offset
			steps++
		}
		println(steps)

		offsets.clear
		offsets.addAll(inputs)
		position = 0
		steps = 0
		while (position >= 0 && position < offsets_size) {
			val current_offset = offsets.get(position)
			offsets.set(position, current_offset >= 3 ? current_offset - 1 : current_offset + 1)
			position += current_offset
			steps++
		}
		println(steps)
	}
}
