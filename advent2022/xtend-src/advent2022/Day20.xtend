package advent2022

import adventutils.input.InputLoader
import java.util.ArrayList
import java.util.List

class Day20 {

	static final List<Long> raw_inputs = new InputLoader(2022, 20).inputs.map[Long.parseLong(it)]

	static List<MyLong> inputs = {
		val output = newArrayList;
		(0 ..< raw_inputs.size).forEach [
			output.add(new MyLong(it, raw_inputs.get(it)))
		]
		output
	}

	static final int inputs_size = inputs.size

	def static void main(String[] args) {

		var current = new ArrayList(inputs)
		oneRound(current)
		printResult(current)

		inputs = inputs.map[new MyLong(it.position, it.value * 811589153)]
		current = new ArrayList(inputs)
		for (i : 0 ..< 10)
			oneRound(current)
		printResult(current)
	}

	def static oneRound(List<MyLong> _current) {
		inputs.forEach [
			val current_position = _current.indexOf(it)
			_current.remove(current_position)
			var new_position = (current_position + it.value) % (inputs_size - 1)
			if(new_position < 0) new_position = inputs_size - 1 + new_position
			_current.add(new_position as int, it)
		]
	}

	def static printResult(List<MyLong> _current) {
		val index = _current.indexOf(_current.findFirst[it.value == 0])
		val value1 = _current.get((index + 1000) % inputs_size)
		val value2 = _current.get((index + 2000) % inputs_size)
		val value3 = _current.get((index + 3000) % inputs_size)
		println(value1.value + value2.value + value3.value)
	}

	static class MyLong {

		int position
		long value

		new(int _position, long _value) {
			position = _position
			value = _value
		}

		def multiplyBy(long l) {
			value = value * l
		}

		override hashCode() {
			position * value.hashCode
		}

		override equals(Object other) {
			switch other {
				MyLong: other.position == position && other.value == value
				default: false
			}
		}
	}
}
