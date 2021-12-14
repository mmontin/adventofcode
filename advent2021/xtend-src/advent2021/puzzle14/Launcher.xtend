package advent2021.puzzle14

import advent2021.Utils
import java.util.HashSet
import java.util.Map
import java.util.Set

class Launcher {

	static final int nb_of_steps = 40

	static final String sample = "CVKKFSSNNHNPSPPKBHPB"

	static final Map<String, Set<String>> transformations = Utils.getInputs(14).fold(newHashMap) [ trans, v |
		val split = v.split(" -> ")
		val left = split.get(0)
		val right = split.get(1)
		trans.put(left, newHashSet(left.substring(0, 1) + right, right + left.substring(1, 2)))
		trans
	]

	static final Set<Character> set_of_letters = transformations.entrySet.fold(newHashSet) [ set, e |
		set.addAll(e.key.toCharArray)
		set.addAll(e.value.get(0).toCharArray)
		set.addAll(e.value.get(1).toCharArray)
		set
	]

	def static void main(String[] args) {

		val sample_mapped = newHashMap
		for (i : 0 .. sample.length - 2)
			sample_mapped.merge(sample.substring(i, i + 2), 1L)[v, w|v + w]

		for (i : 0 ..< nb_of_steps) {
			val entrySet = new HashSet(sample_mapped.entrySet)
			sample_mapped.clear
			entrySet.forEach [ e |
				transformations.get(e.key).forEach [ s |
					sample_mapped.merge(s, e.value)[v, w|v + w]
				]
			]
		}

		val occurrences = set_of_letters.map[it].map [ c |
			(sample_mapped.entrySet.fold(0L)[nb, e|nb + e.key.chars.filter[it == c].count * e.value] +
				((c == sample.charAt(0) || c == sample.charAt(sample.length - 1)) ? 1 : 0)) / 2
		].sort

		println(occurrences.last - occurrences.get(0))
	}
}
