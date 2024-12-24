package advent2024

import adventutils.input.InputLoader
import java.util.ArrayList

class Day23 {
	def static void main(String[] args) {

		val pairs = new InputLoader(2024, 23).inputs.fold(newHashMap -> newArrayList) [ acc, el |
			val split = el.split("-")
			val e1 = split.get(0)
			val e2 = split.get(1)
			acc.key.merge(e1, newHashSet(e2))[x, y|x.addAll(y); x]
			acc.key.merge(e2, newHashSet(e1))[x, y|x.addAll(y); x]
			acc.value.add(newHashSet(e1, e2))
			acc
		]
		val all_ids = new ArrayList(pairs.key.keySet)

		val all_triplets = newHashSet
		for (i : 0 ..< all_ids.size) {
			val e1 = all_ids.get(i)
			for (j : i + 1 ..< all_ids.size) {
				val e2 = all_ids.get(j)
				for (k : j + 1 ..< all_ids.size) {
					val e3 = all_ids.get(k)
					if (pairs.key.get(e1).contains(e2) && pairs.key.get(e1).contains(e3) &&
						pairs.key.get(e2).contains(e3))
						if (e1.startsWith("t") || e2.startsWith("t") || e3.startsWith("t"))
							all_triplets.add(#{e1, e2, e3})
				}
			}
		}

		println(all_triplets.size)

		for (i : 0 ..< pairs.value.size)
			for (j : i + 1 ..< pairs.value.size)
				if (pairs.value.get(i).forall [ e1 |
					pairs.value.get(j).forall [ e2 |
						e2 == e1 || pairs.key.get(e1).contains(e2)
					]
				])
					pairs.value.get(j).addAll(pairs.value.get(i))

		println(pairs.value.maxBy[size].sort.join(","))
	}
}
