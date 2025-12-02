package adventutils

import java.util.ArrayList
import java.util.HashSet
import java.util.List
import java.util.Set
import org.eclipse.xtext.xbase.lib.Functions.Function2

// This class allows to group elements from a given set into subsets that share
// a given feature. There are 2 mods:
// - to join a subset, a new member must be connected to all existing members (all = true)
// - to join a subset, a new member must be connected to at least an existing member (all = false)
class Grouper<T> {

	def static <T> groupFromMembers(List<T> members, boolean all, Function2<T, T, Boolean> adjacency_fun) {

		val to_fill = all
				? {
				val res = new ArrayList(members.size * members.size)
				for (i : 0 ..< members.size) {
					val T left = members.get(i)
					for (right : members.subList(i + 1, members.size)) {
						adjacency_fun.apply(left, right)
						res.add(newHashSet(left, right))
					}
				}
				res
			}
				: members.map[newHashSet(it)].toList

		groupFromLists(to_fill, all, adjacency_fun)
	}

	def static <T> groupFromPairs(Set<Pair<T, T>> pairs, boolean all) {

		val List<HashSet<T>> to_fill = all
				? pairs.map[newHashSet(it.key, it.value)].toList
				: pairs.fold(newArrayList) [ acc, el |
				acc.add(newHashSet(el.key))
				acc.add(newHashSet(el.value))
				acc
			]

		groupFromLists(to_fill, all)[x, y|pairs.contains(x -> y) || pairs.contains(y -> x)]
	}

	// This function groups IN-PLACE and returns the same pointer 
	def static <T> groupFromLists(List<? extends Set<T>> to_fill, boolean all, Function2<T, T, Boolean> adjacency_fun) {
		var i = 0
		while (i < to_fill.size) {

			println(i)

			val ei = to_fill.get(i)
			val subei = to_fill.subList(i + 1, to_fill.size)

			var added = false

			if (all) {
				for (ej : subei)
					if (ei.forall [ e1 |
						ej.forall[e2|e2 == e1 || adjacency_fun.apply(e1, e2)]
					]) {
						ej.addAll(ei)
						added = true
					}
			} else {
				val ej = subei.findFirst [ ej |
					ei.exists [ e1 |
						ej.exists[e2|e2 == e1 || adjacency_fun.apply(e1, e2)]
					]
				]
				if (ej !== null) {
					ej.addAll(ei)
					added = true
				}
			}

			if(added) to_fill.remove(i--)
			i++
		}
		to_fill
	}
}
