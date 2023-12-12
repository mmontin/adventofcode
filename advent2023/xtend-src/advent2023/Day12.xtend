package advent2023

import adventutils.input.InputLoader
import java.util.List
import java.util.Map

class Day12 {

	def static void main(String[] args) {

		val inputs = new InputLoader(2023, 12).inputs.map [
			val split = it.split(" ")
			split.get(0) -> split.get(1).split(",").map[Integer.parseInt(it)]
		]

		println(inputs.fold(0L)[acc, el|acc + el.key.count(el.value)])

		val inputs_mod = inputs.map [ el |
			val new_list = newArrayList;
			(0 .. 4).forEach[new_list.addAll(el.value)]
			(el.key + "?").repeat(4) + el.key -> new_list
		]

		println(inputs_mod.fold(0L)[acc, el|acc + el.key.count(el.value)])
	}

	def static fulls(String s, int size, int left_buffer, int right_buffer) {
		val output = newArrayList
		if (size <= s.length - left_buffer - right_buffer)
			(left_buffer .. s.length - size - right_buffer).forEach [
				if (s.substring(it, it + size).full)
					output.add(s.substring(0, it) -> s.substring(it, it + size).replaceAll("\\?", "#") ->
						s.substring(it + size))
			]
		output
	}

	def static empty(String s) {
		s.matches("[\\.]*")
	}

	def static possiblyEmpty(String s) {
		s.matches("[\\.\\?]*")
	}

	def static full(String s) {
		s.matches("[\\?#]+")
	}

	def static Integer minSize(List<Integer> input) {
		switch (input.size) {
			case 0:
				0
			case 1:
				input.get(0)
			default:
				(0 .. input.size - 2).fold(input.get(0)) [ acc, i |
					acc + 1 + input.get(i + 1)
				]
		}
	}

	def static breakList(List<Integer> input) {
		val max = input.max
		val max_pos = input.indexOf(input.max)
		input.subList(0, max_pos) -> max -> input.subList(max_pos + 1, input.size)
	}

	static final Map<Pair<String, List<Integer>>, Long> calls = newHashMap

	def static long count(String line, List<Integer> brokens) {

		var ans = switch (line) {
			case calls.containsKey(line -> brokens):
				calls.get(line -> brokens)
			case brokens.empty && line.possiblyEmpty:
				1L
			case brokens.empty || empty(line):
				0L
			default: {
				val splitted = breakList(brokens)
				val left = splitted.key.key
				val max = splitted.key.value
				val right = splitted.value

				fulls(line, max, left.minSize, right.minSize).fold(0L) [ acc, el |
					val left_string = el.key.key
					val right_string = el.value
					var left_possibilities = 0L
					if (!left_string.empty) {
						val last_left = left_string.substring(left_string.length - 1)
						val first_left = left_string.substring(0, left_string.length - 1)
						if (last_left.possiblyEmpty)
							left_possibilities += count(first_left, left)
					} else if (left.isEmpty)
						left_possibilities++

					var right_possibilities = 0L
					if (left_possibilities != 0)
						if (!right_string.empty) {
							val first_right = right_string.substring(0, 1)
							val last_right = right_string.substring(1)
							if (first_right.possiblyEmpty)
								right_possibilities += count(last_right, right)
						} else if (right.isEmpty)
							right_possibilities++

					acc + right_possibilities * left_possibilities
				]
			}
		}

		calls.put(line -> brokens, ans)
		ans
	}
}
