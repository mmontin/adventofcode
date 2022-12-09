package advent2017

import java.util.Map
import adventutils.input.InputLoader
import advent2017.Day7.Tower

class Day7 {

	def static void main(String[] args) {

		val towers = newHashSet
		new InputLoader(2017, 7).inputs.forEach[towers.add(new Tower(it))]
		while (towers.size != 1) {
			val toPileUp = towers.findFirst[resolved]
			towers.remove(toPileUp)
			val container = towers.findFirst[content.containsKey(toPileUp.name)]
			container.update(toPileUp)
		}

		println(towers.head.name)

		var wrong = towers.head
		var should_be = 0
		while (wrong.content.values.groupBy[total_weight].size == 2) {
			val groups = wrong.content.values.groupBy[total_weight]
			should_be = groups.entrySet.findFirst[it.value.size > 1].key
			wrong = groups.values.findFirst[it.size == 1].head
		}

		println(should_be - wrong.content.values.fold(0)[acc, v|acc + v.total_weight])
	}

	static class Tower {

		String name
		int own_weight
		int total_weight
		Map<String, Tower> content

		new(String s) {
			val split = s.split(" -> ")
			content = newHashMap
			if(split.size > 1) split.get(1).split(", ").forEach[content.put(it, null)]
			val split1 = split.get(0).split(" ")
			name = split1.get(0)
			val sown_weight = split1.get(1)
			own_weight = Integer.parseInt(sown_weight.substring(1, sown_weight.length - 1))
			total_weight = own_weight
		}

		def boolean resolved() {
			content.values.forall[it !== null]
		}

		override int hashCode() {
			name.hashCode
		}

		override boolean equals(Object other) {
			(other as Tower).name == name
		}

		def update(Tower toPileUp) {
			content.put(toPileUp.name, toPileUp)
			total_weight += toPileUp.total_weight
		}
	}
}
