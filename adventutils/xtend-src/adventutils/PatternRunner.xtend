package adventutils

import java.util.function.Function

class PatternRunner {

	def static <T> executeAndFindState(T initial, int rank, Function<T, T> fun) {
		val values = newArrayList
		var current = initial
		var i = 0
		var pos = -1
		while (pos == -1) {
			values.add(current)
			current = fun.apply(current)
			i ++
			pos = values.indexOf(current)
		}
		values.get((rank - pos) % (i - pos) + pos)
	}
}
