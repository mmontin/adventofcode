package advent2016.puzzle22

class Node {
	int size
	int used

	new(int size_, int used_) {
		size = size_
		used = used_
	}

	new(String size_, String used_) {
		this(
			Integer::parseInt(size_.substring(0, size_.length - 1)),
			Integer::parseInt(used_.substring(0, used_.length - 1))
		)
	}

	def avail() {
		size - used
	}

	def percent() {
		(used as double / size * 100) as int
	}

	def isEmpty() {
		used == 0
	}

	def wouldFitIn(Node other) {
		used <= other.avail
	}

	override toString() {
		"Size: " + size + "T ; Used: " + used + "T ; Avail: " + avail + "T ; Use%: " + percent + "%"
	}
}
