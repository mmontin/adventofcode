package advent2017

class Day17 {

	static final int STEP = 304

	def static void main(String[] args) {

		val buffer = newArrayList(0)
		var current_position = 0

		for (i : 1 .. 2017)
			buffer.add(current_position = ((current_position + STEP) % i) + 1, i)

		println(buffer.get((current_position + 1) % buffer.size))

		var second = 0
		current_position = 0
		for (i : 1 .. 50000000)
			if ((current_position = (current_position + STEP) % i + 1) == 1) second = i

		println(second)
	}
}
