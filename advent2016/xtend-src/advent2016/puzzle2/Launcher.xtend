package advent2016.puzzle2

import advent2016.Utils

class Launcher {

	def static void main(String[] args) {
		val input = Utils.getInputs(2)
		
		val outputs = newArrayList
		
		input.forEach[
			outputs.add(it.toCharArray.fold(outputs.isEmpty ? 5 : outputs.last) [ current , inst |
				switch (inst + '') {
					case 'L' : left(current)
					case 'R' : right(current)
					case 'U' : up(current)
					default : down(current)
				}
			])
		]
		
		println(Integer::toHexString((0..<outputs.size).fold(0)[v , i |
			v + Math.pow(16,i).intValue * outputs.get(outputs.size-i-1)
		]))
	}

	def static left(int i) {
		// i % 3 == 1 ? i : i - 1
		switch i {
			case 1, case 2, case 5, case 0xA, case 0xD : i
			default : i-1
		}
	}

	def static right(int i) {
		// i % 3 == 0 ? i : i + 1
		switch i {
			case 1, case 4, case 9, case 0xC, case 0xD : i
			default : i + 1
		}
	}

	def static up(int i) {
		// i <= 3 ? i : i - 3
		switch i {
			case 5, case 2, case 1, case 4, case 9 : i
			case 0xD, case 3 : i - 2
			default : i - 4
		}
	}

	def static down(int i) {
		// i > 6 ? i : i + 3
		switch i {
			case 5, case 0xA, case 0xD, case 0xC, case 9 : i
			case 1, case 0xB : i + 2
			default : i + 4
		}
	}
}
