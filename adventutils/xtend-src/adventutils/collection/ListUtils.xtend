package adventutils.collection

import java.util.ArrayList
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

	def static <E> List<ArrayList<E>> permute(List<E> inputs) {
		val result = newArrayList

		if (inputs !== null) {
			val s1 = inputs.size();

			if (s1 > 0) {
				val iter = inputs.iterator
				while (iter.hasNext) {
					val elt = iter.next
					val index = inputs.indexOf(elt)
					val list2 = new ArrayList(inputs.subList(0, index))
					list2.addAll(inputs.subList(index + 1, s1))
					permute(list2).forEach [
						it.add(0, elt)
						result.add(it)
					]
				}
			} else
				result.add(new ArrayList)
		}

		return result;
	}
}
