package advent2017

import adventutils.input.InputLoader
import java.util.ArrayList

class Day6 {

	def static void main(String[] args) {
		val initial_banks = new InputLoader(2017, 6).inputs.head.split("\\s+").map [
			Integer.parseInt(it)
		]
		val banks = new ArrayList(initial_banks)
		banks.update

		val known_configurations = newArrayList(initial_banks)

		while (!known_configurations.contains(banks)) {
			known_configurations.add(new ArrayList(banks))
			banks.update
		}

		println(known_configurations.size)
		println(known_configurations.size - known_configurations.indexOf(banks))
	}

	def static update(ArrayList<Integer> _banks) {
		val _size = _banks.size
		var toSpread = _banks.max
		var location = _banks.indexOf(toSpread)
		_banks.set(location, 0)
		while (toSpread > 0) {
			location = (location + 1) % _size
			_banks.set(location, _banks.get(location) + 1)
			toSpread--
		}
	}
}
