package advent2017

class Day17 {

	static final int STEP = 304

	def static void main(String[] args) {

		val buffer = newArrayList(0)
		var current_position = 0

		for (i : 1 .. 100) {
			current_position = (current_position + STEP) % buffer.size
			buffer.add(current_position + 1, i)
			current_position++
		}

		println(buffer.get((current_position + 1) % buffer.size))
		
		var second = 0
		current_position = 0
		for (i : 1..50000000) {
			current_position = (current_position + STEP) % i
			if (current_position == 0) second = i
			current_position ++
		}
		
		println(second)
	}
}
