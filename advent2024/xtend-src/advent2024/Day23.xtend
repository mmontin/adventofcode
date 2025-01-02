package advent2024

import adventutils.Grouper
import adventutils.input.InputLoader

class Day23 {
	def static void main(String[] args) {

		val groups = Grouper.groupFromPairs(new InputLoader(2024, 23).inputs.map [ el |
			val split = el.split("-")
			split.get(0) -> split.get(1)
		].toSet, true)

		println(groups.filter[it.size > 2 && it.exists[it.startsWith("t")]].fold(newHashSet) [ acc, el |
			val s = el.size
			for (i : 0 ..< s)
				for (j : i + 1 ..< s)
					for (k : j + 1 ..< s)
						if (el.get(i).startsWith("t") || el.get(j).startsWith("t") || el.get(k).startsWith("t"))
							acc.add(newHashSet(el.get(i), el.get(j), el.get(k)))
			acc
		].size)

		println(groups.maxBy[size].sort.join(","))
	}
}
