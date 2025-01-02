package adventutils

import java.util.Collection
import java.util.HashSet
import java.util.List
import java.util.Set
import org.eclipse.xtext.xbase.lib.Functions.Function2

// This class allows to group elements from a given set into subsets that share
// a given feature. There are 2 mods:
// - to join a subset, a new member must be connected to all existing members (all = true)
// - to join a subset, a new member must be connected to at least an existing member (all = false)
class Grouper<T> {

	def static <T> groupFromMembers(Collection<T> members, boolean all, Function2<T, T, Boolean> adjacency_fun) {

		val to_fill = all
				? {
				val res = newArrayList
				for (i : 0 ..< members.size) {
					val T left = members.get(i)
					for (j : i + 1 ..< members.size) {
						val T right = members.get(j)
						if (adjacency_fun.apply(left, right))
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
			var added = false

			if (all) {
				for (j : i + 1 ..< to_fill.size)
					if (to_fill.get(i).forall [ e1 |
						to_fill.get(j).forall[e2|e2 == e1 || adjacency_fun.apply(e1, e2)]
					]) {
						to_fill.get(j).addAll(to_fill.get(i))
						added = true
					}
			} else {
				val current_i = i
				val index = (current_i + 1 ..< to_fill.size).findFirst [ j |
					to_fill.get(current_i).exists [ e1 |
						to_fill.get(j).exists[e2|e2 == e1 || adjacency_fun.apply(e1, e2)]
					]
				]
				if (index !== null) {
					to_fill.get(index).addAll(to_fill.get(i))
					added = true
				}
			}

			if(added) to_fill.remove(i--)
			i++
		}
		to_fill
	}
}
