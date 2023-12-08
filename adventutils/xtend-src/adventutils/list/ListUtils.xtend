package adventutils.list

import java.util.List

class ListUtils {

	def static <T, L extends List<T>> L cons(T e, L l) {
		l.add(e);
		l
	}

	def static <T, U extends List<T>, V extends T> T getOrDefault(U input, V value) {
		val index = input.indexOf(value)
		if (index >= 0)
			input.get(index)
		else {
			input.add(value)
			value
		}
	}
}
