package adventutils.collection

import java.util.ArrayList
import java.util.List
import java.util.Set
import java.util.Collection
import org.eclipse.xtext.xbase.lib.Functions.Function2

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

	// Generates all pairs of elements in the input list (does not generate both (a,b) and (b,a))
	// while applying a certain function on the pair, collecting all results in a given collection 
	def static <E, R, C extends Collection<R>> C pairs(List<E> inputs, C whereTo, Function2<E, E, R> fun) {
		(0 ..< inputs.size).forEach [ i |
			val first = inputs.get(i)
			(i + 1 ..< inputs.size).forEach [ j |
				val second = inputs.get(j)
				whereTo.add(fun.apply(first, second))
			]
		]
		whereTo
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

	// Intertwine elements from two lists in all possible ways
	def static <T> Set<List<T>> intertwine(List<T> l1, List<T> l2) {
		if (l1.isEmpty)
			newHashSet(l2)
		else if (l2.isEmpty)
			newHashSet(l1)
		else {
			val head1 = l1.head
			val tail1 = l1.tail.toList
			val head2 = l2.head
			val tail2 = l2.tail.toList
			val res = newHashSet
			res.addAll(intertwine(tail1, l2).map[it.add(0, head1); it])
			res.addAll(intertwine(l1, tail2).map[it.add(0, head2); it])
			res
		}
	}
}
